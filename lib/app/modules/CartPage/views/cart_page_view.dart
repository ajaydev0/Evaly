import 'package:evaly/app/router/app_pages.dart';
import 'package:evaly/app/widgets/KText.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import '../controllers/cart_page_controller.dart';

class CartPageView extends GetView<CartPageController> {
  const CartPageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var AppHeight = (MediaQuery.of(context).size.height) / 100;
    var AppWidth = (MediaQuery.of(context).size.width) / 100;
    Get.put(CartPageController());
    return Obx(
      () => Scaffold(
        backgroundColor: Colors.grey.shade200,
        appBar: AppBar(
          title: Ktext(text: 'Shopping Cart'),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () {
                  controller.isNullCart.value = false;
                },
                icon: const Icon(Icons.delete))
          ],
        ),
        body: Column(
          children: [
            controller.isNullCart.value
                ? Expanded(
                    child: Container(
                      width: AppWidth * 100,
                      color: Colors.grey.shade200,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              const SizedBox(height: 150),
                              GestureDetector(
                                onTap: () {
                                  Get.toNamed(Routes.CART_PAGE);
                                },
                                child: Image.asset(
                                  "assets/empty Cart.png",
                                  height: 130,
                                ),
                              ),
                              const SizedBox(height: 20),
                              Ktext(
                                  text: "Nothing is added to Cart....",
                                  fontSize: 16),
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                : Container(
                    height: AppHeight * 71,
                    width: AppWidth * 100,
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: ListView.builder(
                        itemCount: 20,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: EdgeInsets.only(bottom: 10),
                            height: 100,
                            color: Colors.amber,
                          );
                        },
                      ),
                    )),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding: const EdgeInsets.only(left: 5, right: 10),
                height: AppHeight * 8.6,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Checkbox(
                          value: false,
                          onChanged: (value) {},
                        ),
                        Ktext(text: "All"),
                      ],
                    ),
                    Row(
                      children: [
                        Ktext(text: "Total : "),
                        Ktext(
                          text: "৳1000",
                          color: Colors.amber[800],
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                        const SizedBox(width: 10),
                        MaterialButton(
                            height: 40,
                            minWidth: 100,
                            onPressed: () {},
                            color: Colors.black,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            child: Ktext(
                              text: "Check Out",
                              color: Colors.white,
                              fontSize: 14,
                            )),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: AppHeight * 8.4,
              width: double.infinity,
              color: Colors.grey.shade200,
            ),
          ],
        ),
      ),
    );
  }
}
