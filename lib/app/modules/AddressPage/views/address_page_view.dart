import 'package:evaly/app/router/app_pages.dart';
import 'package:evaly/app/widgets/KText.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../const/const.dart';
import '../controllers/address_page_controller.dart';

class AddressPageView extends GetView<AddressPageController> {
  const AddressPageView({super.key});
  @override
  Widget build(BuildContext context) {
    var kHeight = MediaQuery.of(context).size.height / 100;
    var kWidth = MediaQuery.of(context).size.width / 100;
    return Scaffold(
        appBar: AppBar(
          title: const Text('Addresses'),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () {
                  Get.toNamed(Routes.ADD_NEW_ADDRESS_PAGE);
                },
                icon: Icon(Icons.add))
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: ListView.builder(
            itemCount: 2,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Material(
                  elevation: 5,
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    height: 150,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20)),
                    child: Padding(
                      padding: const EdgeInsets.only(right: 20, left: 20,top: 10,bottom: 10),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                         height: 35,
                                    width: 35,
                                decoration: BoxDecoration(
                                    color: Colors.grey.shade200,
                                    borderRadius: BorderRadius.circular(50)),
                                child: IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.home_outlined,
                                            size: 15,
                                    )),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Container(
                                height: 75,
                                width: 200,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Ktext(text: "Ajay Dev",fontSize: 13),
                                    Ktext(text: "01889243681",fontSize: 10),
                                    Ktext(
                                        text:
                                            "Landmark, Surer Kunjo, #Road 5, Diya Bari, Uttara, Dhaka, 3900, Dhaka",fontSize: 10,overflow: TextOverflow.ellipsis,maxLines: 2),
                                  ],
                                ),
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              MaterialButton(
                                  height: kHeight * 4,
                                  minWidth: kWidth * 15,
                                  onPressed: () {
                                    // controller.onClickLogIn();
                                  },
                                  color: Kcolor.black,
                                  shape: OutlineInputBorder(),
                                  child: Ktext(
                                      text: "Default", color: Colors.white,fontSize: 11)),
                              Row(
                                children: [
                                  Container(
                                    height: 35,
                                    width: 35,
                                    decoration: BoxDecoration(
                                        color: Colors.grey.shade200,
                                        borderRadius:
                                            BorderRadius.circular(50)),
                                    child: IconButton(
                                        onPressed: () {},
                                        icon: Icon(
                                          Icons.edit_outlined,
                                          size: 15,
                                        )),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Container(
                                           height: 35,
                                    width: 35,
                                    decoration: BoxDecoration(
                                        color: Colors.grey.shade200,
                                        borderRadius:
                                            BorderRadius.circular(50)),
                                    child: IconButton(
                                        onPressed: () {},
                                        icon: Icon(
                                          Icons.delete,
                                           size: 15,
                                        )),
                                  ),
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ));
  }
}
