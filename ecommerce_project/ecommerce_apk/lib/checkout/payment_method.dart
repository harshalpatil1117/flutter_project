import 'package:common/common.dart';
import 'package:e_commerce/checkout/payment.dart';
import 'package:e_commerce/utils/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'add_card.dart';

class PaymentMethod extends StatefulWidget {
  const PaymentMethod({super.key});

  @override
  State<PaymentMethod> createState() => _PaymentMethodState();
}

class _PaymentMethodState extends State<PaymentMethod> {
  String value = 'Cash';

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final padding = EdgeInsetsOf(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.EcommerceColorsExtensions.onBackground,
        title: Text(
          Constant.paymentMethods,
          style: theme.textTheme.headlineSmall,
        ),
        centerTitle: true,
      ),
      bottomSheet: Padding(
        padding: padding.all(Dimensions.medium),
        child: SubmitButton(
            onPressed: () {
              Navigator.push(
                context,
                CupertinoPageRoute(builder: (context) => Payment()),
              );
            },
            text: Constant.confirmPayment),
      ),
      body: Padding(
        padding: padding.all(Dimensions.medium),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              Constant.cash,
              style: theme.textTheme.titleLarge,
            ),
            Space(Dimensions.smaller),
            Card(
              elevation: 5,
              child: ListTile(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                dense: true,
                leading: Icon(
                  Icons.price_change,
                  color: Colors.red,
                ),
                title: Text(Constant.cash),
                trailing: Radio(
                  value: 'Cash',
                  groupValue: value,
                  onChanged: (index) => setState(() => value = index!),
                ),
              ),
            ),
            Space(Dimensions.smaller),
            Text(
              Constant.wallet,
              style: theme.textTheme.titleLarge,
            ),
            Space(Dimensions.smaller),
            Card(
              elevation: 5,
              child: ListTile(
                dense: true,
                leading: Icon(
                  Icons.wallet,
                  color: Colors.red,
                ),
                title: Text(Constant.wallet),
                trailing: Radio(
                  value: 'Card',
                  groupValue: value,
                  onChanged: (index) => setState(() => value = index!),
                ),
              ),
            ),
            Space(Dimensions.smaller),
            Text(
              Constant.creditDebit,
              style: theme.textTheme.titleLarge,
            ),
            Space(Dimensions.smaller),
            Card(
              elevation: 5,
              child: ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    CupertinoPageRoute(builder: (context) => AddCard()),
                  );
                },
                dense: true,
                leading: Icon(
                  Icons.add_card,
                  color: Colors.red,
                ),
                title: Text(Constant.add + ' ' + Constant.card),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.red,
                ),
              ),
            ),
            Space(Dimensions.smaller),
            Text(
              Constant.morePayment,
              style: theme.textTheme.titleLarge,
            ),
            Space(Dimensions.smaller),
            Card(
              elevation: 5,
              child: ListTile(
                dense: true,
                leading: Icon(Icons.paypal),
                title: Text(Constant.paypal),
                trailing: Radio(
                  value: 'Paypal',
                  groupValue: value,
                  onChanged: (index) => setState(() => value = index!),
                ),
              ),
            ),
            Card(
              elevation: 5,
              child: ListTile(
                dense: true,
                leading: Icon(Icons.apple),
                title: Text(Constant.applePay),
                trailing: Radio(
                  value: 'apple pay',
                  groupValue: value,
                  onChanged: (index) => setState(() => value = index!),
                ),
              ),
            ),
            Card(
              elevation: 5,
              child: ListTile(
                dense: true,
                leading: Icon(Icons.g_mobiledata),
                title: Text(Constant.googlePay),
                trailing: Radio(
                  value: 'google pay',
                  groupValue: value,
                  onChanged: (index) => setState(() => value = index!),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
