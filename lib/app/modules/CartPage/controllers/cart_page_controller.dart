import 'package:evaly/app/modules/CartPage/list/cart_list.dart';
import 'package:evaly/app/modules/CartPage/model/cart_model.dart';
import 'package:evaly/app/modules/ProductDetails/model/product_model.dart';
import 'package:get/get.dart';

class CartPageController extends GetxController {
  // double totalAmount = 0;
  RxBool isNullCart = false.obs;
  // Cart Add logic
  void addToCart(ProductModel productData) {
    // if the product is already in cart
    for (CartModel item in cartList) {
      if (item.productData.model == productData.model) {
        item.quantity.value++;
        print("First");
        print(item.quantity.value);
        return;
      } else {
        cartList.add(CartModel(productData, 1.obs));
        print("Second");
        return;
      }
       
    }

    // If not, add it to the cart
    print("Last");
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
      cartList.refresh();
    } else {
      print("Quantity 5 Ta hoi gese");
      return;
    }
    print(data.quantity);
  }
}
