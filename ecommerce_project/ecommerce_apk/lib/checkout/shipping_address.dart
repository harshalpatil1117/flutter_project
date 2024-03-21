import 'package:common/common.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:e_commerce/utils/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'choose_shipping.dart';

class ShippingAddress extends StatefulWidget {
  const ShippingAddress({super.key});

  @override
  State<ShippingAddress> createState() => _ShippingAddressState();
}

class _ShippingAddressState extends State<ShippingAddress> {
  int value = 0;
  List address = [
    Constant.home,
    Constant.office,
    Constant.parentHouse,
    Constant.friendHouse
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final padding = EdgeInsetsOf(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.EcommerceColorsExtensions.onBackground,
        title: Text(
          Constant.shippingAddress,
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
                    Icon(Icons.pin_drop_outlined),
                  ],
                ),
                subtitle: Text(
                  'Shaitan gali,khatra mahal,andher nagar,shamshan ke samne...',
                  style: theme.textTheme.bodyMedium?.copyWith(
                      color: theme.EcommerceColorsExtensions.secondary),
                ),
                isThreeLine: true,
              );
            },
            itemCount: address.length,
          ),
          DottedBorder(
              borderType: BorderType.RRect,
              radius: Radius.circular(10),
              color: Colors.red,
              strokeWidth: 1,
              child: Container(
                width: 300,
                height: 40,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.add,
                      color: Colors.red,
                    ),
                    Text(
                      Constant.addNewShipping,
                      style: theme.textTheme.bodyLarge?.copyWith(
                          color: theme.EcommerceColorsExtensions.primary),
                    ),
                  ],
                ),
              )),
        ],
      ),
      bottomSheet: Padding(
        padding: padding.all(Dimensions.medium),
        child: SubmitButton(
            onPressed: () {
              Navigator.push(
                context,
                CupertinoPageRoute(builder: (context) => ChooseShipping()),
              );
            },
            text: Constant.apply),
      ),
    );
  }
}
