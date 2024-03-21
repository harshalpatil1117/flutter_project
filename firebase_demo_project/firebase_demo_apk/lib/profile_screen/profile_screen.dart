import 'package:common/common.dart';
import 'package:dimensions_theme/dimensions_theme.dart';
import 'package:firebase_demo_apk/model/user_model.dart' as localUser;
import 'package:firebase_demo_apk/user_auth/firebase_auth_service.dart';
import 'package:firebase_demo_apk/utlis/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

import '../login_screen/login_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key, required this.keyy});

  final String keyy;

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final DatabaseReference _database = FirebaseDatabase.instance.ref();
  final Auth _auth = Auth();

  final _formKeyy = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController ageController = TextEditingController();

  List<localUser.User> userDataList = [];
  bool editingText = false;

  RegExp passwordExp = RegExp(
      r'^\s*(?=.*[a-zA-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$');
  RegExp emailExp = RegExp(r'^\s*[a-zA-Z0-9]+@[a-zA-Z0-9]+\.[a-zA-Z]{2,}$');
  RegExp ageExp = RegExp(r'^\s*\d{1,3}$');

  Future<void> readData() async {
    _database.child('usersData').onValue.listen((event) {
      final snapshot = event.snapshot;
      final Map<dynamic, dynamic>? values =
          snapshot.value as Map<dynamic, dynamic>?;

      if (values != null) {
        values.forEach((key, value) {
          final String email = value['email'] ?? '';
          final String username = value['username'] ?? '';
          final String age = value['age'] ?? '';
          if (key == widget.keyy) {
            setState(() {
              userDataList.clear();
              localUser.User user = localUser.User('', username, age);
              emailController.text = email;
              usernameController.text = username;
              ageController.text = age;
              userDataList.add(user);
            });
          }
          if (kDebugMode) {
            print('Key: $key, Email: $email,username: $username ,age: $age');
          }
        });
      } else {
        if (kDebugMode) {
          print('No data available');
        }
      }
    }, onError: (error) {
      if (kDebugMode) {
        print('Error reading data: $error');
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    readData();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final padding = EdgeInsetsOf(context);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: padding.all(Dimensions.medium),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    final userData = userDataList[index];
                    return Card(
                      elevation: 5,
                      child: Padding(
                        padding: padding.all(Dimensions.medium),
                        child: Form(
                          key: _formKeyy,
                          child: Column(
                            children: [
                              CircleAvatar(
                                radius: MediaQuery.sizeOf(context).height / 15,
                                child: Icon(
                                  Icons.person,
                                  size: MediaQuery.sizeOf(context).height / 12,
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  TextButtonDecoration(
                                      label: !editingText
                                          ? '${Constant.editYourProfile}?'
                                          : Constant.editYourProfile,
                                      onPressed: () {
                                        setState(() {
                                          editingText = !editingText;
                                        });
                                      }),
                                  const Icon(Icons.edit, size: 15),
                                ],
                              ),
                              const Space(Dimensions.medium),
                              !editingText
                                  ? Text(
                                      '${Constant.email} : ${emailController.text}',
                                      style: theme.textTheme.titleLarge,
                                    )
                                  : const Space(Dimensions.smallest),
                              const Space(Dimensions.medium),
                              !editingText
                                  ? Text(
                                      '${Constant.username} : ${usernameController.text}',
                                      style: theme.textTheme.titleLarge,
                                    )
                                  : RegularTextFormField(
                                      controller: usernameController,
                                      // needAsteriskSign: true,
                                      label: Constant.username,
                                      needLabel: true,
                                      hintText: '',
                                      validation: (String? value) {
                                        if (usernameController.text.isEmpty) {
                                          return 'Please enter a valid username';
                                        }
                                        return null;
                                      },
                                    ),
                              const Space(Dimensions.medium),
                              !editingText
                                  ? Text(
                                      '${Constant.age} : ${ageController.text}',
                                      style: theme.textTheme.titleLarge,
                                    )
                                  : RegularTextFormField(
                                      isNumber: true,
                                      controller: ageController,
                                      label: Constant.age,
                                      needLabel: true,
                                      hintText: '',
                                      validation: (String? value) {
                                        if (!ageExp.hasMatch(value!)) {
                                          return 'Please enter a valid age';
                                        }
                                        return null;
                                      },
                                    ),
                              const Space(Dimensions.medium),
                              !editingText
                                  ? TextButtonDecoration(
                                      label: Constant.deleteProfile,
                                      onPressed: () {
                                        showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                              title: Text(
                                                  Constant.deleteYourAccount),
                                              content: Text(Constant
                                                  .areYouSureYouWantToDeleteYourAccount),
                                              actions: [
                                                TextButton(
                                                  onPressed: () {
                                                    Navigator.of(context).pop();
                                                  },
                                                  child: const Text('No'),
                                                ),
                                                TextButton(
                                                  onPressed: () {
                                                    Navigator.pushReplacement(
                                                      context,
                                                      CupertinoPageRoute(
                                                        builder: (context) =>
                                                            const LoginScreen(),
                                                      ),
                                                    );
                                                    _auth.deleteUserData(
                                                        widget.keyy);
                                                  },
                                                  child: const Text('Yes'),
                                                ),
                                              ],
                                            );
                                          },
                                        );
                                      },
                                    )
                                  : SubmitButton(
                                      onPressed: () async {
                                        FocusScope.of(context).unfocus();
                                        if (_formKeyy.currentState!
                                            .validate()) {
                                          await _auth.updateData(
                                              widget.keyy,
                                              usernameController.text.trim(),
                                              ageController.text.trim());
                                          readData;
                                          setState(() {
                                            editingText = false;
                                          });
                                        }
                                      },
                                      isLoading: false,
                                      childWidget: Text(Constant.update),
                                    ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                  itemCount: userDataList.isEmpty ? 0 : 1,
                ),
                const Space(Dimensions.medium),
                !editingText
                    ? SubmitButton(
                        onPressed: () async {
                          Navigator.pushAndRemoveUntil(
                              context,
                              CupertinoPageRoute(
                                builder: (context) => const LoginScreen(),
                              ),
                              (route) => false);
                          await _auth.logout();
                        },
                        isLoading: false,
                        childWidget: Text(Constant.logout),
                      )
                    : const Space(Dimensions.medium),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
