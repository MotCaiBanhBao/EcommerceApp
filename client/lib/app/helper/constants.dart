import 'package:flutter/material.dart';
import 'package:product_api/product_api.dart';
import '../modules/home/bloc/home_bloc.dart';
import '../../size_config.dart';

ProductModel sample = ProductModel(
    avatar: '6281ebf4bbeb3b19d7369b58',
    category: '',
    dateAdded: '',
    description: '',
    id: '',
    price: 21,
    productImage: [],
    rate: null,
    title: '21');

String getUserAvatar(String id) =>
    "https://res.cloudinary.com/luongvany/image/upload/v1656936953/User/$id/avatar.jpg";

String getProductAvatar(String id) =>
    "https://res.cloudinary.com/luongvany/image/upload/v1657279815/Product/$id/avatar/$id";

double defaultPadding = getProportionateScreenWidth(20);
const kAnimationDuration = Duration(milliseconds: 200);

final headingStyle = TextStyle(
  fontSize: getProportionateScreenWidth(28),
  fontWeight: FontWeight.bold,
  color: Colors.black,
  height: 1.5,
);

const defaultDuration = Duration(milliseconds: 250);

// Form Error
final RegExp emailValidatorRegExp =
    RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
const String kEmailNullError = "Please Enter your email";
const String kInvalidEmailError = "Please Enter Valid Email";
const String kPassNullError = "Please Enter your password";
const String kShortPassError = "Password is too short";
const String kMatchPassError = "Passwords don't match";
const String kNamelNullError = "Please Enter your name";
const String kPhoneNumberNullError = "Please Enter your phone number";
const String kAddressNullError = "Please Enter your address";

Map<MenuState, String> bottomItems = {
  MenuState.dashboard: "assets/icons/Shop Icon.svg",
  MenuState.favourite: "assets/icons/Heart Icon.svg",
  MenuState.message: "assets/icons/Chat bubble Icon.svg",
  MenuState.profile: "assets/icons/User Icon.svg",
  MenuState.cart: "assets/icons/Cart Icon.svg",
};
