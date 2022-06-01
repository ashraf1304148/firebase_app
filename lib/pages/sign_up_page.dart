import 'package:firebase_app/controller/auth_controller.dart';
import 'package:firebase_app/pages/log_in_page.dart';
import 'package:firebase_app/routes/route_helper.dart';
import 'package:firebase_app/utils/Dimensions.dart';
import 'package:firebase_app/widget/big_text.dart';
import 'package:firebase_app/widget/input_feild_widget.dart';
import 'package:firebase_app/widget/sign_button.dart';
import 'package:firebase_app/widget/small_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPage();
}

class _SignUpPage extends State<SignUpPage> {
  List signupIcons = ["google.png", "twitter.png", "facebook.png"];
  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();

    String email = "", password = "";
    _formValidation() {
      email = emailController.text.trim();
      password = passwordController.text.trim();
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
            // crossAxisAlignment: CrossAxisAlignment.start,
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // header
              Container(
                height: Dimensions.screenHeight * .33,
                width: Dimensions.screenWidth,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/sign_up_header.png"),
                      fit: BoxFit.cover),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: (() {
                        setState(() {});
                        // Get.to(LogInPage());
                      }),
                      child: CircleAvatar(
                        backgroundColor: Colors.blueAccent,
                        radius: Dimensions.height20 * 3,
                        backgroundImage: AssetImage("assets/images/baraa.jpeg"),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: Dimensions.height20 * 3),
              //body
              Container(
                // height: Dimensions.height20 * 3.5,
                width: Dimensions.screenWidth,
                margin: EdgeInsets.only(left: 20, right: 20),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //email
                      InputFeildWidget(
                        controller: emailController,
                        name: "text",
                        hintText: "Email or Phone",
                      ),
                      SizedBox(
                        height: Dimensions.height10,
                      ),
                      //password
                      InputFeildWidget(
                        controller: passwordController,
                        name: "password",
                        hintText: "Password",
                      ),
                      SizedBox(height: Dimensions.height20),

                      SizedBox(height: Dimensions.height20 * 2.5),
                      GestureDetector(
                        onTap: () {
                          _formValidation();

                          AuthController.instance.register(email, password);

                        },
                        child: SignButton(text: "Sing Up"),
                      ),
                      SizedBox(height: Dimensions.height10),
                      Center(
                        child: GestureDetector(
                            onTap: (() =>
                                Get.toNamed(RouteHelper.getSignInPage())),
                            child: SmallText("already have account?")),
                      ),

                      SizedBox(height: Dimensions.height30 * 2.5),

                      Center(
                          child: SmallText(
                        "Sign up using on the following mehod",
                        size: Dimensions.font16,
                      )),
                      SizedBox(height: Dimensions.height20),
                      Center(
                        child: Wrap(
                          runAlignment: WrapAlignment.end,
                          crossAxisAlignment: WrapCrossAlignment.end,

                          // alignment: WrapAlignment.end,
                          spacing: Dimensions.width10,
                          // mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: List<Widget>.generate(signupIcons.length,
                              (index) {
                            return CircleAvatar(
                              radius: Dimensions.height10 * 2.5,
                              backgroundImage: AssetImage(
                                  "assets/images/" + signupIcons[index]),
                            );
                          }),
                        ),
                      ),
                    ]),
              ),
            ]),
      ),
    );
  }
}
