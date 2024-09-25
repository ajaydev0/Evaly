import 'package:evaly/app/modules/CartPage/list/cart_list.dart';
import 'package:evaly/app/modules/CartPage/model/cart_model.dart';
import 'package:evaly/app/modules/ProductDetails/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

import '../../../const/const.dart';
import '../../../widgets/KText.dart';

class CartPageController extends GetxController {
  RxInt updatePrice = 0.obs;
  RxInt totalAmount = 0.obs;
  // Cart Add logic
  void addToCart(ProductModel productData) {
    // if the product is already in cart
    for (CartModel item in cartList) {
      if (item.productData == productData) {
        item.quantity.value++;
        return;
      }
    }

    // If not, Product add it to the cart
    cartList.add(CartModel(productData, 1.obs));
  }

  // Quantity Adjustment
  // (-) Quantity
  quantityDelete(data) {
    if (data.isSelect) {
      // isSelect True Condition
      Get.snackbar("Notice", "Uncheck the Box to upgrade quantity.");
    } else if (data.isSelect == false) {
      // isSelect False Condition
      if (data.quantity.value > 1) {
        data.quantity--;
        cartList.refresh();
      } else {
        Get.snackbar("Notice", "Minimum Quantity 1.");
        return;
      }
    }

    print(data.quantity);
  }

  // (+) Quantity
  quantityAdd(data) {
    if (data.isSelect) {
      // isSelect True Condition
      Get.snackbar("Notice", "Uncheck the Box to upgrade quantity.");
    } else if (data.isSelect == false) {
      // isSelect False Condition
      if (data.quantity.value < 5) {
        data.quantity++;
        cartList.refresh();
      } else {
        Get.snackbar("Notice", "Maximum 5 Quantity you can Added.");
        return;
      }
    }

    print(data.quantity);
  }

  // Delete Button Logic
  confirmDelete(
    context,
  ) {
    return showDialog(
      // barrierDismissible: false,
      context: context,
      builder: (context) {
        return Dialog(
          shape: const RoundedRectangleBorder(),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            height: 130,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Ktext(
                    text:
                        "Are you sure you want to delete the selected products from the cart?"),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      height: 35,
                      width: 90,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: const LinearBorder(),
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Ktext(
                                text: "No",
                                color: Colors.black,
                              ),
                            ],
                          )),
                    ),
                    SizedBox(
                      height: 35,
                      width: 90,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: const LinearBorder(),
                          ),
                          onPressed: () {
                            var controller = Get.find<CartPageController>();
                            controller.deleteItem();
                            Navigator.pop(context);
                          
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Ktext(
                                text: "Yes",
                                color: Colors.black,
                              ),
                            ],
                          )),
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }

  deleteItem() {
    cartList.clear();
    cartList.refresh();
  }

  // CheckBok Logics
  RxBool isAll = false.obs;
  allSelect(bool value) {
    isAll.value = value;
    for (var element in cartList) {
      // totalAmount.value = 0;
      element.isSelect = value;
      // totalAmount.value = element.mainPrice + totalAmount.value;
    }
    if (isAll.value) {
      // isAll True Logic
      print("isAll true");
    } else {
      // isAll False Logic
      print("isAll false");
    }
    cartList.refresh();
  }

  select({
    required int index,
    required bool select,
    required int productPrice,
  }) {
    // RxBool checkAll = false.obs
    cartList[index].isSelect = select;
    if (select) {
      totalAmount.value = totalAmount.value + productPrice;
      // Check  All true ace ki na then ( isAll == true.obs )
      // checkAll();
    } else if (select == false) {
      totalAmount.value = totalAmount.value - productPrice;
      // if (isAll == true.obs) {
      //   isAll = false.obs;
      // }
    }
    // Check All Logic
    // for (var element in cartList) {
    //   element.isSelect = select;
    // }
    cartList.refresh();
  }

  // Item Delete Confirm Dialog Box
}
