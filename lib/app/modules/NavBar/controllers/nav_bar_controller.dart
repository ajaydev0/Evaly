import 'package:evaly/app/modules/CartPage/views/cart_page_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../ProfilePage/views/profile_page_view.dart';
import '../../homePage/views/home_page_view.dart';


class NavBarController extends GetxController {
  RxInt currentindex = 0.obs;

  List pages = [
    const HomePageView(),
    Container(color: Colors.white),
    const CartPageView(),
    const ProfilePageView()
  ];
}
