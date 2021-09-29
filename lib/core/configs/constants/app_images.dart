import 'dart:math';

class AppImages {
  static Vector vector = Vector();
  static Raster raster = Raster();
}

class Vector {
  //authentication
  String get apple => 'assets/images/vector/apple.svg';
  String get fb => 'assets/images/vector/fb.svg';
  String get google => 'assets/images/vector/google.svg';
  String get mail => 'assets/images/vector/mail.svg';
  String get eye => 'assets/images/vector/eye.svg';
  String get eyeOff => 'assets/images/vector/eye-off.svg';
  String get appbarAdd => 'assets/images/vector/appbar_add.svg';
  String get appbarAddSelected => 'assets/images/vector/appbar_add_selected.svg';
  String get appbarBrowse => 'assets/images/vector/appbar_browse.svg';
  String get appbarBrowseSelected => 'assets/images/vector/appbar_browse_selected.svg';
  String get appbarInbox => 'assets/images/vector/appbar_inbox.svg';
  String get appbarInboxSelected => 'assets/images/vector/appbar_inbox_selected.svg';
  String get appbarProfile => 'assets/images/vector/appbar_profile.svg';
  String get appbarProfileSelected => 'assets/images/vector/appbar_profile_selected.svg';
  String get appbarWishlist => 'assets/images/vector/appbar_wishlist.svg';
  String get appbarWishlistSelected => 'assets/images/vector/appbar_wishlist_selected.svg';

  String get filter => 'assets/images/vector/filter.svg';
  String get heartEmpty => 'assets/images/vector/heart_empty.svg';
  String get heart => 'assets/images/vector/heart.svg';
  String get search => 'assets/images/vector/search.svg';
  String get star => 'assets/images/vector/star.svg';
  String get location => 'assets/images/vector/location.svg';
  String get arrowLeftWithOpacity => 'assets/images/vector/arrow_left_with_opacity.svg';
  // String get browseItemProfileImage => 'assets/images/vector/vladlena.svg';
  String get imageIcon => 'assets/images/vector/image.svg';

  String get plus => 'assets/images/vector/plus.svg';
  String get checkbox => 'assets/images/vector/checkbox.svg';
  String get xCircle => 'assets/images/vector/x_circle.svg';

  String get sliverOverlay => 'assets/images/vector/sliver_overlay.svg';
  String get stripe => 'assets/images/vector/stripe.svg';
  String get visaLogo => 'assets/images/vector/visa_logo.svg';
  String get trashIcon => 'assets/images/vector/trash.svg';
  String get cameraIcon => 'assets/images/vector/camera.svg';
  String get circleQuestionIcon => 'assets/images/vector/circle_question_mark.svg';
}

class Raster {
  Random _random = Random();
  //String onboardingImage(int index) => 'assets/images/raster/onboarding_image$index.png';
  String get loginScreenMain => 'assets/images/raster/login_screen_main.png';
  String get signUpScreenMain => 'assets/images/raster/sign_up_screen_main.png';
  String get forgotPasswordScreenMain => 'assets/images/raster/forgot_password_screen_main.png';
  String get onboarding1 => 'assets/images/raster/onboarding_1.png';
  String get onboarding2 => 'assets/images/raster/onboarding_2.png';
  String get onboarding3 => 'assets/images/raster/onboarding_3.png';

  String onboarding(int key) => 'assets/images/raster/onboarding_$key.png';

  String get sliverOverlay => 'assets/images/raster/sliver_overlay.png';
  String get browseItemProfileImage => 'assets/images/raster/vladlena.png';

  String get addFeed => 'assets/images/raster/add_feed.png';
  String get addLiveSearch => 'assets/images/raster/add_live_search.png';
  String get addFeedSelected => 'assets/images/raster/add_feed_selected.png';
  String get addLiveSearchSelected => 'assets/images/raster/add_live_search_selected.png';

  String get categoryRandom => 'assets/images/raster/category_${_random.nextInt(2) + 1}.png';
  String get productRandom => 'assets/images/raster/product_${_random.nextInt(5) + 1}.png';
  String get sellerAvatarRandom => 'assets/images/raster/seller_${_random.nextInt(3) + 1}.png';
  String get sellerBannerRandom => 'assets/images/raster/seller_banner_${_random.nextInt(3) + 1}.png';
}
