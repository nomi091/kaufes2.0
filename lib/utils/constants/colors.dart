import 'package:flutter/material.dart';

class AppColors {
  static const Color primaryColor = Color(0xff68119a);
  static const Color secondaryColor = Color(0xff18d9c5);
  static const Color accentColor = Color(0xFFFFC107);
  static const Color blackColor = Color.fromARGB(255, 0, 0, 0);
  static const Color grayColor = Color.fromARGB(255, 68, 67, 67);
  static const Color liteGrayColor = Color.fromARGB(255, 159, 159, 159);
  static const Color dimGray = Color.fromARGB(255, 149, 148, 148);
  static const Color filterButtonColor = Color.fromARGB(231, 191, 216, 255);

  static const Color aliceBlue = Color(0xffEBF3FF);
  static const Color whiteColor = Color(0xFFF8F8F8);
  static const Color whiteGrayColor = Color.fromARGB(255, 233, 231, 231);
  static const Color redColor = Color.fromARGB(255, 243, 79, 79);
  static const snowBackground = Color(0xffF9F9F9);
  // Add more color constants as needed

  // You can also define custom color methods or variables

  // For example, a method to generate a color from RGB values
  static Color fromRGB(int r, int g, int b) {
    return Color.fromRGBO(r, g, b, 1.0);
  }
}

class AppPadding {
  static const wDefaultPadding = 20.0;
  static const sDefaultPadding = 10.0;
}

class MyTextStyles {
  ///white colors ******************************

  static TextStyle sectionTitleLargeWhite = const TextStyle(
    color: AppColors.whiteColor,
    fontSize: 36,
    fontWeight: FontWeight.bold,
  );

//Heading Style
  static TextStyle sectionTitlePrimary = const TextStyle(
    color: AppColors.primaryColor,
    fontSize: 24,
    fontWeight: FontWeight.bold,
  );
// subHeadings
  static TextStyle subHeadingBoldBlack = const TextStyle(
    color: AppColors.blackColor,
    fontSize: 16,
    fontWeight: FontWeight.bold,
  );
  static TextStyle headingxSmallBoldWhite = const TextStyle(
    color: Colors.white,
    fontSize: 16,
    fontWeight: FontWeight.bold,
  );

  static TextStyle errorMessageStyle = const TextStyle(
    color: AppColors.redColor,
    fontSize: 14,
    fontWeight: FontWeight.normal,
  );
  static TextStyle headingSmallPrimary = const TextStyle(
    fontSize: 18,
    color: AppColors.primaryColor,
  );
  static TextStyle headingSmallBoldPrimary = const TextStyle(
      fontSize: 18, color: AppColors.primaryColor, fontWeight: FontWeight.bold);
  static TextStyle headingregularBoldPrimary = const TextStyle(
      fontSize: 16, color: AppColors.primaryColor, fontWeight: FontWeight.bold);

  static TextStyle headingSmallWhite = const TextStyle(
    color: Colors.white,
    fontSize: 18,
    fontWeight: FontWeight.bold,
  );
  static TextStyle regularWhite = const TextStyle(
    color: Colors.white,
    fontSize: 12,
  );

  static TextStyle xSmallWhite = const TextStyle(
    color: Colors.white,
    fontSize: 10,
  );
  static TextStyle regularSmallBlack = const TextStyle(
    color: Colors.black,
    fontSize: 10,
  );
  static TextStyle regularMediumBlack = const TextStyle(
    color: Colors.black,
    fontSize: 14,
    fontWeight: FontWeight.bold,
  ); 
   static TextStyle mediumBlack = const TextStyle(
    color: Colors.black,
    fontSize: 14,
    fontWeight: FontWeight.w400,
  );
  static TextStyle smallBlack = const TextStyle(
    color: Colors.black,
    fontSize: 12,
  );
  static TextStyle regularBoldBlack = const TextStyle(
    color: Colors.black,
    fontSize: 12,
    fontWeight: FontWeight.bold,
  );
//Item Card Style
  static TextStyle cardRegularBlack = const TextStyle(
    color: Colors.black,
    fontSize: 12,
    fontWeight: FontWeight.normal,
  );
  static TextStyle cardSmallBlack = const TextStyle(
    color: Colors.black,
    fontSize: 10,
  );
  static TextStyle cardBoldPrimary = const TextStyle(
      color: AppColors.primaryColor, fontSize: 14, fontWeight: FontWeight.bold);
  static TextStyle cardBoldBlack = const TextStyle(
    color: AppColors.blackColor,
    fontSize: 14,
    fontWeight: FontWeight.bold,
  );
//item card detail
  static TextStyle detailCardNormalBlack = const TextStyle(
    color: AppColors.blackColor,
    fontSize: 15,
    fontWeight: FontWeight.normal,
  );
  static TextStyle detailCardBoldBlack = const TextStyle(
    color: AppColors.blackColor,
    fontSize: 14,
    fontWeight: FontWeight.bold,
  );
  static TextStyle detailSmallPrimary = const TextStyle(
    fontSize: 12,
    color: AppColors.primaryColor,
  );
  static TextStyle detailBoldPrimary = const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: AppColors.primaryColor,
  );
  static TextStyle regularDetailBlack = const TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.bold,
    color: AppColors.blackColor,
  );
  static TextStyle regularDetailGrey = const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    color: AppColors.grayColor,
  );
   static TextStyle boldDetailGrey =  TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: AppColors.grayColor.withOpacity(0.3),
  );
   static TextStyle smalDetailGrey = const TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: AppColors.grayColor,
  );
  static TextStyle regularDetailBoldBlack = const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: AppColors.blackColor,
  );  static TextStyle regularNormalBlack = const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    color: AppColors.blackColor,
  );
  static TextStyle headingDetailGrey = const TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.bold,
    color: AppColors.grayColor,
  ); 
   static TextStyle medimBoldBlack = const TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: AppColors.blackColor,
  );   static TextStyle medimBoldSecondaryColor = const TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: AppColors.secondaryColor,
  );

}
