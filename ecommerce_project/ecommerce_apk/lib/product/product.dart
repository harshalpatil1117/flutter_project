import 'package:common/common.dart';
import 'package:e_commerce/product/product_review.dart';
import 'package:e_commerce/utils/constant.dart';
import 'package:ecommerce_assets/gen/assets.gen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class Product extends StatefulWidget {
  const Product({super.key});

  @override
  State<Product> createState() => _ProductState();
}

class _ProductState extends State<Product> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final padding = EdgeInsetsOf(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          Constant.productDetails,
          style: theme.textTheme.headlineSmall,
        ),
        centerTitle: true,
        backgroundColor:
            theme.EcommerceColorsExtensions.secondary.withOpacity(0.2),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundColor: theme.EcommerceColorsExtensions.onBackground,
              child: Icon(
                Icons.favorite_border,
                color: theme.EcommerceColorsExtensions.background,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: Column(
          children: [
            Card(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              elevation: 5,
              child: Image.asset(
                width: MediaQuery.sizeOf(context).width,
                height: MediaQuery.sizeOf(context).height / 2.5,
                EcommerceAssets.images.card.keyName,
                fit: BoxFit.cover,
              ),
            ),
            Space(Dimensions.large),
            Padding(
              padding: padding.all(Dimensions.small),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        Constant.shoes,
                        style: theme.textTheme.bodyLarge?.copyWith(
                          color: theme.EcommerceColorsExtensions.secondary,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            CupertinoPageRoute(
                              builder: (context) => Review(),
                            ),
                          );
                        },
                        child: Row(
                          children: [
                            Icon(Icons.star, color: Colors.amber),
                            Text('4.5')
                          ],
                        ),
                      ),
                    ],
                  ),
                  Text(
                    Constant.nike,
                    style: theme.textTheme.titleLarge,
                  ),
                  Space(Dimensions.medium),
                  Text(
                    Constant.seller,
                    style: theme.textTheme.titleSmall,
                  ),
                  Row(
                    children: [
                      CircleAvatar(
                        child: Text('A'),
                      ),
                      Space(Dimensions.small),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              Constant.amit,
                              style: theme.textTheme.titleSmall,
                            ),
                            Text(Constant.hod,
                                style: theme.textTheme.bodyMedium?.copyWith(
                                  color: theme.EcommerceColorsExtensions.secondary,
                                )),
                          ],
                        ),
                      ),
                      Icon(Icons.message,
                          color: theme.EcommerceColorsExtensions.primary),
                      Space(Dimensions.medium),
                      Icon(Icons.call,
                          color: theme.EcommerceColorsExtensions.primary),
                    ],
                  ),
                  Space(Dimensions.medium),
                  Text(
                    Constant.productDetails,
                    style: theme.textTheme.titleMedium,
                  ),
                  ReadMoreText(
                    style: theme.textTheme.bodyMedium?.copyWith(
                        color: theme.EcommerceColorsExtensions.secondary),
                    Constant.description,
                    trimLines: 2,
                    colorClickableText: Colors.red,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: Constant.readMore,
                    trimExpandedText: 'Show less',
                    moreStyle: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: theme.EcommerceColorsExtensions.primary),
                  ),
                  Space(Dimensions.medium),
                  Divider(),
                  Space(Dimensions.medium),
                  Row(
                    children: [
                      Text(
                        Constant.selectColor,
                        style: theme.textTheme.titleMedium,
                      ),
                      Text('Brown',
                          style: theme.textTheme.bodyLarge?.copyWith(
                            color: theme.EcommerceColorsExtensions.secondary,
                          )),
                    ],
                  ),
                  Space(Dimensions.larger),
                  Space(Dimensions.medium),
                  Row(
                    children: [
                      Text(
                        Constant.selectSize,
                        style: theme.textTheme.titleMedium,
                      ),
                      Text('Regular',
                          style: theme.textTheme.bodyLarge?.copyWith(
                            color: theme.EcommerceColorsExtensions.secondary,
                          )),
                    ],
                  ),
                ],
              ),
            ),

          ],
        ),
      ),
      bottomSheet: ListView(
        shrinkWrap: true,
        children: [
          Padding(
            padding: padding.all(Dimensions.medium),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(Constant.totalPrice,
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: theme.EcommerceColorsExtensions.secondary,
                        )),
                    Text(
                      Constant.price,
                      style: theme.textTheme.titleMedium,
                    ),
                  ],
                ),
                Container(
                  width: MediaQuery.sizeOf(context).width / 1.7,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.shopping_bag),
                        Space(Dimensions.smallest),
                        Text(
                          Constant.addToCart,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
      // bottomNavigationBar: BottomAppBar(
      //   shape: CircularNotchedRectangle(),
      //   notchMargin: 8.0,
        // child: Container(
        //   decoration: BoxDecoration(
        //       borderRadius: BorderRadius.vertical(top: Radius.circular(20.0))),
        //   child: Row(
        //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //     children: [
        //       Column(
        //         crossAxisAlignment: CrossAxisAlignment.start,
        //         children: [
        //           Text(Constant.totalPrice,
        //               style: theme.textTheme.bodyMedium?.copyWith(
        //                 color: theme.EcommerceColorsExtensions.secondary,
        //               )),
        //           Text(
        //             Constant.price,
        //             style: theme.textTheme.titleMedium,
        //           ),
        //         ],
        //       ),
        //       Container(
        //         width: MediaQuery.sizeOf(context).width / 1.7,
        //         child: ElevatedButton(
        //           onPressed: () {},
        //           child: Row(
        //             mainAxisAlignment: MainAxisAlignment.center,
        //             children: [
        //               Icon(Icons.shopping_bag),
        //               Space(Dimensions.smallest),
        //               Text(
        //                 Constant.addToCart,
        //               ),
        //             ],
        //           ),
        //         ),
        //       )
        //     ],
        //   ),
        // ),
      // ),
    );
  }
}
