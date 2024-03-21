import 'package:common/common.dart';
import 'package:e_commerce/utils/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:phone_text_field/phone_text_field.dart';

import '../dashboard/bottom_bar.dart';

class CreateProfile extends StatelessWidget {
  CreateProfile({super.key});

  TextEditingController nameController = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final padding = EdgeInsetsOf(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.EcommerceColorsExtensions.onBackground,
      ),
      body: Padding(
        padding: padding.all(Dimensions.medium),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                Constant.completeYourProfile,
                style: theme.textTheme.headlineLarge,
              ),
              Text(
                Constant.doWorry,
                style: theme.textTheme.bodyMedium?.copyWith(
                    color: theme.EcommerceColorsExtensions.secondary),
                textAlign: TextAlign.center,
              ),
              Stack(
                children: [
                  CircleAvatar(
                      child: Icon(Icons.person,
                          size: 70,
                          color: theme.EcommerceColorsExtensions.primary),
                      radius: 60,
                      backgroundColor: Colors.grey[300]),
                  Positioned(
                    bottom: MediaQuery.sizeOf(context).height / 100,
                    right: MediaQuery.sizeOf(context).width / 100,
                    child: CircleAvatar(
                      radius: 15,
                      child: Icon(
                        Icons.edit,
                      ),
                    ),
                  ),
                ],
              ),
              RegularTextFormField(
                controller: nameController,
                label: Constant.label1,
                needLabel: true,
                hintText: Constant.hintText1,
                validation: (value) {},
              ),
              Space(Dimensions.small),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  Constant.phoneNumber,
                  style: theme.textTheme.titleLarge,
                ),
              ),
              Space(Dimensions.smallest),
              PhoneTextField(
                focusNode: _focusNode,
                decoration: InputDecoration(
                  isDense: true,
                  hintText: Constant.enterPhoneNumber,
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 1,
                      color: theme.EcommerceColorsExtensions.border,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 1,
                      color: theme.EcommerceColorsExtensions.primary,
                    ),
                    borderRadius: BorderRadius.circular(
                      Dimensions.of(context).radii.small,
                    ),
                  ),
                ),
                searchFieldInputDecoration: InputDecoration(
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(),
                  ),
                  suffixIcon: Icon(Icons.search),
                  hintText: "Search country",
                ),
                initialCountryCode: "IN",
                onChanged: (phone) {
                  debugPrint(phone.completeNumber);
                },
              ),
              Space(Dimensions.small),
              BaseDropDownFormField(
                  label: Constant.gender,
                  value: 'Select',
                  onChanged: (value) {},
                  validator: (value) {},
                  options: ['Male', 'Female', 'Other']),
              Space(Dimensions.large),
              SubmitButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    CupertinoPageRoute(builder: (context) => BottomBarWidget()),
                  );
                },
                text: Constant.completeProfile,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
