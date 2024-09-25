import 'package:evaly/app/widgets/KText.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../const/const.dart';
import '../controllers/edit_profile_page_controller.dart';

class EditProfilePageView extends GetView<EditProfilePageController> {
  const EditProfilePageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var kHeight = MediaQuery.of(context).size.height / 100;
    var kWidth = MediaQuery.of(context).size.width / 100;
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Ktext(
                  text: 'Edit Profile',
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
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

              //
              //
              const SizedBox(height: 20),
              Ktext(
                text: 'Gender',
                fontSize: 14,
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Obx(
                    () => GestureDetector(
                      onTap: () {
                        controller.gender.value = true;
                      },
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        curve: Curves.linear,
                        height: 80,
                        width: 70,
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: controller.gender.value
                                  ? Colors.black
                                  : Colors.grey.shade200),
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image(
                              image: AssetImage(
                                "assets/man.png",
                              ),
                              height: 40,
                            ),
                            SizedBox(height: 5),
                            Text(
                              "Male",
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Obx(
                    () => GestureDetector(
                      onTap: () {
                        controller.gender.value = false;
                      },
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 100),
                        curve: Curves.linear,
                        height: 80,
                        width: 70,
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: controller.gender.value
                                  ? Colors.grey.shade200
                                  : Colors.black),
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image(
                              image: AssetImage(
                                "assets/woman.png",
                              ),
                              height: 40,
                            ),
                            SizedBox(height: 5),
                            Text(
                              "Female",
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
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
                  child: Ktext(text: "Update", color: Colors.white)),
            ],
          ),
        ),
      ),
    );
  }
}
