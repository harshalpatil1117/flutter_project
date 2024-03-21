import 'package:common/common.dart';
import 'package:e_commerce/checkout/payment.dart';
import 'package:e_commerce/utils/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';

class AddCard extends StatefulWidget {
  const AddCard({super.key});

  @override
  State<AddCard> createState() => _AddCardState();
}

class _AddCardState extends State<AddCard> {
  TextEditingController holderName = TextEditingController();

  TextEditingController cardNumber = TextEditingController();

  TextEditingController expiry = TextEditingController();

  TextEditingController cvv = TextEditingController();

  bool isChecked = true;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final padding = EdgeInsetsOf(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.EcommerceColorsExtensions.onBackground,
        title: Text(
          Constant.addCard,
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
            text: Constant.addCard),
      ),
      body: Padding(
        padding: padding.all(Dimensions.medium),
        child: Column(
          children: [
            CreditCardWidget(
              cardNumber: Constant.numCard,
              expiryDate: Constant.expiry,
              cardHolderName: Constant.anandBani,
              cvvCode: '000',
              showBackView: true,
              onCreditCardWidgetChange: (value) {},
              cardBgColor: theme.EcommerceColorsExtensions.primary,
              chipColor: Colors.white.withOpacity(0.4),
              isHolderNameVisible: true,
            ),
            RegularTextFormField(
                controller: holderName,
                label: Constant.cardHolderName,
                hintText: Constant.anandBani,
                needLabel: true,
                enabled: false,
                validation: (value) {}),
            RegularTextFormField(
              controller: cardNumber,
              label: Constant.cardNumber,
              hintText: Constant.numCard,
              validation: (value) {},
              needLabel: true,
              enabled: false,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 150,
                  child: RegularTextFormField(
                      controller: expiry,
                      label: Constant.expiryDate,
                      hintText: Constant.expiry,
                      enabled: false,
                      needLabel: true,
                      validation: (value) {}),
                ),
                SizedBox(
                  width: 150,
                  child: RegularTextFormField(
                      controller: cvv,
                      enabled: false,
                      needLabel: true,
                      label: Constant.cvv,
                      hintText: "000",
                      validation: (value) {}),
                ),
              ],
            ),
            Row(
              children: [
                Checkbox(
                  value: isChecked,
                  onChanged: (value) {
                    setState(() {
                      isChecked = value!;
                    });
                  },
                ),
                Text(
                  Constant.saveCard,
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
