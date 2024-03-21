import 'package:common/common.dart';
import 'package:e_commerce/utils/constant.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'leave_review.dart';

class Review extends StatefulWidget {
  Review({super.key});

  @override
  State<Review> createState() => _ReviewState();
}

class _ReviewState extends State<Review> {
  List<String> categoryList = [
    Constant.verified,
    Constant.latest,
    Constant.detailedReview,
    Constant.negativeReview,
  ];

  List<bool> categoryFocusColorList = [true, false, false, false];

  int length = 1;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final padding = EdgeInsetsOf(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.EcommerceColorsExtensions.onBackground,
        title: Text(
          Constant.review,
          style: theme.textTheme.headlineSmall,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: padding.all(Dimensions.medium),
        child: SingleChildScrollView(
          child: Column(
            children: [
              IntrinsicHeight(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Text(
                          Constant.num,
                          style: theme.textTheme.displayLarge,
                        ),
                        RatingStars(
                            starSpacing: 10,
                            maxValueVisibility: false,
                            valueLabelVisibility: false,
                            starOffColor: Colors.amber),
                        Text(
                          Constant.numReviews,
                          style: theme.textTheme.bodyLarge?.copyWith(
                              color: theme.EcommerceColorsExtensions.secondary),
                        ),
                      ],
                    ),
                    VerticalDivider(),
                    Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              '5',
                              style: theme.textTheme.bodyLarge,
                            ),
                            Space(Dimensions.smallest),
                            SizedBox(
                              width: 100,
                              child: LinearProgressIndicator(
                                borderRadius: BorderRadius.circular(2),
                                value: 0.9,
                                color: theme.EcommerceColorsExtensions.primary,
                                backgroundColor: theme
                                    .EcommerceColorsExtensions.secondary
                                    .withOpacity(0.5),
                                valueColor: new AlwaysStoppedAnimation<Color>(
                                    Colors.red),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              '4',
                              style: theme.textTheme.bodyLarge,
                            ),
                            Space(Dimensions.smallest),
                            SizedBox(
                              width: 100,
                              child: LinearProgressIndicator(
                                borderRadius: BorderRadius.circular(2),
                                value: 0.7,
                                color: theme.EcommerceColorsExtensions.primary,
                                backgroundColor: theme
                                    .EcommerceColorsExtensions.secondary
                                    .withOpacity(0.5),
                                valueColor: new AlwaysStoppedAnimation<Color>(
                                    Colors.red),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              '3',
                              style: theme.textTheme.bodyLarge,
                            ),
                            Space(Dimensions.smallest),
                            SizedBox(
                              width: 100,
                              child: LinearProgressIndicator(
                                borderRadius: BorderRadius.circular(2),
                                value: 0.5,
                                color: theme.EcommerceColorsExtensions.primary,
                                backgroundColor: theme
                                    .EcommerceColorsExtensions.secondary
                                    .withOpacity(0.5),
                                valueColor: new AlwaysStoppedAnimation<Color>(
                                    Colors.red),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              '2',
                              style: theme.textTheme.bodyLarge,
                            ),
                            Space(Dimensions.smallest),
                            SizedBox(
                              width: 100,
                              child: LinearProgressIndicator(
                                borderRadius: BorderRadius.circular(2),
                                value: 0.3,
                                color: theme.EcommerceColorsExtensions.primary,
                                backgroundColor: theme
                                    .EcommerceColorsExtensions.secondary
                                    .withOpacity(0.5),
                                valueColor: new AlwaysStoppedAnimation<Color>(
                                    Colors.red),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              '1',
                              style: theme.textTheme.bodyLarge,
                            ),
                            Space(Dimensions.smallest),
                            SizedBox(
                              width: 100,
                              child: LinearProgressIndicator(
                                borderRadius: BorderRadius.circular(2),
                                value: 0.1,
                                color: theme.EcommerceColorsExtensions.primary,
                                backgroundColor: theme
                                    .EcommerceColorsExtensions.secondary
                                    .withOpacity(0.5),
                                valueColor: new AlwaysStoppedAnimation<Color>(
                                    Colors.red),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Space(Dimensions.medium),
              Divider(),
              Space(Dimensions.medium),
              TextFormField(
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.r),
                    borderSide: BorderSide(
                      color: theme.EcommerceColorsExtensions.border,
                    ),
                  ),
                  filled: true,
                  fillColor: theme.EcommerceColorsExtensions.secondary
                      .withOpacity(0.2),
                  isDense: true,
                  hintText: Constant.searchInReview,
                  hintStyle: theme.textTheme.titleLarge?.copyWith(
                    color: theme.EcommerceColorsExtensions.secondary,
                  ),
                  prefixIcon: Icon(
                    Icons.search,
                  ),
                  prefixIconColor: Colors.red,
                ),
              ),
              Space(Dimensions.smaller),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Container(
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50)),
                        child: Padding(
                          padding: padding.all(Dimensions.smaller),
                          child: Center(
                            child: Row(
                              children: [
                                Icon(Icons.compare_arrows),
                                Text(
                                  Constant.filter,
                                  style: theme.textTheme.titleLarge,
                                ),
                                Icon(Icons.arrow_drop_down),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 50,
                      child: ListView.builder(
                          shrinkWrap: true,
                          physics: ScrollPhysics(),
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
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50)),
                                  color: categoryFocusColorList[index] == true
                                      ? theme.EcommerceColorsExtensions.primary
                                      : theme.EcommerceColorsExtensions
                                          .onBackground,
                                  child: Padding(
                                    padding: padding.all(Dimensions.smaller),
                                    child: Center(
                                      child: Text(
                                        categoryList[index],
                                        style: theme.textTheme.titleLarge
                                            ?.copyWith(
                                          color: categoryFocusColorList[
                                                      index] ==
                                                  true
                                              ? theme.EcommerceColorsExtensions
                                                  .onBackground
                                              : theme.EcommerceColorsExtensions
                                                  .background,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }),
                    ),
                  ],
                ),
              ),
              ListView.builder(
                padding: padding.only(bottom: Dimensions.largest),
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Space(Dimensions.smaller),
                      Divider(),
                      Space(Dimensions.medium),
                      Row(
                        children: [
                          CircleAvatar(
                            child: Text('A'),
                          ),
                          Space(Dimensions.smallest),
                          Expanded(child: Text(Constant.amit)),
                          Text(
                            Constant.numMonthsAgo,
                            style: theme.textTheme.bodyMedium?.copyWith(
                                color:
                                    theme.EcommerceColorsExtensions.secondary),
                          ),
                        ],
                      ),
                      Space(Dimensions.smaller),
                      Text(
                        Constant.description,
                        style: theme.textTheme.bodyMedium?.copyWith(
                            color: theme.EcommerceColorsExtensions.secondary),
                      ),
                      Space(Dimensions.smaller),
                      RatingStars(
                          maxValueVisibility: false,
                          valueLabelVisibility: true,
                          value: 5.0,
                          valueLabelTextStyle: TextStyle(
                              color: theme.EcommerceColorsExtensions.secondary,
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                          valueLabelColor: Colors.transparent,
                          starColor: Colors.amber,
                          starOffColor: Colors.grey),
                    ],
                  );
                },
                itemCount: 10,
              ),
              Space(Dimensions.largest),
            ],
          ),
        ),
      ),
      bottomSheet: Container(
        padding: padding.all(Dimensions.medium),
        child: SubmitButton(
            onPressed: () {
              Navigator.push(
                context,
                CupertinoPageRoute(
                  builder: (context) => LeaveReview(),
                ),
              );
            },
            text: Constant.writeReview),
      ),
    );
  }
}
