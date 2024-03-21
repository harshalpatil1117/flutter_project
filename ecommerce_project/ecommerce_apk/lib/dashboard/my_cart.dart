import 'dart:ui';

import 'package:common/common.dart';
import 'package:e_commerce/utils/constant.dart';
import 'package:ecommerce_assets/gen/assets.gen.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../checkout/shipping_address.dart';

class MyCart extends StatefulWidget {
  MyCart({super.key});

  @override
  State<MyCart> createState() => _MyCartState();
}

class _MyCartState extends State<MyCart> {
  List<int> itemCounts = List.filled(10, 1);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final padding = EdgeInsetsOf(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.EcommerceColorsExtensions.onBackground,
        title: Text(
          Constant.myCart,
          style: theme.textTheme.headlineSmall,
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: padding.all(Dimensions.smaller),
              child: Column(
                children: [
                  ListView.builder(
                    itemCount: itemCounts.length,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Dismissible(
                        key: UniqueKey(),
                        onDismissed: (direction) {
                          // setState(() {
                          //   itemCounts.removeAt(index);
                          // });
                          showModalBottomSheet(
                            context: context,
                            builder: (BuildContext context) {
                              return Container(
                                height: MediaQuery.sizeOf(context).height / 2.5,
                                child: Padding(
                                  padding: padding.all(Dimensions.medium),
                                  child: Column(
                                    children: [
                                      Text(
                                        Constant.removeFromCart,
                                        style: theme.textTheme.titleLarge,
                                      ),
                                      Space(Dimensions.small),
                                      Divider(),
                                      Space(Dimensions.small),
                                      Column(
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Card(
                                                clipBehavior:
                                                    Clip.antiAliasWithSaveLayer,
                                                child: Image.asset(
                                                  width:
                                                      MediaQuery.sizeOf(context)
                                                              .width /
                                                          4,
                                                  height:
                                                      MediaQuery.sizeOf(context)
                                                              .height /
                                                          8,
                                                  EcommerceAssets
                                                      .images.card.keyName,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                              Space(Dimensions.smaller),
                                              Expanded(
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      Constant.nike,
                                                      style: theme
                                                          .textTheme.titleSmall,
                                                    ),
                                                    Space(Dimensions.smallest),
                                                    Text(
                                                      Constant.shoes,
                                                      style: theme
                                                          .textTheme.bodyMedium
                                                          ?.copyWith(
                                                        color: theme
                                                            .EcommerceColorsExtensions
                                                            .secondary,
                                                      ),
                                                    ),
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(Constant.price),
                                                        Row(
                                                          children: [
                                                            Container(
                                                              child: IconButton(
                                                                onPressed: () {
                                                                  setState(() {
                                                                    if (itemCounts[
                                                                            index] >
                                                                        0) {
                                                                      itemCounts[
                                                                          index]--;
                                                                    }
                                                                  });
                                                                },
                                                                icon: Icon(
                                                                  Icons.remove,
                                                                ),
                                                              ),
                                                            ),
                                                            Text(
                                                                '${itemCounts[index]}'),
                                                            IconButton(
                                                              onPressed: () {
                                                                setState(() {
                                                                  itemCounts[
                                                                      index]++;
                                                                });
                                                              },
                                                              icon: Icon(
                                                                Icons.add,
                                                                color:
                                                                    Colors.red,
                                                              ),
                                                            ),
                                                          ],
                                                        )
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                      Space(Dimensions.medium),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          SizedBox(
                                            width: MediaQuery.sizeOf(context)
                                                    .width /
                                                2.5,
                                            child: ElevatedButton(
                                              style: ButtonStyle(
                                                backgroundColor:
                                                    MaterialStatePropertyAll<
                                                        Color>(Colors.grey),
                                              ),
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: Text(
                                                Constant.cancel,
                                                style: theme.textTheme.bodyLarge
                                                    ?.copyWith(
                                                        color: theme
                                                            .EcommerceColorsExtensions
                                                            .primary),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: MediaQuery.sizeOf(context)
                                                    .width /
                                                2.5,
                                            child: ElevatedButton(
                                              onPressed: () {
                                                setState(() {
                                                  itemCounts.removeAt(index);
                                                });
                                                Navigator.pop(context);
                                              },
                                              child: Text(Constant.yesRemove),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        },
                        background: Container(
                          color: Colors.red,
                          alignment: Alignment.centerRight,
                          child: Padding(
                            padding: EdgeInsets.only(right: 20.0),
                            child: Icon(
                              Icons.delete,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Card(
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  child: Image.asset(
                                    width: MediaQuery.sizeOf(context).width / 4,
                                    height:
                                        MediaQuery.sizeOf(context).height / 8,
                                    EcommerceAssets.images.card.keyName,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Space(Dimensions.smaller),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        Constant.nike,
                                        style: theme.textTheme.titleSmall,
                                      ),
                                      Space(Dimensions.smallest),
                                      Text(
                                        Constant.shoes,
                                        style: theme.textTheme.bodyMedium
                                            ?.copyWith(
                                          color: theme.EcommerceColorsExtensions
                                              .secondary,
                                        ),
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(Constant.price),
                                          Row(
                                            children: [
                                              Container(
                                                child: IconButton(
                                                  onPressed: () {
                                                    setState(() {
                                                      if (itemCounts[index] >
                                                          0) {
                                                        itemCounts[index]--;
                                                      }
                                                    });
                                                  },
                                                  icon: Icon(
                                                    Icons.remove,
                                                  ),
                                                ),
                                              ),
                                              Text('${itemCounts[index]}'),
                                              IconButton(
                                                onPressed: () {
                                                  setState(() {
                                                    itemCounts[index]++;
                                                  });
                                                },
                                                icon: Icon(
                                                  Icons.add,
                                                  color: Colors.red,
                                                ),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                            Space(Dimensions.small),
                            Divider(),
                            Space(Dimensions.small),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomSheet: SizedBox(
        height: MediaQuery.sizeOf(context).height / 2.5,
        child: Padding(
          padding: padding.all(Dimensions.medium),
          child: Column(
            children: [
              SizedBox(
                height: 50,
                child: TextFormField(
                  decoration: InputDecoration(
                    isDense: true,
                    suffixIcon: ElevatedButton(
                      onPressed: () {},
                      child: Text(Constant.apply),
                    ),
                    fillColor: Colors.grey.withOpacity(0.5),
                    filled: true,
                    hintText: Constant.promoCode,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
              ),
              Space(Dimensions.small),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    Constant.subTotal,
                    style: theme.textTheme.bodyMedium?.copyWith(
                        color: theme.EcommerceColorsExtensions.secondary),
                  ),
                  Text(
                    Constant.numSubTotal,
                    style: theme.textTheme.titleMedium,
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    Constant.deliveryFee,
                    style: theme.textTheme.bodyMedium?.copyWith(
                        color: theme.EcommerceColorsExtensions.secondary),
                  ),
                  Text(
                    Constant.numFee,
                    style: theme.textTheme.titleMedium,
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    Constant.discount,
                    style: theme.textTheme.bodyMedium?.copyWith(
                        color: theme.EcommerceColorsExtensions.secondary),
                  ),
                  Text(
                    Constant.numDiscount,
                    style: theme.textTheme.titleMedium,
                  )
                ],
              ),
              Space(Dimensions.small),
              DottedLine(
                direction: Axis.horizontal,
                alignment: WrapAlignment.center,
                lineLength: double.infinity,
                lineThickness: 1.0,
                dashLength: 10.0,
                dashColor: Colors.black,
                dashGradient: [Colors.red, Colors.blue],
              ),
              Space(Dimensions.small),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    Constant.totalCost,
                    style: theme.textTheme.bodyMedium?.copyWith(
                        color: theme.EcommerceColorsExtensions.secondary),
                  ),
                  Text(
                    Constant.numTotal,
                    style: theme.textTheme.titleMedium,
                  )
                ],
              ),
              Space(Dimensions.small),
              SubmitButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      CupertinoPageRoute(
                          builder: (context) => ShippingAddress()),
                    );
                  },
                  text: Constant.proceedTOCheckout),
            ],
          ),
        ),
      ),
    );
  }
}
