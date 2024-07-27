//Product Model
import 'package:get/get.dart';

import '../../ProductDetails/model/product_model.dart';

class CartModel {
  //
  final ProductModel productData;
  RxInt quantity;
  //
  String? imageUrl;
  String? productName;
  String? productType;
  String? brand;
  String? discountPrice;
  String? mainPrice;
  String? stock;
  String? description;
  String? specifications;
  String? model;
  String? color;
  String? warranty;
  Function? onTap;
  bool isSelect;

  CartModel(
      //
      this.productData,
      this.quantity,
      //
      {this.imageUrl,
      this.productName,
      this.productType,
      this.brand,
      this.discountPrice,
      this.mainPrice,
      this.stock,
      this.description,
      this.specifications,
      this.model,
      this.color,
      this.warranty,
      this.onTap,
      this.isSelect = false,});
}


// class CartModel {
//   final ProductModel data;
//   int quantity;

//   CartModel(this.data, this.quantity);
// }