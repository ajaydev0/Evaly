import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../widgets/KText.dart';
import '../../CartPage/controllers/cart_page_controller.dart';
import '../controllers/product_details_controller.dart';

class ProductDetailsView extends GetView<ProductDetailsController> {
  const ProductDetailsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var AppHeight = (MediaQuery.of(context).size.height) / 100;
    var AppWidth = (MediaQuery.of(context).size.width) / 100;
    var cartController = Get.put(CartPageController());
    var productData = Get.arguments;
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text('ProductDetailsView'),
          centerTitle: true,
          backgroundColor: Colors.white,
        ),
        body: ListView(
          children: [
            Column(
              children: [
                Container(
                  height: 300,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Image.asset(productData.imageUrl ?? ""),
                ),
                // Product Name
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15, top: 20),
                  child: Ktext(
                    text: productData.productName ?? "",
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(
                    left: 15,
                    right: 15,
                  ),
                  child: Row(
                    children: [
                      Ktext(
                          text:
                              "Electronics, SmartPhone - ( ${productData.brand ?? ""} )",
                          fontSize: 12,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          color: Colors.blue[300]),
                    ],
                  ),
                ),
                // Price Row
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      // Main Price
                      Ktext(
                          text: "৳ ${productData.mainPrice ?? ""}",
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          color: Colors.amber[800]),
                      const SizedBox(width: 10),
                      // Discount Price
                      Ktext(
                          text: "৳ ${productData.discountPrice ?? ""}",
                          fontSize: 10,
                          decoration: TextDecoration.lineThrough,
                          color: Colors.grey),
                    ],
                  ),
                ),
                // Description
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15, top: 20),
                  child: Row(
                    children: [
                      Ktext(
                        text: "Description",
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15, top: 5),
                  child: Ktext(
                      text: productData.description ?? "",
                      fontSize: 12,
                      color: Colors.grey[700]),
                ),
                // Specifications
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
                  child: Row(
                    children: [
                      Ktext(
                        text: "Specifications",
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ],
                  ),
                ),
                //Brand Spec
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: AppWidth * 45,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Ktext(
                                text: "Brand",
                                fontSize: 12,
                                color: Colors.grey[700]),
                            const SizedBox(height: 10),
                            Ktext(
                                text: "Product Type",
                                fontSize: 12,
                                color: Colors.grey[700]),
                            const SizedBox(height: 10),
                            Ktext(
                                text: "Model",
                                fontSize: 12,
                                color: Colors.grey[700]),
                            const SizedBox(height: 10),
                            Ktext(
                                text: "Color",
                                fontSize: 12,
                                color: Colors.grey[700]),
                            const SizedBox(height: 10),
                            Ktext(
                                text: "Warranty",
                                fontSize: 12,
                                color: Colors.grey[700]),
                          ],
                        ),
                      ),
                      //
                      Container(
                        width: AppWidth * 45,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Ktext(
                              text: productData.brand ?? "",
                              fontSize: 12,
                            ),
                            const SizedBox(height: 10),
                            Ktext(
                              text: productData.productType ?? "",
                              fontSize: 12,
                            ),
                            const SizedBox(height: 10),
                            Ktext(
                              text: productData.model ?? "",
                              fontSize: 12,
                            ),
                            const SizedBox(height: 10),
                            Ktext(
                              text: productData.color ?? "",
                              fontSize: 12,
                            ),
                            const SizedBox(height: 10),
                            Ktext(
                              text: productData.warranty ?? "",
                              fontSize: 12,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                // Buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    MaterialButton(
                        height: AppHeight * 5,
                        minWidth: AppWidth * 42,
                        onPressed: () {
                          cartController.addToCart(productData);
                          //  print("Add To Cart");
                        },
                        color: Colors.grey.shade100,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: Ktext(
                            text: "Add to Cart",
                            color: Colors.black,
                            fontSize: 13)),
                    MaterialButton(
                        height: AppHeight * 5,
                        minWidth: AppWidth * 42,
                        onPressed: () {
                          print("Buy Now Logic");
                        },
                        color: Colors.black,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: Ktext(
                            text: "Buy Now",
                            color: Colors.white,
                            fontSize: 13)),
                  ],
                ),
                // Padding(
                //   padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
                //   child: Row(
                //     children: [
                //       Ktext(
                //         text: "Related ",
                //         fontSize: 14,
                //         fontWeight: FontWeight.bold,
                //       ),
                //     ],
                //   ),
                // ),
                const SizedBox(height: 30),
                // Related Product
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
                  child: Row(
                    children: [
                      Ktext(
                        text: "Related Products",
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ],
                  ),
                ),

                //Last a Di
                const SizedBox(height: 50),
              ],
            )
          ],
        ));
  }
}
