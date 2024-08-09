class AppLink {
  static const String server = 'https://ecommerce-r9vu.onrender.com';

  //Auth api
  static const String signUp = '$server/auth/users/';
  static const String verifyCodeSignUp = '$server/core/verify_email/';
  static const String signIn = '$server/auth/jwt/create/';
  static const String refresh = '$server/auth/jwt/refresh/';

  //Forget password
  static const String forgetPassword = '$server/core/forget_password/';
  static const String verifyCode =
      '$server/core/confirm_verify_code_reset_password/';
  static const String resetPassword = '$server/core/reset_password/';

  static const String userData = '$server/auth/users/me/';

  static const String homeData = '$server/store/home_data/';
  static const String items = '$server/store/item/';
  static const String search = '$server/store/search/';

  //Favorite
  static const String addFavorite = '$server/store/add_favorite/';
  static const String deleteFavorite = '$server/store/delete_favorite/';
  static const String listFavorite = '$server/store/list_favorite/';

  //Cart
  static const String addToCart = '$server/store/add_to_cart/';
  static const String deleteFromCart = '$server/store/delete_from_cart/';
  static const String itemCount = '$server/store/get_count_cart/';
  static const String viewCart = '$server/store/view_cart/';

  //Address
  static const String addAddress = '$server/store/add_address/';
  static const String deleteAddress = '$server/store/delete_address/';
  static const String viewAddress = '$server/store/view_address/';
  // static const String addAddress = '$server/store/add_address/';

  //Coupon
  static const String checkCoupon = '$server/store/check_coupon/';

  //Checkout
  static const String checkout = '$server/store/checkout/';
  static const String bendingOrder = '$server/store/view_order/';
  static const String archiveOrder = '$server/store/view_archive_order/';

  //Notification
  static const String viewNotification = '$server/store/view_notification/';

  static const String orderDetails = '$server/store/order_details/';
  static const String deleteOrder = '$server/store/delete_order/';

  static const String offersItem = '$server/store/offers_item/';

  static const String addRatingOrder = '$server/store/add_rating_to_archive_order/';



}
