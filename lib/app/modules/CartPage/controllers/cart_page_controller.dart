import 'package:get/get.dart';

class CartPageController extends GetxController {
  RxBool isNullCart = false.obs;
}

//Cart Model
class CartModel {
  String? imageUrl;
  String? productName;
  String? description;
  String? onTap;

  CartModel({this.imageUrl, this.productName, this.description});
}

//Cart List
List cartItem = [
  CartModel(
      imageUrl: "assets/Product/iphoneX.jpg",
      productName: "Learn UI/UX Design",
      description:
          "Welcome to our School Management App. Our App is very Userfriendly.Hope u like it."),
  CartModel(
      imageUrl: "assets/Product/iphoneXR.jpg",
      productName: "Learn Web Development",
      description:
          "Welcome to our School Management App. Our App is very Userfriendly.Hope u like it."),
  CartModel(
      imageUrl: "assets/Product/iphone11.jpg",
      productName: "Learn Grahics Design",
      description:
          "Welcome to our School Management App. Our App is very Userfriendly.Hope u like it."),
  CartModel(
      imageUrl: "assets/Product/iphone13.jpg",
      productName: "Learn App Development",
      description:
          "Welcome to our School Management App. Our App is very Userfriendly.Hope u like it."),
];
