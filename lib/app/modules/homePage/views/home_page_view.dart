import 'package:evaly/app/router/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../const/const.dart';
import '../../../widgets/KText.dart';
import '../../ProductDetails/list/product_list.dart';
import '../controllers/home_page_controller.dart';

class HomePageView extends GetView<HomePageController> {
  const HomePageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var AppHeight = (MediaQuery.of(context).size.height) / 100;
    var AppWidth = (MediaQuery.of(context).size.width) / 100;
    var controller = Get.put(HomePageController());
    return Scaffold(
        backgroundColor: Colors.grey.shade200,
        key: controller.globalKey,
        drawer: SafeArea(child: KDrawer(controller, context)),
        // backgroundColor: Color.fromARGB(255, 172, 171, 171),
        body: Padding(
          padding: const EdgeInsets.only(left: 10, right: 5, top: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 5, right: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  // crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: () {
                        controller.globalKey.currentState?.openDrawer();
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: 30,
                        width: 30,
                        margin: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            image: const DecorationImage(
                              image: AssetImage("assets/icons/menu.png"),
                              fit: BoxFit.cover,
                            ),
                            // color: Colors.grey,
                            borderRadius: BorderRadius.circular(50)),
                      ),
                    ),
                    Container(
                      height: 35,
                      width: 240,
                      decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(50)),
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const SizedBox(width: 10),
                          Container(
                            alignment: Alignment.center,
                            height: 18,
                            width: 18,
                            decoration: BoxDecoration(
                                image: const DecorationImage(
                                  image: AssetImage("assets/icons/search.png"),
                                  fit: BoxFit.cover,
                                ),
                                // color: Colors.grey.shade200,
                                borderRadius: BorderRadius.circular(50)),
                          ),
                          Container(
                            height: 35,
                            width: 200,
                            padding: const EdgeInsets.only(
                              top: 10,
                            ),
                            child: const TextField(
                              decoration: InputDecoration(
                                  hintText: "What would you like to buy?",
                                  hintStyle: TextStyle(
                                      fontSize: 12.5,
                                      fontFamily: "Aleo",
                                      color: Colors.black),
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide.none)),
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Row(
                    //   children: [
                    //     Icon(Icons.location_on_outlined,
                    //         size: 17, color: Colors.grey.shade600),
                    //     const SizedBox(width: 1),
                    //     Ktext(
                    //       text: "Mirpur 10",
                    //       fontSize: 15,
                    //       color: Colors.grey.shade600,
                    //     ),
                    //   ],
                    // ),
                    InkWell(
                      onTap: () {
                        // controller.globalKey.currentState?.openDrawer();
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: 28,
                        width: 28,
                        margin: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            image: const DecorationImage(
                              image:
                                  AssetImage("assets/icons/notification.png"),
                              fit: BoxFit.cover,
                            ),
                            // color: Colors.grey,
                            borderRadius: BorderRadius.circular(50)),
                      ),
                    ),
                  ],
                ),
              ),
              //HomePage Works
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 200,
                    childAspectRatio: 1.3 / 2,
                    // crossAxisSpacing: 20,
                    // mainAxisSpacing: 20,
                  ),
                  itemCount: productList.length,
                  itemBuilder: (context, index) {
                    var data = productList[index];
                    return GestureDetector(
                      onTap: () {
                        Get.toNamed(Routes.PRODUCT_DETAILS, arguments: data);
                        
                      },
                      child: Container(
                        margin: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            //Product Image
                            Container(
                              height: 120,
                              margin: const EdgeInsets.all(10),
                              color: Colors.white,
                              child: Image.asset(data.imageUrl ?? ""),
                            ),
                            // Image.asset(data.imageUrl,height: 100,)
                            //Product Name
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 13),
                              child: Ktext(
                                text: data.productName,
                                fontSize: 11,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 3,
                              ),
                            ),
                            //Discount Price
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 13),
                              child: Row(
                                children: [
                                  Ktext(
                                      text: "৳ ${data.discountPrice}",
                                      fontSize: 9,
                                      decoration: TextDecoration.lineThrough,
                                      color: Colors.grey),
                                ],
                              ),
                            ),
                            //Main Price
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 13),
                              child: Row(
                                children: [
                                  Ktext(
                                      text: "৳ ${data.mainPrice}",
                                      fontSize: 10,
                                      color: Colors.amber[800],
                                      fontWeight: FontWeight.bold),
                                ],
                              ),
                            ),
                            //Stock
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 13),
                              child: Row(
                                children: [
                                  Ktext(
                                      text: "in stock",
                                      fontSize: 9,
                                      color: Colors.grey),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ));
  }
}

Widget KDrawer(
  HomePageController controller,
  BuildContext context,
) {
  return Drawer(
    // width: Kw(value: 70, context: context),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Card(
          child: ListTile(
            title: Padding(
              padding: const EdgeInsets.only(
                right: 80,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      //close Drawer
                      controller.globalKey.currentState?.closeEndDrawer();
                    },
                    icon: Icon(
                      Icons.arrow_back,
                      color: Kcolor.black,
                    ),
                  ),
                  Ktext(
                    text: "Settings",
                    fontSize: 22,
                  ),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 25, right: 25),
          child: Divider(
            thickness: 2,
            color: Colors.grey.shade300,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Card(
            child: ListTile(
              title:
                  Ktext(text: "Account Setting", color: Colors.grey.shade600),
              leading: CircleAvatar(
                backgroundColor: Kcolor.black,
                child: Icon(
                  Icons.settings,
                  size: 20,
                  color: Kcolor.white,
                ),
              ),
              onTap: () {},
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Card(
            child: ListTile(
              title: Ktext(text: "My Order", color: Colors.grey.shade600),
              leading: CircleAvatar(
                backgroundColor: Kcolor.black,
                child: Icon(
                  Icons.create,
                  size: 20,
                  color: Kcolor.white,
                ),
              ),
              onTap: () {},
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Card(
            child: ExpansionTile(
              title: Ktext(text: "Appearance", color: Colors.grey.shade600),
              leading: CircleAvatar(
                backgroundColor: Kcolor.black,
                child: Icon(
                  Icons.color_lens,
                  size: 20,
                  color: Kcolor.white,
                ),
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    top: 5,
                    bottom: 20,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              // Get.find<MyAppController>().lightMode();
                              // Get.changeThemeMode(ThemeMode.light);
                              // Get.changeTheme(ThemeData.light());

                              print("LightMode");
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Kcolor.black,
                                  borderRadius: BorderRadius.circular(20)),
                              height: 50,
                              width: 50,
                              child: const Icon(
                                Icons.light_mode,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Ktext(text: "Light", color: Colors.grey.shade600),
                        ],
                      ),
                      Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              // Get.find<MyAppController>().darkMode();
                              // controller.theme.value = false;
                              // Get.changeThemeMode(ThemeMode.dark);
                              // box.value.write("themeData", ThemeData());
                              // Get.changeTheme(ThemeData.dark());

                              print("DarkMode");
                              // print(KData.themeData);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.grey.withOpacity(.3),
                                  borderRadius: BorderRadius.circular(20)),
                              height: 50,
                              width: 50,
                              child: const Icon(
                                Icons.dark_mode,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Ktext(text: "Dark", color: Colors.grey.shade600),
                        ],
                      ),
                      Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              // Get.changeThemeMode(ThemeMode.system);
                              print("SystemThemeMode");
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.grey.withOpacity(.3),
                                  borderRadius: BorderRadius.circular(20)),
                              height: 50,
                              width: 50,
                              child: const Icon(
                                Icons.settings_suggest,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Ktext(text: "System", color: Colors.grey.shade600),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Card(
            child: ListTile(
              title: Ktext(text: "Chat with Us", color: Colors.grey.shade600),
              // subtitle: Text("Feel Free to Contact Us"),
              leading: CircleAvatar(
                backgroundColor: Kcolor.black,
                child: Icon(
                  Icons.headset_mic_outlined,
                  size: 20,
                  color: Kcolor.white,
                ),
              ),

              onTap: () {},
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Card(
            child: ListTile(
              title: Ktext(text: "Help Center", color: Colors.grey.shade600),
              leading: CircleAvatar(
                backgroundColor: Kcolor.black,
                child: Icon(
                  Icons.question_mark,
                  size: 20,
                  color: Kcolor.white,
                ),
              ),
              onTap: () {
                // Get.offAllNamed(Routes.signInScreen);
              },
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 25, right: 25),
          child: Divider(
            thickness: 2,
            color: Colors.grey.shade300,
          ),
        ),
        Card(
          color: Colors.white,
          child: ListTile(
            title: Ktext(text: "Log Out", color: Colors.grey.shade600),
            leading: CircleAvatar(
              backgroundColor: Kcolor.black,
              child: Icon(
                Icons.logout,
                size: 20,
                color: Kcolor.white,
              ),
            ),
            trailing: Icon(
              Icons.arrow_forward,
              color: Colors.grey.shade300,
            ),
            onTap: () {},
          ),
        ),
      ],
    ),
  );
}
