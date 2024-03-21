import 'package:common/common.dart';
import 'package:e_commerce/utils/constant.dart';
import 'package:ecommerce_assets/enalytics_assets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'intro.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  PageController _pageController = PageController(initialPage: 0);
   int _currentPage = 0;

  List<Widget> _pages = [
    OnboardingPage(
      title: Constant.onboardName,
      description: Constant.description,
      imagePath: EcommerceAssets.lottie.onboarding.keyName,
      title2: Constant.onboardSubName,
      index : 0,
      // Replace with your image path
    ),
    OnboardingPage(
      title: Constant.onboardName2,
      description: Constant.description,
      imagePath: EcommerceAssets.lottie.onboarding2.keyName,
      title2: Constant.onboardSubName2, // Replace with your image path
      index : 1,
    ),
    OnboardingPage(
      title: Constant.onboardName3,
      description: Constant.description,
      imagePath: EcommerceAssets.lottie.onboarding3.keyName,
      title2: Constant.onboardSubName3,
      title3bool: true,
      title3: Constant.onboardSub2Name3,
      title4: Constant.onboardSub3Name3,
      title4bool: true, // Replace with your image path
      index : 2,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              _currentPage != 0
                  ? CircleAvatar(
                      backgroundColor:
                          theme.EcommerceColorsExtensions.onBackground,
                      child: IconButton(
                        icon: Icon(Icons.arrow_back),
                        color: theme.EcommerceColorsExtensions.primary,
                        onPressed: () {
                          _pageController.previousPage(
                            duration: Duration(milliseconds: 500),
                            curve: Curves.ease,
                          );
                        },
                      ),
                    )
                  : Container(),
              _currentPage != _pages.length - 1
                  ? CircleAvatar(
                      child: IconButton(
                        icon: Icon(Icons.arrow_forward),
                        onPressed: () {
                          _pageController.nextPage(
                            duration: Duration(milliseconds: 500),
                            curve: Curves.ease,
                          );
                        },
                      ),
                    )
                  : CircleAvatar(
                      child: IconButton(
                        icon: Icon(Icons.arrow_forward),
                        onPressed: () {
                          Navigator.push(
                            context,
                            CupertinoPageRoute(
                                builder: (context) => IntroScreen()),
                          );
                        },
                      ),
                    ),
            ],
          ),
        ),
      ),
      body: PageView.builder(
        controller: _pageController,
        itemCount: _pages.length,
        onPageChanged: (int page) {
          setState(() {
            _currentPage = page;
          });
        },
        itemBuilder: (context, index) {
          return _pages[index];
        },
      ),
    );
  }
}

class OnboardingPage extends StatelessWidget {
  final String title;
  final String title2;
  final String? title3;
  final bool? title3bool;
  final String? title4;
  final bool? title4bool;
  final String description;
  final String imagePath;
  final int index;


  OnboardingPage({
    super.key,
    required this.title,
    required this.description,
    required this.imagePath,
    required this.title2,
    this.title3,
    this.title4,
    this.title3bool,
    this.title4bool, required this.index,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final padding = EdgeInsetsOf(context);
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              index != 2 ? Align(
                alignment: Alignment.centerRight,
                child: InkWell(
                  child: Text(Constant.skip,style: theme.textTheme.headlineSmall?.copyWith(color: theme.EcommerceColorsExtensions.primary),),
                  onTap: () {
                    Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (context) => IntroScreen(),
                      ),
                    );
                  },
                ),
              ) : SizedBox.shrink(),
              Lottie.asset(
                imagePath, height: 400, // Adjust the height as needed
              ),
              Space(Dimensions.large),
              Align(
                alignment: Alignment.center,
                child: Text.rich(
                  TextSpan(children: [
                    TextSpan(
                      text: title,
                      style: theme.textTheme.headlineMedium?.copyWith(
                        color: theme.EcommerceColorsExtensions.primary,
                      ),
                    ),
                    TextSpan(
                      text: title2,
                      style: theme.textTheme.headlineMedium,
                    ),
                    if (title3bool ?? false)
                      TextSpan(
                        text: title3,
                        style: theme.textTheme.headlineMedium?.copyWith(
                          color: theme.EcommerceColorsExtensions.primary,
                        ),
                      ),
                    if (title4bool ?? false)
                      TextSpan(
                        text: title4,
                        style: theme.textTheme.headlineMedium,
                      ),
                  ]),
                  textAlign: TextAlign.center,
                ),
              ),
              Space(Dimensions.large),
              Text(
                description,
                textAlign: TextAlign.center,
                style: theme.textTheme.titleMedium?.copyWith(
                  color: theme.EcommerceColorsExtensions.secondary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
