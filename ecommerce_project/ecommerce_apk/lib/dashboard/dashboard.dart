import 'package:common/common.dart';
import 'package:e_commerce/utils/constant.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter_timer_countdown/flutter_timer_countdown.dart';
import 'package:ecommerce_assets/gen/assets.gen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../product/product.dart';

class Dashboard extends StatefulWidget {
  Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  TextEditingController searchController = TextEditingController();

  int _currentIndex = 0;

  List<String> categoryList = [
    Constant.all,
    Constant.newest,
    Constant.popular,
    Constant.clothes,
    Constant.shoes,
    Constant.watch
  ];
  List<bool> categoryFocusColorList = [true, false, false, false, false, false];

  int length = 1;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final padding = EdgeInsetsOf(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 3.8,
              decoration: BoxDecoration(
                color: theme.EcommerceColorsExtensions.primary,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 1), // changes position of shadow
                  ),
                ],
              ),
              child: Padding(
                padding: padding.all(Dimensions.medium),
                child: SafeArea(
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          Constant.location,
                          style: theme.textTheme.bodyMedium?.copyWith(
                              color:
                                  theme.EcommerceColorsExtensions.onBackground),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.location_on,
                                    color: theme.EcommerceColorsExtensions
                                        .onBackground),
                                Text(
                                  Constant.ahmedabad,
                                  style: theme.textTheme.bodyLarge?.copyWith(
                                      color: theme.EcommerceColorsExtensions
                                          .onBackground),
                                ),
                                Icon(Icons.arrow_drop_down,
                                    color: theme.EcommerceColorsExtensions
                                        .onBackground),
                              ],
                            ),
                            Container(
                                decoration: BoxDecoration(
                                  color: theme
                                      .EcommerceColorsExtensions.onBackground
                                      .withOpacity(0.3),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Icon(Icons.notification_add,
                                    color: theme.EcommerceColorsExtensions
                                        .onBackground)),
                          ],
                        ),
                        Space(Dimensions.medium),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SizedBox(
                              width: MediaQuery.sizeOf(context).width / 1.4,
                              child: TextFormField(
                                decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.r),
                                    borderSide: BorderSide(
                                      color: theme
                                          .EcommerceColorsExtensions.border,
                                    ),
                                  ),
                                  filled: true,
                                  fillColor: Colors.white,
                                  isDense: true,
                                  hintText: Constant.search,
                                  hintStyle:
                                      theme.textTheme.titleLarge?.copyWith(
                                    color: theme
                                        .EcommerceColorsExtensions.secondary,
                                  ),
                                  prefixIcon: Icon(
                                    Icons.search,
                                  ),
                                  prefixIconColor: Colors.red,
                                ),
                              ),
                            ),
                            Container(
                              width: MediaQuery.sizeOf(context).width / 8,
                              height: MediaQuery.sizeOf(context).height / 14,
                              decoration: BoxDecoration(
                                color: theme
                                    .EcommerceColorsExtensions.onBackground,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Icon(
                                Icons.filter_list,
                                color: theme.EcommerceColorsExtensions.primary,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Column(
              children: [
                Padding(
                  padding: padding.all(Dimensions.small),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        Constant.specialForYou,
                        style: theme.textTheme.titleLarge,
                      ),
                      TextButtonDecoration(
                        label: Constant.seeAll,
                        onPressed: () {},
                        underline: true,
                      )
                    ],
                  ),
                ),
                CarouselSlider.builder(
                  itemCount: 3,
                  itemBuilder:
                      (BuildContext context, int itemIndex, int pageViewIndex) {
                    return Card(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      elevation: 5,
                      child: Stack(
                        children: [
                          Image.asset(
                            EcommerceAssets.images.offer.keyName,
                            fit: BoxFit.cover,
                            width: MediaQuery.sizeOf(context).width,
                            height: MediaQuery.sizeOf(context).height,
                          ),
                          Positioned(
                            child: Padding(
                              padding: padding.all(Dimensions.smallest),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    Constant.getSpecial,
                                    style: theme.textTheme.titleLarge?.copyWith(
                                        color: theme.EcommerceColorsExtensions
                                            .onBackground),
                                  ),
                                  Text(
                                    Constant.upTo,
                                    style: theme.textTheme.titleLarge?.copyWith(
                                        color: theme.EcommerceColorsExtensions
                                            .onBackground),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 10,
                            child: Text(
                              Constant.allService,
                              style: theme.textTheme.bodySmall?.copyWith(
                                  color: theme
                                      .EcommerceColorsExtensions.onBackground),
                            ),
                          )
                        ],
                      ),
                    );
                  },
                  options: CarouselOptions(
                      height: 150.0,
                      enableInfiniteScroll: false,
                      onPageChanged: (index, k) {
                        setState(() {
                          _currentIndex = index;
                        });
                      }),
                ),
                DotsIndicator(
                  dotsCount: 3,
                  position: _currentIndex,
                ),
                Padding(
                  padding: padding.all(Dimensions.small),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        Constant.category,
                        style: theme.textTheme.titleLarge,
                      ),
                      TextButtonDecoration(
                        label: Constant.seeAll,
                        onPressed: () {},
                        underline: true,
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 95,
                  child: ListView.builder(
                      shrinkWrap: true,
                      physics: AlwaysScrollableScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: 8,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: padding.symmetric(
                            horizontal: Dimensions.small,
                          ),
                          child: Column(
                            children: [
                              CircleAvatar(
                                child: Icon(
                                  Icons.watch,
                                  color:
                                      theme.EcommerceColorsExtensions.primary,
                                  size: 30,
                                ),
                                backgroundColor: theme
                                    .EcommerceColorsExtensions.secondary
                                    .withOpacity(0.3),
                                maxRadius: 30,
                              ),
                              Space(Dimensions.smaller),
                              Text(
                                Constant.watch,
                                style: theme.textTheme.titleLarge,
                              ),
                            ],
                          ),
                        );
                      }),
                ),
                Padding(
                  padding: padding.all(Dimensions.small),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        Constant.flashSale,
                        style: theme.textTheme.titleLarge,
                      ),
                      Row(
                        children: [
                          Text(
                            'Closing in : ',
                            style: theme.textTheme.bodySmall?.copyWith(
                                color:
                                    theme.EcommerceColorsExtensions.secondary),
                          ),
                          TimerCountdown(
                            timeTextStyle: TextStyle(
                              color: theme.EcommerceColorsExtensions.primary,
                            ),
                            spacerWidth: 5,
                            enableDescriptions: false,
                            format:
                                CountDownTimerFormat.daysHoursMinutesSeconds,
                            endTime: DateTime.now().add(
                              Duration(
                                days: 5,
                                hours: 14,
                                minutes: 27,
                                seconds: 34,
                              ),
                            ),
                            onEnd: () {
                              print("Timer finished");
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 50,
                  child: ListView.builder(
                      shrinkWrap: true,
                      physics: AlwaysScrollableScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: categoryList.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            for (var count = 0;
                                count < categoryFocusColorList.length;
                                count++) {
                              categoryFocusColorList[count] = false;
                              setState(() {});
                            }
                            categoryFocusColorList[index] = true;
                            length = index + 1;
                            setState(() {});
                          },
                          child: Container(
                            child: Card(
                              color: categoryFocusColorList[index] == true
                                  ? theme.EcommerceColorsExtensions.primary
                                  : theme
                                      .EcommerceColorsExtensions.onBackground,
                              child: Center(
                                child: Text(
                                  categoryList[index],
                                  style: theme.textTheme.titleLarge?.copyWith(
                                    color: categoryFocusColorList[index] == true
                                        ? theme.EcommerceColorsExtensions
                                            .onBackground
                                        : theme.EcommerceColorsExtensions
                                            .background,
                                  ),
                                ),
                              ),
                            ),
                            width: MediaQuery.sizeOf(context).width / 4.5,
                          ),
                        );
                      }),
                ),
                AlignedGridView.count(
                  physics: ScrollPhysics(),
                  shrinkWrap: true,
                  crossAxisCount: 2,
                  itemCount: length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          CupertinoPageRoute(
                            builder: (context) => Product(),
                          ),
                        );
                      },
                      child: Card(
                        child: Stack(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.asset(
                                  EcommerceAssets.images.card.keyName,
                                  fit: BoxFit.cover,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      Constant.nike,
                                      style: theme.textTheme.titleMedium,
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.star,
                                          color: Colors.yellow,
                                        ),
                                        Text('4.9'),
                                      ],
                                    ),
                                  ],
                                ),
                                Text(
                                  ' \$90.00',
                                  style: theme.textTheme.titleLarge,
                                ),
                              ],
                            ),
                            Positioned(
                              top: 3,
                              right: 3,
                              child: Container(
                                height: 25,
                                width: 25,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(30)),
                                child: Center(
                                  child: Icon(
                                    Icons.favorite_border,
                                    color:
                                        theme.EcommerceColorsExtensions.primary,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
