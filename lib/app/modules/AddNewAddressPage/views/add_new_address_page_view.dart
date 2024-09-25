import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../const/const.dart';
import '../../../widgets/KText.dart';
import '../controllers/add_new_address_page_controller.dart';

class AddNewAddressPageView extends GetView<AddNewAddressPageController> {
  const AddNewAddressPageView({super.key});
  @override
  Widget build(BuildContext context) {
    var kHeight = MediaQuery.of(context).size.height / 100;
    var kWidth = MediaQuery.of(context).size.width / 100;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Address'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Ktext(
                text: 'Full Name',
                fontSize: 14,
              ), //
              TextFormField(
                  onFieldSubmitted: (value) {
                    // controller.onClickLogIn();
                  },
                  validator: (value) {
                    // return controller.validateEmail(value);
                  },
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  // controller: controller.email,
                  onTapOutside: ((ajay) {
                    FocusScope.of(context).unfocus();
                  }),
                  decoration: InputDecoration(
                      prefixIcon: const Icon(
                        Icons.person_outline,
                        color: Colors.black,
                      ),
                      hintText: "Ovi Nath",
                      hintStyle: TextStyle(
                          color: Colors.black,
                          fontFamily: "Aleo",
                          fontSize: kWidth * 4),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Colors.grey.withOpacity(.5),
                        ),
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide()),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              BorderSide(color: Kcolor.black, width: 1.5)),
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: kWidth * 5.5, vertical: kHeight * 2.7))),
              const SizedBox(height: 20),
              //
              Ktext(
                text: 'Phone Number',
                fontSize: 14,
              ), //
              TextFormField(
                  onFieldSubmitted: (value) {
                    // controller.onClickLogIn();
                  },
                  validator: (value) {
                    // return controller.validateEmail(value);
                  },
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  // controller: controller.email,
                  onTapOutside: ((ajay) {
                    FocusScope.of(context).unfocus();
                  }),
                  decoration: InputDecoration(
                      prefixIcon: const Icon(
                        Icons.call,
                        color: Colors.black,
                      ),
                      hintText: "01889243681",
                      hintStyle: TextStyle(
                          color: Colors.black,
                          fontFamily: "Aleo",
                          fontSize: kWidth * 4),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Colors.grey.withOpacity(.5),
                        ),
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide()),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              BorderSide(color: Kcolor.black, width: 1.5)),
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: kWidth * 5.5, vertical: kHeight * 2.7))),

              const SizedBox(height: 20),
              Ktext(
                text: 'Date of Birth',
                fontSize: 14,
              ),
              TextFormField(
                  onFieldSubmitted: (value) {
                    // controller.onClickLogIn();
                  },
                  validator: (value) {
                    // return controller.validateEmail(value);
                  },
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  // controller: controller.email,
                  onTapOutside: ((ajay) {
                    FocusScope.of(context).unfocus();
                  }),
                  decoration: InputDecoration(
                      prefixIcon: const Icon(
                        Icons.date_range,
                        color: Colors.black,
                      ),
                      hintText: "13/06/2024",
                      hintStyle: TextStyle(
                          color: Colors.black,
                          fontFamily: "Aleo",
                          fontSize: kWidth * 4),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Colors.grey.withOpacity(.5),
                        ),
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide()),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              BorderSide(color: Kcolor.black, width: 1.5)),
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: kWidth * 5.5, vertical: kHeight * 2.7))),
              const SizedBox(height: 20),
              MaterialButton(
                  height: kHeight * 6.8,
                  minWidth: double.infinity,
                  onPressed: () {
                    // controller.onClickLogIn();
                  },
                  color: Kcolor.black,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                  child: Ktext(text: "SAVE ADDRESS", color: Colors.white)),
            ],
          ),
        ),
      ),
    );
  }
}
