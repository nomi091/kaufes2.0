// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:kaufes/utils/constants/colors.dart';
// import 'package:kaufes/utils/constants/image_paths.dart';
// import 'package:kaufes/view/create_ad_screen/widget_taglist/button_widget.dart';

// import '../../widgets/global_widgets/align_left_text.dart';
// import '../../widgets/global_widgets/filter_app_bar.dart';
// import '../../utils/constants/constant_width.dart';
// import '../../utils/routes/routes.dart';
// import '../../view_model/create_ad_view_model/creat_view_model.dart';

// class UploadMediaScreen extends StatelessWidget {
//   const UploadMediaScreen({Key, key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     CreateAdViewModel createAdViewModel = CreateAdViewModel();

//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: FilterAppBar(
//         onTapBack: () {
//           Navigator.pop(context);
//         },
//         onTapTrailing: () {},
//         height: ConstantSize.getHeight(context) * 0.05,
//         title: 'Select Media',
//         subTitle: '',
//         trailingCheck: false,
//       ),
//       body: Container(
//         height: ConstantSize.getHeight(context) * 0.905,
//         color: AppColors.snowBackground,
//         child: SingleChildScrollView(
//           scrollDirection: Axis.vertical,
//           padding: EdgeInsets.symmetric(
//             vertical: ConstantSize.getHeight(context) * 0.02,
//             horizontal: ConstantSize.getWidth(context) * 0.05,
//           ),
//           child: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               mainAxisSize: MainAxisSize.max,
//               mainAxisAlignment: MainAxisAlignment.end,
//               children: [
//                 alignCenterLeft(
//                   Text(
//                     "Upload Media",
//                     style: MyTextStyles.subHeadingBoldBlack,
//                   ),
//                 ),
//                 SizedBox(height: ConstantSize.getHeight(context) * 0.01),
//                 alignCenterLeft(
//                   Text(
//                     "Upload up to 16 images having Maximum size 5 MB",
//                     style: MyTextStyles.smalDetailGrey,
//                   ),
//                 ),
//                 SizedBox(height: ConstantSize.getHeight(context) * 0.03),
//                 uploadWidget(
//                     context: context,
//                     iconPath: AppImages.svgImagePrimeryIcon,
//                     title: "Upload Images",
//                     subtitle: "",
//                     cameraOnTap: () {
//                       createAdViewModel.selectMedia(ImageSource.gallery);
//                       print('opening Camera');
//                     },
//                     browseOnTap: () {
//                       createAdViewModel.selectMedia(ImageSource.gallery);
//                     }),
//                 SizedBox(height: ConstantSize.getHeight(context) * 0.05),
//                 alignCenterLeft(
//                   Text(
//                     "Upload Video",
//                     style: MyTextStyles.subHeadingBoldBlack,
//                   ),
//                 ),
//                 SizedBox(height: ConstantSize.getHeight(context) * 0.01),
//                 alignCenterLeft(
//                   Text(
//                     "Upload a video of your product having Maximum size 250 MB",
//                     style: MyTextStyles.smalDetailGrey,
//                   ),
//                 ),
//                 SizedBox(height: ConstantSize.getHeight(context) * 0.03),
//                 uploadWidget(
//                     context: context,
//                     iconPath: AppImages.svgVideoPrimeryIcon,
//                     title: "Upload Video",
//                     subtitle: "",
//                     cameraOnTap: () {
//                       createAdViewModel.selectVideo(ImageSource.camera);
//                       print('opening Camera');
//                     },
//                     browseOnTap: () {
//                       createAdViewModel.selectVideo(ImageSource.gallery);

//                       print('Browsing Gallery');
//                     }),
//                 SizedBox(
//                   height: ConstantSize.getHeight(context) * 0.05,
//                 ),
//                 buildNextButton(
//                     context: context,
//                     buttonPressed: () {
//                       Navigator.pushNamed(
//                           context, ScreenRoutes.adsReviewContactScreen);
//                     }),
//               ]),
//         ),
//       ),
//     );
//   }

//   Widget uploadWidget({
//     context,
//     String? title,
//     String? subtitle,
//     String? iconPath,
//     Function? iconOnTap,
//     Function? browseOnTap,
//     Function? cameraOnTap,
//   }) {
//     return Container(
//       width: double.infinity,
//       height: ConstantSize.getHeight(context) * 0.2,
//       decoration: BoxDecoration(
//         borderRadius: const BorderRadius.all(Radius.circular(4)),
//         border: Border.all(
//           color: Colors.black,
//           width: 0.4,
//         ),
//       ),
//       child: Padding(
//         padding: EdgeInsets.all(ConstantSize.getHeight(context) * 0.03),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             InkWell(
//               onTap: iconOnTap as void Function()?,
//               child: SvgPicture.asset(
//                 iconPath!,
//                 width: ConstantSize.getWidth(context) * 0.05,
//                 height: ConstantSize.getHeight(context) * 0.04,
//               ),
//             ),
//             SizedBox(height: ConstantSize.getHeight(context) * 0.01),
//             Text(
//               title!,
//               style: MyTextStyles.smalDetailGrey,
//             ),
//             SizedBox(height: ConstantSize.getHeight(context) * 0.02),
//             Row(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Expanded(
//                   child: InkWell(
//                     onTap: browseOnTap as void Function()?,
//                     child: Text(
//                       "Browse",
//                       textAlign: TextAlign.end,
//                       style: MyTextStyles.regularMediumBlack,
//                     ),
//                   ),
//                 ),
//                 SizedBox(width: ConstantSize.getHeight(context) * 0.1),
//                 Expanded(
//                   child: InkWell(
//                     onTap: cameraOnTap as void Function()?,
//                     child: Text(
//                       "Camera",
//                       style: MyTextStyles.regularMediumBlack,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
