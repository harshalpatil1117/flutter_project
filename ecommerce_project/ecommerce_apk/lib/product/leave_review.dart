import 'package:common/common.dart';
import 'package:e_commerce/utils/constant.dart';
import 'package:ecommerce_assets/gen/assets.gen.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LeaveReview extends StatelessWidget {
  const LeaveReview({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final padding = EdgeInsetsOf(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.EcommerceColorsExtensions.onBackground,
        title: Text(
          Constant.leaveReview,
          style: theme.textTheme.headlineSmall,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: padding.all(Dimensions.medium),
        child: Column(
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Card(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: Image.asset(
                    width: MediaQuery.sizeOf(context).width / 4,
                    height: MediaQuery.sizeOf(context).height / 8,
                    EcommerceAssets.images.card.keyName,
                    fit: BoxFit.cover,
                  ),
                ),
                Space(Dimensions.smaller),
                Expanded(
                  child: Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        Constant.nike,
                        style: theme.textTheme.titleSmall,
                      ),
                      Space(Dimensions.smallest),
                      IntrinsicHeight(
                        child: Row(
                          children: [
                            Text(
                              Constant.shoes,
                              style: theme.textTheme.bodyMedium?.copyWith(
                                color: theme.EcommerceColorsExtensions.secondary,
                              ),
                            ),
                            Space(Dimensions.smallest),
                            VerticalDivider(),
                            Space(Dimensions.smallest),
                            Text(
                              Constant.qty,
                              style: theme.textTheme.bodyMedium?.copyWith(
                                color: theme.EcommerceColorsExtensions.secondary,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(Constant.price),
                          Container(
                            padding: padding.all(Dimensions.smallest),
                            decoration: BoxDecoration(
                              color: theme.EcommerceColorsExtensions.primary,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Text(
                              Constant.reOrder,
                              style: theme.textTheme.bodyMedium?.copyWith(
                                  color: theme
                                      .EcommerceColorsExtensions.onBackground),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
            Space(Dimensions.medium),
            Divider(),
            Space(Dimensions.medium),
            Text(
              Constant.howIsYourOrder,
              style: theme.textTheme.headlineLarge,
            ),
            Space(Dimensions.medium),
            Divider(),
            Space(Dimensions.medium),
            Text(
              Constant.yourOverallRating,
              style: theme.textTheme.titleSmall?.copyWith(
                color: theme.EcommerceColorsExtensions.secondary,
              ),
            ),
            Space(Dimensions.medium),
            RatingStars(
                starSize: 30,
                starSpacing: 20,
                maxValueVisibility: false,
                valueLabelVisibility: false,
                starOffColor: Colors.amber),
            Space(Dimensions.medium),
            Divider(),
            Space(Dimensions.medium),
            Align(alignment: Alignment.centerLeft,
              child: Text(
                Constant.addDetailedReview,
                style: theme.textTheme.titleMedium,
              ),
            ),
            TextFormField(
              decoration: InputDecoration(
                fillColor: Colors.grey.withOpacity(0.5),
                filled: true,
                hintText: Constant.enterHere,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              maxLines: 5,
            ),
            TextButton(
                onPressed: () {},
                child: Row(
                  children: [
                    Icon(Icons.add_a_photo_outlined),
                    Text(Constant.addPhoto)
                  ],
                ))
          ],
        ),
      ),
      bottomSheet: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              width: MediaQuery.sizeOf(context).width/2.5,
              child: ElevatedButton(style: ButtonStyle(backgroundColor: MaterialStatePropertyAll<Color>(Colors.grey),),
                onPressed: () {},
                child: Text(Constant.cancel,style: theme.textTheme.bodyLarge?.copyWith(color: theme.EcommerceColorsExtensions.primary),),
              ),
            ),
            SizedBox(
              width: MediaQuery.sizeOf(context).width/2.5,
              child: ElevatedButton(
                onPressed: () {},
                child: Text(Constant.submit),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
