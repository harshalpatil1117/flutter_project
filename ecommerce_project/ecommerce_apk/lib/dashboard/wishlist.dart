import 'package:common/common.dart';
import 'package:e_commerce/utils/constant.dart';
import 'package:ecommerce_assets/gen/assets.gen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../product/product.dart';

class Wishlist extends StatefulWidget {
  Wishlist({super.key});

  @override
  State<Wishlist> createState() => _WishlistState();
}

class _WishlistState extends State<Wishlist> {
  List<String> categoryList = [
    Constant.all,
    Constant.newest,
    Constant.popular,
    Constant.clothes,
    Constant.shoes,
    Constant.watch
  ];

  List<bool> categoryFocusColorList = [true, false, false, false, false, false];
  List<bool> wishlist = [];

  int length = 1;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final padding = EdgeInsetsOf(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.EcommerceColorsExtensions.onBackground,
        title: Text(Constant.myWishlist,style: theme.textTheme.headlineSmall,),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: padding.all(Dimensions.medium),
        child: Column(
          children: [
            SizedBox(
              height: 50,
              child: ListView.builder(
                  shrinkWrap: true,
                  physics: AlwaysScrollableScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: categoryList.length,
                  itemBuilder: (context, index) {
                    wishlist.add(false);
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
                          color: categoryFocusColorList[index] == true
                              ? theme.EcommerceColorsExtensions.primary
                              : theme.EcommerceColorsExtensions.onBackground,
                          child: Center(
                            child: Text(
                              categoryList[index],
                              style: theme.textTheme.titleLarge?.copyWith(
                                color: categoryFocusColorList[index] == true
                                    ? theme.EcommerceColorsExtensions.onBackground
                                    : theme.EcommerceColorsExtensions.background,
                              ),
                            ),
                          ),
                        ),
                        width: MediaQuery.sizeOf(context).width / 4.5,
                      ),
                    );
                  }),
            ),
            AlignedGridView.count(
              physics: ScrollPhysics(),
              shrinkWrap: true,
              crossAxisCount: 2,
              itemCount: length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: (){
                    Navigator.push(context, CupertinoPageRoute(builder: (context)=>Product(),),);
                  },
                  child: Card(
                    child: Stack(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              EcommerceAssets.images.card.keyName,
                              fit: BoxFit.cover,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                 Constant.nike,
                                  style: theme.textTheme.titleMedium,
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.star,
                                      color: Colors.yellow,
                                    ),
                                    Text('4.9'),
                                  ],
                                ),
                              ],
                            ),
                            Text(
                              ' \$90.00',
                              style: theme.textTheme.titleLarge,
                            ),
                          ],
                        ),
                        Positioned(
                          top: 3,
                          right: 3,
                          child: Container(
                            height: 25,
                            width: 25,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(30)),
                            child: Center(
                              child: InkWell(
                                onTap: (){
                                  if(wishlist[index] == true){
                                    setState(() {
                                      wishlist[index] = false;
                                    });
                                  }
                                  else{
                                    setState(() {
                                      wishlist[index] = true;
                                    });
                                  }
                                },
                                child: Icon(
                                  wishlist[index] == true ? Icons.favorite : Icons.favorite_border,
                                  color: theme.EcommerceColorsExtensions.primary,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
