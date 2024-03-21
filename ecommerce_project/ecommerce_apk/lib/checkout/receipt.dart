import 'package:common/common.dart';
import 'package:e_commerce/utils/constant.dart';
import 'package:ecommerce_assets/gen/assets.gen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:barcode_widget/barcode_widget.dart';

class Receipt extends StatelessWidget {
  const Receipt({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final padding = EdgeInsetsOf(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.EcommerceColorsExtensions.onBackground,
        title: Text(
          Constant.eReceipt,
          style: theme.textTheme.headlineSmall,
        ),
        centerTitle: true,
      ),
      bottomSheet: Padding(
        padding: padding.all(Dimensions.medium),
        child: SubmitButton(
            onPressed: () {
              // Navigator.push(
              //   context,
              //   CupertinoPageRoute(builder: (context) => Payment()),
              // );
            },
            text: Constant.downloadEReceipt),
      ),
      body: Padding(
        padding: padding.all(Dimensions.medium),
        child: Column(
          children: [
            BarcodeWidget(
              height: MediaQuery.sizeOf(context).height / 8,
              data: 'Your Recent Order',
              barcode: Barcode.code128(),
              style: theme.textTheme.titleMedium,
            ),
            Space(Dimensions.medium),
            Column(
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
                          Text(
                            Constant.shoes,
                            style: theme.textTheme.bodyMedium?.copyWith(
                              color: theme.EcommerceColorsExtensions.secondary,
                            ),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(Constant.price),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                Space(Dimensions.small),
                Divider(),
                Space(Dimensions.medium),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  Constant.orderDate,
                  style: theme.textTheme.bodyLarge?.copyWith(
                      color: theme.EcommerceColorsExtensions.secondary),
                ),
                Text(
                  'Sep 18,2023 | 10:00 AM',
                  style: theme.textTheme.titleMedium,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  Constant.promoCode,
                  style: theme.textTheme.bodyLarge?.copyWith(
                      color: theme.EcommerceColorsExtensions.secondary),
                ),
                Text(
                  'KHG5646JFD',
                  style: theme.textTheme.titleMedium,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Delivery Type',
                  style: theme.textTheme.bodyLarge?.copyWith(
                      color: theme.EcommerceColorsExtensions.secondary),
                ),
                Text(
                  Constant.economy,
                  style: theme.textTheme.titleMedium,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
