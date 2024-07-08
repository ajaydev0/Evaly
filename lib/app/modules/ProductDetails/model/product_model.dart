//Product Model
class ProductModel {
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

  ProductModel(
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
      this.onTap});
}