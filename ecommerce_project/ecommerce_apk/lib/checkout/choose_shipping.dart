import 'package:common/common.dart';
import 'package:e_commerce/utils/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class ChooseShipping extends StatefulWidget {
  const ChooseShipping({super.key});

  @override
  State<ChooseShipping> createState() => _ChooseShippingState();
}

class _ChooseShippingState extends State<ChooseShipping> {

  int value = 0;
  List address = [
    Constant.economy,
    Constant.regular,
    Constant.cargo,
    Constant.express
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final padding = EdgeInsetsOf(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.EcommerceColorsExtensions.onBackground,
        title: Text(
          Constant.chooseShipping,
          style: theme.textTheme.headlineSmall,
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          ListView.builder(
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return RadioListTile(
                value: index,
                groupValue: value,
                onChanged: (ind) => setState(() => value = ind!),
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      address[index],
                      style: theme.textTheme.titleMedium,
                    ),
                    Icon(Icons.delivery_dining),
                  ],
                ),
                subtitle: Text(
                  'Estimated Arrived 25 Dec 2023',
                  style: theme.textTheme.bodyMedium?.copyWith(
                      color: theme.EcommerceColorsExtensions.secondary),
                ),
                isThreeLine: true,
              );
            },
            itemCount: address.length,
          ),
        ],
      ),
      bottomSheet: Padding(
        padding: padding.all(Dimensions.medium),
        child: SubmitButton(
            onPressed: () {
              // Navigator.push(
              //   context,
              //   CupertinoPageRoute(builder: (context) => RazorPay(title: 'payment',)),
              // );

              Razorpay razorpay = Razorpay();
              var options = {
                'key': 'rzp_live_ILgsfZCZoFIKMb',
                'amount': 100,
                'name': 'Acme Corp.',
                'description': 'Fine T-Shirt',
                'retry': {'enabled': true, 'max_count': 1},
                'send_sms_hash': true,
                'prefill': {'contact': '8888888888', 'email': 'test@razorpay.com'},
                'external': {
                  'wallets': ['paytm']
                }
              };
              razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, handlePaymentErrorResponse);
              razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, handlePaymentSuccessResponse);
              razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, handleExternalWalletSelected);
              razorpay.open(options);
            },
            text: Constant.apply),
      ),
    );
  }
  void handlePaymentErrorResponse(PaymentFailureResponse response){
    /*
    * PaymentFailureResponse contains three values:
    * 1. Error Code
    * 2. Error Description
    * 3. Metadata
    * */
    showAlertDialog(context, "Payment Failed", "Code: ${response.code}\nDescription: ${response.message}\nMetadata:${response.error.toString()}");
  }
  void handlePaymentSuccessResponse(PaymentSuccessResponse response){
    /*
    * Payment Success Response contains three values:
    * 1. Order ID
    * 2. Payment ID
    * 3. Signature
    * */
    showAlertDialog(context, "Payment Successful", "Payment ID: ${response.paymentId}");
  }

  void handleExternalWalletSelected(ExternalWalletResponse response){
    showAlertDialog(context, "External Wallet Selected", "${response.walletName}");
  }
  void showAlertDialog(BuildContext context, String title, String message){
    // set up the buttons
    Widget continueButton = ElevatedButton(
      child: const Text("Continue"),
      onPressed:  () {
        Navigator.pop(context);
      },
    );
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text(title),
      content: Text(message),
      actions: [
        continueButton,
      ],
    );
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}