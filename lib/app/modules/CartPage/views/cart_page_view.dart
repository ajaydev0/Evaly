import 'package:evaly/app/modules/CartPage/list/cart_list.dart';
import 'package:evaly/app/router/app_pages.dart';
import 'package:evaly/app/widgets/KText.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../controllers/cart_page_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartPageView extends GetView<CartPageController> {
  const CartPageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var AppHeight = (MediaQuery.of(context).size.height) / 100;
    var AppWidth = (MediaQuery.of(context).size.width) / 100;
    Get.put(CartPageController());

    //

    // RxDouble total = 0.0.obs;
    // for (ProductModel item in productList) {
    //   total += item.product.price * item.quantity;
    // }

    return Obx(
      () => Scaffold(
        backgroundColor: Colors.grey.shade200,
        appBar: AppBar(
          title: Ktext(text: 'Shopping Cart'),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () {
                  // controller.isNullCart.value = false;
                  cartList = [].obs;
                  cartList.refresh();
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
                : SizedBox(
                    height: AppHeight * 71,
                    width: AppWidth * 100,
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: ListView.builder(
                        itemCount: cartList.length,
                        itemBuilder: (context, index) {
                          var data = cartList[index];
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15)),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 10,
                                        left: 10,
                                        right: 10,
                                        bottom: 10),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        const Icon(Icons.store_outlined,
                                            size: 18),
                                        const SizedBox(width: 4),
                                        Ktext(
                                            text:
                                                "${data.productData.brand} Official Store for Flash Sale COD" ??
                                                    "",
                                            fontSize: 11),
                                      ],
                                    ),
                                  ),
                                  Row(
                                    // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Checkbox(
                                        shape: const CircleBorder(),
                                        value: false,
                                        onChanged: (value) {},
                                      ),
                                      Container(
                                        height: 70,
                                        width: 75,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            border: Border.all(
                                                color: Colors.grey.shade200),
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                        padding: const EdgeInsets.all(3),
                                        child: Image.asset(
                                          data.productData.imageUrl ?? "",
                                          // height: 60,
                                        ),
                                      ),
                                      const SizedBox(width: 8),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Container(
                                            height: 40,
                                            width: AppWidth * 55,
                                            // color: Colors.amber,
                                            child: Ktext(
                                                text: data.productData.productName ?? "",
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 2,
                                                fontSize: 12),
                                          ),
                                          const SizedBox(height: 2),
                                          Ktext(
                                              text: "৳ ${data.productData.mainPrice} x 1 ",
                                              fontSize: 9,
                                              color: Colors.grey),
                                          Container(
                                            height: 20,
                                            width: AppWidth * 55,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Ktext(
                                                    text: "৳ ${data.productData.mainPrice}",
                                                    fontSize: 12,
                                                    color: Colors.amber[800],
                                                    fontWeight:
                                                        FontWeight.bold),

                                                //
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          right: 10),
                                                  child: Row(
                                                    children: [
                                                      InkWell(
                                                        onTap: () {
                                                          // print("Remove");
                                                          // adjustQuantity(item,
                                                          //     item.quantity - 1);
                                                          // removeFromCart(item);
                                                           controller.quantityDelete(data);
                                                        },
                                                        child: Container(
                                                            height: 20,
                                                            width: 20,
                                                            decoration:
                                                                BoxDecoration(
                                                              boxShadow: [
                                                                BoxShadow(
                                                                  color: Colors
                                                                      .black
                                                                      .withOpacity(
                                                                          .2),
                                                                  blurRadius:
                                                                      5.0,
                                                                  offset:
                                                                      const Offset(
                                                                          0, 3),
                                                                ),
                                                              ],
                                                              color: Colors
                                                                  .grey[200],
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          40),
                                                            ),
                                                            child: const Icon(
                                                              Icons.remove,
                                                              color:
                                                                  Colors.black,
                                                              size: 15,
                                                            )),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .symmetric(
                                                                horizontal: 10),
                                                        child: Ktext(
                                                            // text: "${item.quantity}",
                                                            text: "${data.quantity.value}",
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                      InkWell(
                                                        onTap: () {
                                                          controller.quantityAdd(data);
                                                          // print("Add");
                                                          // adjustQuantity(item,
                                                          //     item.quantity + 1);
                                                        },
                                                        child: Container(
                                                            height: 20,
                                                            width: 20,
                                                            decoration:
                                                                BoxDecoration(
                                                              boxShadow: [
                                                                BoxShadow(
                                                                  color: Colors
                                                                      .black
                                                                      .withOpacity(
                                                                          .2),
                                                                  blurRadius:
                                                                      5.0,
                                                                  offset:
                                                                      const Offset(
                                                                          0, 3),
                                                                ),
                                                              ],
                                                              color: Colors
                                                                  .grey[200],
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          40),
                                                            ),
                                                            child: const Icon(
                                                              Icons.add,
                                                              color:
                                                                  Colors.black,
                                                              size: 15,
                                                            )),
                                                      ),
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                  const SizedBox(height: 20),
                                ],
                              ),
                            ),
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
