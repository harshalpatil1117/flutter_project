import 'package:common/common.dart';
import 'package:e_commerce/checkout/receipt.dart';
import 'package:e_commerce/utils/constant.dart';
import 'package:ecommerce_assets/gen/assets.gen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Payment extends StatelessWidget {
  const Payment({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final padding = EdgeInsetsOf(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.EcommerceColorsExtensions.onBackground,
        title: Text(
          Constant.payment,
          style: theme.textTheme.headlineSmall,
        ),
        centerTitle: true,
      ),
      bottomSheet: Padding(
        padding: padding.all(Dimensions.medium),
        child: SizedBox(
          height: MediaQuery.sizeOf(context).height / 7.5,
          child: Column(
            children: [
              SubmitButton(
                  onPressed: () {
                    // Navigator.push(
                    //   context,
                    //   CupertinoPageRoute(builder: (context) => Payment()),
                    // );
                  },
                  text: Constant.viewOrder),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    CupertinoPageRoute(builder: (context) => Receipt()),
                  );
                },
                child: Text(Constant.viewReceipt),
              ),
            ],
          ),
        ),
      ),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Lottie.asset(
            EcommerceAssets.lottie.paymentSuccessful.keyName,
            width: MediaQuery.sizeOf(context).width,
            height: MediaQuery.sizeOf(context).height/2,
            repeat: false,
          ),
          Text(
            Constant.paymentSuccessful,
            style: theme.textTheme.headlineMedium,
          ),
          Space(Dimensions.medium),
          Text(
            Constant.thankYouFor,
            style: theme.textTheme.bodyMedium
                ?.copyWith(color: theme.EcommerceColorsExtensions.secondary),
          ),
        ],
      ),
    );
  }
}
