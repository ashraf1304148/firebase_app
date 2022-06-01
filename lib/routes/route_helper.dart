import 'package:firebase_app/pages/home_page.dart';
import 'package:firebase_app/pages/log_in_page.dart';
import 'package:firebase_app/pages/sign_up_page.dart';
import 'package:firebase_app/pages/wellcome_page.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';

class RouteHelper {
  static String _initial = "/";
  static String _signInPage = "/sign-in-page";
  static String _signUpPage = "/sign-up-page";
  static String _wellcomePage = "/wellcome-page";

  static String getInitial() => "$_initial";
  static String getSignInPage() => "$_signInPage";
  static String getSignUpPage() => "$_signUpPage";
  static String getWellcomePage({String email=""}) => "$_wellcomePage?email=$email";

  static List<GetPage> routes = [
    GetPage(name: _initial, page: () => HomePage()),
    GetPage(name: _signInPage, page: () => LogInPage()),
    GetPage(name: _signUpPage, page: () => SignUpPage()),
    GetPage(
        name: _wellcomePage,
        page: () {

          var email=Get.parameters['email'];
          return WellcomePage(email:email);
        }),
  ];
}
