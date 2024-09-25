import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../const/const.dart';
import '../../../widgets/KText.dart';
import '../controllers/forgot_password_page_controller.dart';

class ForgotPasswordPageView extends GetView<ForgotPasswordPageController> {
  const ForgotPasswordPageView({super.key});
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
                  text: 'Forgot Password',
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
                   const SizedBox(height: 10),
                  Ktext(
                text: "Don't worry! we will send an OTP to your registered email address. ",
                fontSize: 14,
              ), 
              const SizedBox(height: 10),
              // Ktext(
              //   text: 'E-mail',
              //   fontSize: 14,
              // ), 
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
                        Icons.email_outlined,
                        color: Colors.grey,
                      ),
                      hintText: "Enter your email..",
                      hintStyle: TextStyle(
                          color: Colors.grey,
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
                  child: Ktext(text: "Continue", color: Colors.white)),
            ],
          ),
        ),
      ),
    );
  }
}
