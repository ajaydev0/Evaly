part of 'app_pages.dart';

abstract class Routes {
  Routes._();
  static const splashScreen = _Path.splashScreen;
  static const HomePage = _Path.HomePage;
  static const login_Page = _Path.login_Page;
  static const signUp_Page = _Path.signUp_Page;
  static const nav_Bar = _Path.nav_Bar;
  static const onBoard = _Path.onBoard;
  static const CART_PAGE = '/cart-page';
  static const PRODUCT_DETAILS = '/product-details';
  static const EDIT_PROFILE_PAGE = '/edit-profile-page';
  static const FORGOT_PASSWORD_PAGE = '/forgot-password-page';
  static const ADDRESS_PAGE = '/address-page';
  static const ADD_NEW_ADDRESS_PAGE = '/add-new-address-page';
}

abstract class _Path {
  _Path._();
  static const splashScreen = "/";
  static const HomePage = "/HomePage";
  static const login_Page = '/login-page';
  static const signUp_Page = '/signup-page';
  static const nav_Bar = '/Nav_bar';
  static const onBoard = "/onBoard";
}
