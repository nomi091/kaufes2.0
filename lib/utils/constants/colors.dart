import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {
  static const Color primaryColor = Color(0xff68119a);
  static const Color secondaryColor = Color(0xff18d9c5);
  static const Color dropDownBgColor = Color(0xFFEBF3FF);
  static const Color accentColor = Color(0xFFFFC107);
  static const Color deviderColor = Color(0xFFDEDEDE);
  static const Color blackColor = Color.fromARGB(255, 0, 0, 0);
  static const Color blackColor50 = Color.fromARGB(255, 134, 132, 132);
  static const Color grayColor = Color(0xFF616161);
  static const Color liteGrayColor = Color.fromARGB(255, 159, 159, 159);
  static const Color dimGray = Color.fromARGB(255, 149, 148, 148);
  static const Color textFiledborderGray = Color.fromARGB(255, 149, 148, 148);
  static const Color filterButtonColor = Color.fromARGB(231, 191, 216, 255);

  static const Color aliceBlue = Color(0xffEBF3FF);
  static const Color whiteColor = Color(0xFFF8F8F8);
  static const Color whiteGrayColor = Color.fromARGB(255, 233, 231, 231);
  static const Color redColor = Color(0xFFCB2C2C);
  static const snowBackground = Color(0xffF9F9F9);
  static const skyLiteBlue = Color(0xffEBF3FF);
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
  static TextStyle sectionTitlePrimary = GoogleFonts.poppins(
    textStyle: const TextStyle(
        color: AppColors.primaryColor,
        fontSize: 22,
        fontWeight: FontWeight.w600),
  );
  static TextStyle subHeadingBoldBlack = GoogleFonts.poppins(
    textStyle: const TextStyle(
        color: AppColors.grayColor, fontSize: 14, fontWeight: FontWeight.w500),
  );
  static TextStyle subHeadingCenterMediumBlack = GoogleFonts.poppins(
    textStyle: const TextStyle(
      color: AppColors.grayColor,
      fontSize: 14,
      fontWeight: FontWeight.w500,
    ),
  );
  static TextStyle appBarMedium = GoogleFonts.poppins(
    textStyle: const TextStyle(
        color: AppColors.grayColor, fontSize: 16, fontWeight: FontWeight.w500),
  );
  static TextStyle textFieldHeadings = GoogleFonts.poppins(
    textStyle: const TextStyle(
        color: AppColors.blackColor, fontSize: 16, fontWeight: FontWeight.w500),
  );
  static TextStyle textFieldHints = GoogleFonts.poppins(
    textStyle: TextStyle(
        color: AppColors.blackColor.withOpacity(5),
        fontSize: 16,
        fontWeight: FontWeight.w500),
  );
  static TextStyle errorStyleTextField = GoogleFonts.poppins(
    textStyle: const TextStyle(
        color: AppColors.redColor, fontSize: 14, fontWeight: FontWeight.w400),
  );
  static TextStyle loginTextStyle = GoogleFonts.poppins(
    textStyle: const TextStyle(
        color: AppColors.secondaryColor,
        fontSize: 15,
        fontWeight: FontWeight.w400),
  );
  static TextStyle gotToRegistrationTextStyle = GoogleFonts.poppins(
    textStyle: const TextStyle(
        color: AppColors.grayColor, fontSize: 15, fontWeight: FontWeight.w600),
  );
  static TextStyle liteGrayTextStyle = GoogleFonts.poppins(
    textStyle: const TextStyle(
        color: AppColors.grayColor, fontSize: 15, fontWeight: FontWeight.w600),
  );
  static TextStyle regularTextStyle = GoogleFonts.poppins(
    textStyle: const TextStyle(
        color: AppColors.grayColor, fontSize: 12, fontWeight: FontWeight.w500),
  );

  ///Details Screen Design < ========================================= >   Details Screen Design
  static TextStyle biggerFont24BlackMdeium = GoogleFonts.poppins(
    textStyle: const TextStyle(
        color: AppColors.blackColor, fontSize: 24, fontWeight: FontWeight.w500),
  );

  static TextStyle regular16Gray = GoogleFonts.poppins(
    textStyle: const TextStyle(
        color: AppColors.grayColor, fontSize: 16, fontWeight: FontWeight.w400),
  );
  static TextStyle semiBo1d6Primary = GoogleFonts.poppins(
    textStyle: const TextStyle(
        color: AppColors.primaryColor,
        fontSize: 16,
        fontWeight: FontWeight.w600),
  );
  static TextStyle medium16Primary = GoogleFonts.poppins(
    textStyle: const TextStyle(
        color: AppColors.primaryColor,
        fontSize: 16,
        fontWeight: FontWeight.w500),
  );
  static TextStyle medium17Primary = GoogleFonts.poppins(
    textStyle: const TextStyle(
        color: AppColors.primaryColor,
        fontSize: 17,
        fontWeight: FontWeight.w500),
  );
  static TextStyle semiBold20Primary = GoogleFonts.poppins(
    textStyle: const TextStyle(
        color: AppColors.primaryColor,
        fontSize: 20,
        fontWeight: FontWeight.w600),
  );
  static TextStyle regular16Black = GoogleFonts.poppins(
    textStyle: const TextStyle(
        color: AppColors.blackColor, fontSize: 16, fontWeight: FontWeight.w400),
  );
  static TextStyle regular17Black = GoogleFonts.poppins(
    textStyle: const TextStyle(
        color: AppColors.blackColor, fontSize: 17, fontWeight: FontWeight.w400),
  );
  static TextStyle medium20Black = GoogleFonts.poppins(
    textStyle: const TextStyle(
        color: AppColors.blackColor, fontSize: 20, fontWeight: FontWeight.w500),
  );
  static TextStyle medium16Black = GoogleFonts.poppins(
    textStyle: const TextStyle(
        color: AppColors.blackColor, fontSize: 16, fontWeight: FontWeight.w500),
  );
  static TextStyle regular14Black = GoogleFonts.poppins(
    textStyle: const TextStyle(
        color: AppColors.blackColor, fontSize: 14, fontWeight: FontWeight.w400),
  );
  static TextStyle medium14Black = GoogleFonts.poppins(
    textStyle: const TextStyle(
        color: AppColors.blackColor, fontSize: 14, fontWeight: FontWeight.w500),
  );
  static TextStyle medium18Black = GoogleFonts.poppins(
    textStyle: const TextStyle(
        color: AppColors.blackColor, fontSize: 18, fontWeight: FontWeight.w500),
  );
  static TextStyle medium16white = GoogleFonts.poppins(
    textStyle: const TextStyle(
        color: AppColors.whiteColor, fontSize: 16, fontWeight: FontWeight.w500),
  );
  static TextStyle medium14Red = GoogleFonts.poppins(
    textStyle: const TextStyle(
        color: AppColors.redColor, fontSize: 14, fontWeight: FontWeight.w500),
  );

  static TextStyle medium14gray = GoogleFonts.poppins(
    textStyle: const TextStyle(
      color: AppColors.grayColor,
      fontSize: 14,
      fontWeight: FontWeight.w500,
    ),
  );
  static TextStyle regular14gray = GoogleFonts.poppins(
    textStyle: const TextStyle(
      color: AppColors.grayColor,
      fontSize: 14,
      fontWeight: FontWeight.w400,
    ),
  );
  static TextStyle medium15gray = GoogleFonts.poppins(
    textStyle: const TextStyle(
      color: AppColors.grayColor,
      fontSize: 15,
      fontWeight: FontWeight.w500,
    ),
  );  static TextStyle medium16gray = GoogleFonts.poppins(
    textStyle: const TextStyle(
      color: AppColors.grayColor,
      fontSize: 16,
      fontWeight: FontWeight.w500,
    ),
  );
  static TextStyle medium16Black50Op = GoogleFonts.poppins(
    textStyle: const TextStyle(
        color: AppColors.liteGrayColor,
        fontSize: 16,
        fontWeight: FontWeight.w500),
  );
  static TextStyle medium14Black50Op = GoogleFonts.poppins(
    textStyle: const TextStyle(
        color: AppColors.liteGrayColor,
        fontSize: 14,
        fontWeight: FontWeight.w500),
  );
  static TextStyle regular13gray = GoogleFonts.poppins(
    textStyle: const TextStyle(
        color: AppColors.grayColor,
        fontSize: 13,
        fontWeight: FontWeight.w500,
        overflow: TextOverflow.clip),
  );
  static TextStyle regular12gray = GoogleFonts.poppins(
    textStyle: const TextStyle(
        color: AppColors.grayColor,
        fontSize: 12,
        fontWeight: FontWeight.w500,
        overflow: TextOverflow.clip),
  );  static TextStyle regular16LiteGray = GoogleFonts.poppins(
    textStyle: const TextStyle(
        color: AppColors.liteGrayColor,
        fontSize: 16,
        fontWeight: FontWeight.w500,
        overflow: TextOverflow.clip),
  );
  static TextStyle medium14Secondary = GoogleFonts.poppins(
    textStyle: const TextStyle(
        color: AppColors.secondaryColor,
        fontSize: 14,
        fontWeight: FontWeight.w500),
  );
  static TextStyle medium14primary = GoogleFonts.poppins(
    textStyle: const TextStyle(
        color: AppColors.primaryColor,
        fontSize: 14,
        fontWeight: FontWeight.w500),
  );
  static TextStyle regular14Primary = GoogleFonts.poppins(
    textStyle: const TextStyle(
        color: AppColors.primaryColor,
        fontSize: 15,
        fontWeight: FontWeight.w400),
  );

  static TextStyle medium18black = GoogleFonts.poppins(
    textStyle: const TextStyle(
        color: AppColors.blackColor,
        fontSize: 18,
        fontWeight: FontWeight.w500,
        overflow: TextOverflow.clip),
  );
  static TextStyle medium21Primary = GoogleFonts.poppins(
    textStyle: const TextStyle(
        color: AppColors.primaryColor,
        fontSize: 21,
        fontWeight: FontWeight.w500,
        overflow: TextOverflow.clip),
  );
  static TextStyle medium21Secondary = GoogleFonts.poppins(
    textStyle: const TextStyle(
        color: AppColors.secondaryColor,
        fontSize: 21,
        fontWeight: FontWeight.w500,
        overflow: TextOverflow.clip),
  );

  // unrelated <=========================================> unrelated
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
    fontWeight: FontWeight.w500,
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
  static TextStyle boldDetailGrey = TextStyle(
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
  );
  static TextStyle regularNormalBlack = const TextStyle(
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
  );
  static TextStyle medimBoldSecondaryColor = const TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: AppColors.secondaryColor,
  );
}
