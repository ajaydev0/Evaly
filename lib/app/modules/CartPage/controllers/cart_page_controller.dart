import 'package:evaly/app/modules/CartPage/list/cart_list.dart';
import 'package:evaly/app/modules/CartPage/model/cart_model.dart';
import 'package:evaly/app/modules/ProductDetails/model/product_model.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/state_manager.dart';
import 'package:get_storage/get_storage.dart';

class CartPageController extends GetxController {
  RxInt updatePrice = 0.obs;
  RxInt totalAmount = 0.obs;
  // Cart List Is ( Null / Empty).
  RxBool isNullCart = false.obs;
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
    if (data.quantity.value > 1) {
      data.quantity--;
      cartList.refresh();
    } else {
      print("Quantity 1 Ta hoi gese");
      return;
    }
    print(data.quantity);
  }

  // (+) Quantity
  quantityAdd(data) {
    if (data.quantity.value < 5) {
      data.quantity++;
      if(data.isSelect){
        print("Is Select True Ace");
      }
      cartList.refresh();
    } else {
      print("Quantity 5 Ta hoi gese");
      return;
    }
    print(data.quantity);
  }

  // Delete Button Logic
  deleteButton() {
    cartList.clear();
    cartList.refresh();
  }

  // CheckBok Logics
  RxBool isAll = false.obs;
  allSelect(bool value) {
    isAll.value = value;
    for (var element in cartList) {
      element.isSelect = value;
    }
    cartList.refresh();
  }

  select(
      {required int index, required bool select, required int productPrice}) {
    cartList[index].isSelect = select;
    if (select) {
      totalAmount.value = totalAmount.value + productPrice;
    } else {
      totalAmount.value = totalAmount.value - productPrice;
    }
    cartList.refresh();
  }
}
