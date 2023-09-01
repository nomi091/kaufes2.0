// import 'package:flutter/material.dart';
// import 'package:kaufes/utils/constants/image_paths.dart';
// import 'package:kaufes/view_model/home_view_model/home_view_model.dart';
// import '../../../utils/constants/colors.dart';
// import 'package:carousel_slider/carousel_slider.dart';

// import '../../../utils/constants/constant_width.dart';

// class OurPartners extends StatelessWidget {
//   const OurPartners({super.key});
//   @override
//   Widget build(BuildContext context) {
//     // HomeViewModel homeViewModel = HomeViewModel();

//     return Stack(
//       alignment: Alignment.center,
//       children: [
//         Image(
//           width: ConstantSize.getWidth(context),
//           image: const AssetImage(
//             AppImages.homePageOurPartnerBanner,
//           ),
//           fit: BoxFit.fitHeight,
//         ),
//         Positioned(
//           child: Column(
//             children: [
//               SizedBox(
//                 height: ConstantSize.getWidth(context) * 0.01,
//               ),
//               Text("Our Partners", style: MyTextStyles.headingxSmallBoldWhite),
//               SizedBox(
//                 height: ConstantSize.getWidth(context) * 0.01,
//               ),
//               Container(
//                 padding: EdgeInsets.all(ConstantSize.getWidth(context) * 0.03),
//                 height: ConstantSize.getWidth(context) * 0.4,
//                 child: CarouselSlider.builder(
//                     carouselController: homeViewModel.carouselController,
//                     itemCount: homeViewModel.sliderImages.length,
//                     itemBuilder: (context, index, realIndex) {
//                       return Container(
//                         width: ConstantSize.getHeight(context) * 0.4,
//                         decoration: const BoxDecoration(
//                           color: Colors.white,
//                           borderRadius: BorderRadius.all(Radius.circular(11)),
//                         ),
//                         child: Padding(
//                           padding: EdgeInsets.symmetric(
//                               horizontal:
//                                   ConstantSize.getHeight(context) * 0.05),
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             crossAxisAlignment: CrossAxisAlignment.center,
//                             children: [
//                               SizedBox(
//                                   height:
//                                       ConstantSize.getWidth(context) * 0.01),
//                               // Image.asset(homeViewModel.sliderImages[index]),
//                               SizedBox(
//                                 height: ConstantSize.getWidth(context) * 0.015,
//                               ),
//                               Padding(
//                                 padding: EdgeInsets.symmetric(
//                                     horizontal:
//                                         ConstantSize.getHeight(context) * 0.01),
//                                 child: Text(
//                                   "Compare top offers from verified companies in your region. Non-binding and free of charge! Now quickly compare offers from local companies.",
//                                   style: MyTextStyles.smallBlack,
//                                 ),
//                               ),
//                               SizedBox(
//                                 height: ConstantSize.getWidth(context) * 0.01,
//                               ),
//                               SizedBox(
//                                 height: ConstantSize.getHeight(context) * 0.03,
//                                 width: ConstantSize.getHeight(context) * 0.18,
//                                 child: ElevatedButton(
//                                     onPressed: () {},
//                                     style: ElevatedButton.styleFrom(
//                                       backgroundColor: AppColors.primaryColor,
//                                     ),
//                                     child: Text(
//                                       "Find More",
//                                       style: MyTextStyles.regularWhite,
//                                     )),
//                               )
//                             ],
//                           ),
//                         ),
//                       );
//                       // return Container(
//                       //   color: Colors.grey,
//                       // );
//                     },
//                     options: CarouselOptions(
//                         initialPage: homeViewModel.activePage,
//                         pageSnapping: false,
//                         viewportFraction: 1,
//                         height: 300,
//                         reverse: true)),
//               ),
//               SizedBox(
//                 height: ConstantSize.getWidth(context) * 0.015,
//               ),
//               SizedBox(
//                 height: ConstantSize.getWidth(context) * 0.01,
//               ),
//             ],
//           ),
//         )
//       ],
//     );
//   }
// }
