// ignore_for_file: use_super_parameters

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../const/const.dart';
import '../controllers/nav_bar_controller.dart';

class NavBarView extends GetView<NavBarController> {
  const NavBarView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height / 100;
    var screenWidth = MediaQuery.of(context).size.width / 100;
    var navBarHeight = screenHeight * 2.8;
    return Obx(
      () => Scaffold(
        extendBody: true,
        bottomNavigationBar: ClipRRect(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15), topRight: Radius.circular(20)),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.white,
            ),
            child: BottomNavigationBar(
              backgroundColor: Colors.white,
              // showUnselectedLabels: false,
              showSelectedLabels: true,
              selectedFontSize:11 ,
              unselectedFontSize: 11,
              selectedItemColor: Colors.black,
              selectedLabelStyle: TextStyle(fontFamily: "Aleo"),
              unselectedLabelStyle: TextStyle(fontFamily: "Aleo"),
              type: BottomNavigationBarType.fixed,
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Padding(
                    padding: const EdgeInsets.only(top: 5,bottom: 3),
                    child: Image.asset(
                      controller.currentindex.value == 0
                          ? "assets/icons/home.png"
                          : "assets/icons/home2.png",
                      height: navBarHeight,
                      // height: 27,
                      color: controller.currentindex.value == 0
                          ? Kcolor.black
                          : Colors.grey.shade500,
                    ),
                  ),
                  label: "Home",
                  
                ),
                BottomNavigationBarItem(
                  icon: Padding(
                    padding: const EdgeInsets.only(top: 5,bottom: 3),
                    child: Image.asset(
                      controller.currentindex.value == 1
                          ? "assets/icons/love.png"
                          : "assets/icons/love2.png",
                      height: navBarHeight,

                      // height: 27,
                      color: controller.currentindex.value == 1
                          ? Kcolor.black
                          : Colors.grey.shade500,
                    ),
                  ),
                  label: 'Favorite',
                ),
                BottomNavigationBarItem(
                  icon: Padding(
            padding: const EdgeInsets.only(top: 5,bottom: 3),
                    child: Image.asset(
                      controller.currentindex.value == 2
                          ? "assets/icons/cart.png"
                          : "assets/icons/cart2.png",
                      height: navBarHeight,
                      // height: 27,
                      color: controller.currentindex.value == 2
                          ? Kcolor.black
                          : Colors.grey.shade500,
                    ),
                  ),
                  label: 'Cart',
                ),
                BottomNavigationBarItem(
                  icon: Padding(
              padding: const EdgeInsets.only(top: 5,bottom: 3),
                    child: Image.asset(
                      controller.currentindex.value == 3
                          ? "assets/icons/user.png"
                          : "assets/icons/user2.png",
                      height: navBarHeight,
                      // height: 27,
                      color: controller.currentindex.value == 3
                          ? Kcolor.black
                          : Colors.grey.shade500,
                    ),
                  ),
                  label: 'Profile',
                ),
              ],
              onTap: (index) {
                controller.currentindex.value = index;
              },
              currentIndex: controller.currentindex.value,
            ),
          ),
        ),
        body: controller.pages[controller.currentindex.value],
      ),
    );
  }
}
