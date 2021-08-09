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
}

class Raster {
  //String onboardingImage(int index) => 'assets/images/raster/onboarding_image$index.png';
  String get loginScreenMain => 'assets/images/raster/login_screen_main.png';
  String get signUpScreenMain => 'assets/images/raster/sign_up_screen_main.png';
  String get forgotPasswordScreenMain => 'assets/images/raster/forgot_password_screen_main.png';
  String get onboarding1 => 'assets/images/raster/onboarding_1.png';
  String get onboarding2 => 'assets/images/raster/onboarding_2.png';
  String get onboarding3 => 'assets/images/raster/onboarding_3.png';

  String onboarding(int key) => 'assets/images/raster/onboarding_$key.png';
}
