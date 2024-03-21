import 'dart:io';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:common/common.dart';
import 'package:dimensions_theme/dimensions_theme.dart';
import 'package:firebaseBasic_assets/firebaseBasic_assets.dart';
import 'package:firebase_apk/dragdrop/drag_drop.dart';
import 'package:firebase_apk/mobile_screen/mobile_screen.dart';
import 'package:firebase_apk/second_screen/second_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../utils/constant.dart';
import 'package:flutter/foundation.dart' show kDebugMode, kIsWeb;
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:shimmer_animation/shimmer_animation.dart';
import 'package:external_app_launcher/external_app_launcher.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart' as path;
import 'package:image_picker/image_picker.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  bool _isLoggedIn = false;
  Map userLogin = {};

  FirebaseStorage storage = FirebaseStorage.instance;

  Future<void> _upload(String inputSource) async {
    final picker = ImagePicker();
    XFile? pickedImage;
    try {
      pickedImage = await picker.pickImage(
          source: inputSource == 'camera'
              ? ImageSource.camera
              : ImageSource.gallery,
          maxWidth: 1920);

      final String fileName = path.basename(pickedImage!.path);
      File imageFile = File(pickedImage.path);

      try {
        // Uploading the selected image with some custom meta data
        await storage.ref(fileName).putFile(
            imageFile,
            SettableMetadata(customMetadata: {
              'uploaded_by': 'A bad guy',
              'description': 'Some description...'
            }));

        // Refresh the UI
        setState(() {});
      } on FirebaseException catch (error) {
        if (kDebugMode) {
          print(error);
        }
      }
    } catch (err) {
      if (kDebugMode) {
        print(err);
      }
    }
  }

  Future<List<Map<String, dynamic>>> _loadImages() async {
    List<Map<String, dynamic>> files = [];

    final ListResult result = await storage.ref().list();
    final List<Reference> allFiles = result.items;

    await Future.forEach<Reference>(allFiles, (file) async {
      final String fileUrl = await file.getDownloadURL();
      final FullMetadata fileMeta = await file.getMetadata();
      files.add({
        "url": fileUrl,
        "path": file.fullPath,
        "uploaded_by": fileMeta.customMetadata?['uploaded_by'] ?? 'Nobody',
        "description":
            fileMeta.customMetadata?['description'] ?? 'No description'
      });
    });

    return files;
  }

  // Delete the selected image
  // This function is called when a trash icon is pressed
  Future<void> _delete(String ref) async {
    await storage.ref(ref).delete();
    // Rebuild the UI
    setState(() {});
  }

  static const colorizeColors = [
    Colors.purple,
    Colors.blue,
    Colors.yellow,
    Colors.red,
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final padding = EdgeInsetsOf(context);
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: AnimatedTextKit(
            animatedTexts: [
              ColorizeAnimatedText(Constant.firebaseBasic, textStyle: TextStyle(fontSize: 30), colors: colorizeColors),
            ],
          ),
        ),
      ),
      // centerTitle: true,
      body: SingleChildScrollView(
        child: Padding(
          padding: padding.all(Dimensions.medium),
          child: Shimmer(
            duration: Duration(seconds: 3),
            color: Colors.white,
            child: Column(
              children: [
                Lottie.asset(
                  FirebaseBasicAssets.lottie.welcome.keyName,
                  width: MediaQuery.sizeOf(context).width,
                  height: MediaQuery.sizeOf(context).height / 2,
                ),
                SubmitButton(
                  onPressed: () async {
                    User? user =
                        await Authentication.signInWithGoogle(context: context);

                    if (user != null) {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => SecondScreen(
                            user: user,
                            otpController: '',
                            phoneController: '',
                          ),
                        ),
                      );
                    }
                  },
                  isLoading: false,
                  childWidget: Text(Constant.google),
                ),
                Space(Dimensions.small),
                SubmitButton(
                  onPressed: () {
                    FacebookAuth.instance.login(
                        permissions: ['public_profile', 'email']).then((value) {
                      FacebookAuth.instance
                          .getUserData()
                          .then((userData) async {
                        setState(() {
                          _isLoggedIn = true;
                          userLogin = userData;
                        });
                      });
                    });
                  },
                  isLoading: false,
                  childWidget: Text(Constant.facebook),
                ),
                Space(Dimensions.small),
                SubmitButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (context) => MobileScreen(),
                      ),
                    );
                  },
                  isLoading: false,
                  childWidget: Text(Constant.mobile),
                ),
                Space(Dimensions.small),
                SubmitButton(
                    onPressed: () async {
                      await LaunchApp.openApp(
                        androidPackageName: 'com.instagram.android',
                        openStore: true,
                      );
                    },
                    isLoading: false,
                    childWidget: Text('Instagram')),
                Space(Dimensions.small),
                SubmitButton(
                    onPressed: () {
                      _upload('camera');
                    },
                    isLoading: false,
                    childWidget: Text('camera')),
                Space(Dimensions.small),
                SubmitButton(
                    onPressed: () {
                      _upload('gallery');
                    },
                    isLoading: false,
                    childWidget: Text('Gallery'),
                ),
                Space(Dimensions.small),
                SubmitButton(
                  onPressed: () {
                    Navigator.push(context, CupertinoPageRoute(builder: (context)=>const DragDrop()));
                  },
                  isLoading: false,
                  childWidget: Text('Drag&Drop'),
                ),

                // FutureBuilder(
                //     future: _loadImages(),
                //     builder: (context,
                //         AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
                //       if (snapshot.connectionState == ConnectionState.done) {
                //         return ListView.builder(
                //           itemBuilder: (context, index) {
                //             final Map<String, dynamic> image =
                //                 snapshot.data![index];
                //             return Card(
                //               child: ListTile(
                //                 leading: Image.network(image['url']),
                //                 title: Text(image['uploaded_by']),
                //                 subtitle: Text(image['description']),
                //                 trailing: IconButton(
                //                   onPressed: () => _delete(image['path']),
                //                   icon: const Icon(
                //                     Icons.delete,
                //                     color: Colors.red,
                //                   ),
                //                 ),
                //               ),
                //             );
                //           },
                //           itemCount: snapshot.data?.length ?? 0,
                //           );
                //       }
                //       return const Center(
                //         child: CircularProgressIndicator(),
                //       );
                //     }
                //     )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Authentication {
  static Future<User?> signInWithGoogle({required BuildContext context}) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;

    final GoogleSignIn googleSignIn = GoogleSignIn();

    final GoogleSignInAccount? googleSignInAccount =
        await googleSignIn.signIn();

    if (googleSignInAccount != null) {
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      try {
        final UserCredential userCredential =
            await auth.signInWithCredential(credential);

        user = userCredential.user;
      } on FirebaseAuthException catch (e) {
        if (e.code == 'account-exists-with-different-credential') {
          ScaffoldMessenger.of(context).showSnackBar(
            Authentication.customSnackBar(
              content:
                  'The account already exists with a different credential.',
            ),
          );
        } else if (e.code == 'invalid-credential') {
          ScaffoldMessenger.of(context).showSnackBar(
            Authentication.customSnackBar(
              content: 'Error occurred while accessing credentials. Try again.',
            ),
          );
        }
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          Authentication.customSnackBar(
            content: 'Error occurred using Google Sign-In. Try again.',
          ),
        );
      }
    }

    return user;
  }

  static SnackBar customSnackBar({required String content}) {
    return SnackBar(
      backgroundColor: Colors.black,
      content: Text(
        content,
        style: TextStyle(color: Colors.redAccent, letterSpacing: 0.5),
      ),
    );
  }

  static Future<void> signOut({required BuildContext context}) async {
    final GoogleSignIn googleSignIn = GoogleSignIn();

    try {
      if (!kIsWeb) {
        await googleSignIn.signOut();
      }
      await FirebaseAuth.instance.signOut();
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        Authentication.customSnackBar(
          content: 'Error signing out. Try again.',
        ),
      );
    }
  }
}

class FacebookAuthentication {
  static Future<User?> signInWithFacebook(
      {required BuildContext context}) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    Map userLogin = {};
    bool _isLoggedIn = false;

    FacebookAuth.instance
        .login(permissions: ['public_profile', 'email']).then((value) {
      FacebookAuth.instance.getUserData().then((userData) async {
        _isLoggedIn = true;
        userLogin = userData;
      });
    });
  }
}
