import 'package:ecommerce_app/core/constant/routes.dart';
import 'package:ecommerce_app/middleware/my_middleware.dart';
import 'package:ecommerce_app/view/screen/address/add_address.dart';
import 'package:ecommerce_app/view/screen/address/address_view.dart';
import 'package:ecommerce_app/view/screen/address/complete_add_address.dart';
import 'package:ecommerce_app/view/screen/auth/forget_password.dart';
import 'package:ecommerce_app/view/screen/auth/login.dart';
import 'package:ecommerce_app/view/screen/auth/reset_password.dart';
import 'package:ecommerce_app/view/screen/auth/signup.dart';
import 'package:ecommerce_app/view/screen/auth/success_reset_password.dart';
import 'package:ecommerce_app/view/screen/auth/success_sign_up.dart';
import 'package:ecommerce_app/view/screen/auth/verify_code.dart';
import 'package:ecommerce_app/view/screen/auth/verify_code_sign_up.dart';
import 'package:ecommerce_app/view/screen/cart.dart';
import 'package:ecommerce_app/view/screen/check.dart';
import 'package:ecommerce_app/view/screen/items.dart';
import 'package:ecommerce_app/view/screen/language.dart';
import 'package:ecommerce_app/view/screen/my_favorite.dart';
import 'package:ecommerce_app/view/screen/on_boarding.dart';
import 'package:ecommerce_app/view/screen/home_screen.dart';
import 'package:ecommerce_app/view/screen/order/archive_order.dart';
import 'package:ecommerce_app/view/screen/order/order_details.dart';
import 'package:ecommerce_app/view/screen/order/pending_order.dart';
import 'package:ecommerce_app/view/screen/product_details.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';


List<GetPage<dynamic>>? getPages = <GetPage>[
  // GetPage(name: '/', page: ()=> const  Cart()),
  GetPage(name: '/', page: ()=>const Language(), middlewares: [
    MyMiddleware(),
  ]),
  GetPage(name: AppRoute.login, page: () => const Login()),
  GetPage(name: AppRoute.signUp, page: () => const SignUp()),
  GetPage(name: AppRoute.forgetPassword, page: () => const ForgetPassword(),),
  GetPage(name: AppRoute.verifyCode, page: () => const VerifyCode()),
  GetPage(name: AppRoute.resetPassword, page: () => const ResetPassword()),
  GetPage(name: AppRoute.successResetPassword, page: () => const SuccessResetPassword()),
  GetPage(name: AppRoute.successSignUp, page: () => const SuccessSignUp()),
  GetPage(name: AppRoute.verifyCodeSignUp, page: () => const VerifyCodeSignUp()),
  GetPage(name: AppRoute.onBoarding, page: () => const OnBoarding()),

  GetPage(name: AppRoute.homePage, page: () => const HomeScreen()),
  GetPage(name:AppRoute.items, page: ()=> const Items()),
  GetPage(name: AppRoute.productDetails, page: ()=>const ProductDetails()),
  GetPage(name: AppRoute.myFavorite, page: () => const MyFavorite()),
  GetPage(name: AppRoute.cart, page: () => const Cart()),
  GetPage(name:AppRoute.address, page:()=> const AddressView()),
  GetPage(name:AppRoute.addAddress, page:()=> const AddAddress()),
  GetPage(name: AppRoute.completeAddAddress, page:()=> const CompleteAddAddress()),
  GetPage(name: AppRoute.checkOut, page: ()=> const Check()),
  GetPage(name: AppRoute.pendingOrder, page: ()=>const PendingOrder()),
  GetPage(name: AppRoute.orderDetails, page: ()=> const OrderDetails()),
  GetPage(name:AppRoute.orderArchive, page: ()=>const ArchiveOrder()),
];



// Map<String, Widget Function(BuildContext)> routes = {
//   //Auth
//   AppRoute.login: (context) => const Login(),
//   AppRoute.signUp: (context) => const SignUp(),
//   AppRoute.forgetPassword: (context) => const ForgetPassword(),
//   AppRoute.verifyCode: (context) => const VerifyCode(),
//   AppRoute.resetPassword: (context) => const ResetPassword(),
//   AppRoute.successResetPassword: (context) => const SuccessResetPassword(),
//   AppRoute.successSignUp: (context) => const SuccessSignUp(),
//   AppRoute.verifyCodeSignUp : (context) => const VerifyCodeSignUp(),
//   //OnBoarding
//   AppRoute.onBoarding: (context) => const OnBoarding(),
// };
