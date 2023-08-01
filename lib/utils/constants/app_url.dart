class AppUrl{
  static const authorization = "authorization";




  // static const String domain2 = "http://api.staging.kaufes.ch/api";
  static const String domain = "https://staging.kaufes.ch";

  /// welcome
  static const String signUpEndPoint = "$domain/auth";
  static const String signInEndPointEndPoint = "$domain/auth/login";
  static const String sendOtpOnEmailEndPoint = "$domain/auth/resend-otp";
  static const String sendOtpOnPhoneNoEndPoint = "$domain/user/otp/1";
  static const String verifyEmailEndPoint = "$domain/auth/account-activation";
  static const String socialLoginEndPoint = "$domain/auth/social-login";
  static const String verifyAccountEmailApi = "$domain/auth/forgot-password";
  static const String passwordResetAPI = "$domain/user";



  /// advert
  static const String categoryList = "$domain/advert/category";
  static const String createAd = "$domain/advert";
  static const String tagList = "$domain/advert/tag?";
  static const String uploadAssets = "$domain/integrations/firebase/storage";
  static const String advertFavourite = "$domain/advert/favourite/";
  static const String advertNotifications = "$domain/integrations/notification";



  /// CHAT
  static const String chatRoomList = "$domain/integrations/chat";
  static const String socketDomain = "https://staging.kaufes.ch";
  static const String socketAPI = "/api/socket";

//bid
  static const String advertBid = "$domain/advert/bid";









}