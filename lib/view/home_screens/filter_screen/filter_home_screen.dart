// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:kaufes/utils/constants/image_paths.dart';
// import 'package:provider/provider.dart';

// import '../../../data/responce/status.dart';
// import '../../../widgets/global_widgets/custom_search_text_field_flutter.dart';
// import '../../../utils/constants/colors.dart';
// import '../../../utils/constants/constant_width.dart';
// import '../../../utils/routes/routes.dart';
// import '../../../view_model/home_view_model/favourite_view_model.dart';
// import '../../global_cards/product_card_item_view.dart';
// import 'filter_sort_screen.dart';

// class FilterHomeScreen extends StatefulWidget {
//   const FilterHomeScreen({Key? key}) : super(key: key);

//   @override
//   // ignore: library_private_types_in_public_api
//   _FilterHomeScreenState createState() => _FilterHomeScreenState();
// }

// FavouriteViewModel favouriteViewModel = FavouriteViewModel();

// class _FilterHomeScreenState extends State<FilterHomeScreen>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _animationController;
//   late Animation<Offset> _animation;

//   @override
//   void initState() {
//     favouriteViewModel.getFavouriteItems();
//     super.initState();
//     _animationController = AnimationController(
//       vsync: this,
//       duration: const Duration(seconds: 2),
//     );
//     _animation = Tween<Offset>(
//       begin: const Offset(0, 1),
//       end: Offset.zero,
//     ).animate(
//       CurvedAnimation(
//         parent: _animationController,
//         curve: Curves.easeInOutSine,
//       ),
//     );

//     _animationController.forward();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: buildAppBar(context),
//       body: SafeArea(
//         child: Padding(
//           padding: EdgeInsets.all(ConstantSize.getWidth(context) * 0.02),
//           child: SingleChildScrollView(
//             child: Column(
//               children: [
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//                     ElevatedButton.icon(
//                       onPressed: () {
//                         Navigator.pushNamed(context, ScreenRoutes.filterScreen);
//                       },
//                       icon: const Icon(Icons.filter_list_alt,
//                           color: AppColors.grayColor),
//                       label: const Text(
//                         "Filters",
//                         style: TextStyle(color: AppColors.grayColor),
//                       ),
//                       style: ElevatedButton.styleFrom(
//                         minimumSize: const Size(110, 40),
//                         maximumSize: const Size(110, 40),
//                         backgroundColor: AppColors.filterButtonColor,
//                       ),
//                     ),
//                     const SizedBox(width: 10),
//                     ElevatedButton.icon(
//                       onPressed: () {},
//                       icon: const Icon(Icons.location_on,
//                           color: AppColors.grayColor),
//                       label: const Text(
//                         "Select Location",
//                         style: TextStyle(color: AppColors.grayColor),
//                       ),
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: AppColors.filterButtonColor,
//                       ),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 10),
//                 Padding(
//                   padding:
//                       EdgeInsets.all(ConstantSize.getWidth(context) * 0.02),
//                   child: Row(
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       Expanded(
//                         child: Align(
//                           alignment: Alignment.topLeft,
//                           child: Text("Computer",
//                               style: MyTextStyles.regularBoldBlack),
//                         ),
//                       ),
//                       Expanded(
//                         child: Align(
//                           alignment: Alignment.centerRight,
//                           child: Text("10 Ads",
//                               style: MyTextStyles.regularBoldBlack),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 const SizedBox(height: 10),
//                 Padding(
//                   padding: EdgeInsets.symmetric(
//                       horizontal: ConstantSize.getWidth(context) * 0.02,
//                       vertical: ConstantSize.getHeight(context) * 0.0),
//                   child: ChangeNotifierProvider<FavouriteViewModel>.value(
//                     value: favouriteViewModel,
//                     child: Consumer<FavouriteViewModel>(
//                       builder: (context, value, _) {
//                         switch (value.getAllItemsData.status) {
//                           case Status.LOADING:
//                             return const Center(
//                                 child: CircularProgressIndicator());
//                           case Status.ERROR:
//                             return Text(
//                                 value.getAllItemsData.message.toString());
//                           default:
//                             return SizedBox(
//                               width: ConstantSize.getWidth(context),
//                               height: ConstantSize.getHeight(context) * 1,
//                               child: AnimatedBuilder(
//                                 animation: _animationController,
//                                 builder: (context, child) {
//                                   return LayoutBuilder(
//                                     builder: (BuildContext context,
//                                         BoxConstraints constraints) {
//                                       return SlideTransition(
//                                         position: _animation,
//                                         child: GridView.builder(
//                                           physics: const ScrollPhysics(),
//                                           shrinkWrap: true,
//                                           primary: true,
//                                           scrollDirection: Axis.vertical,
//                                           itemCount: 10,
//                                           gridDelegate:
//                                               const SliverGridDelegateWithFixedCrossAxisCount(
//                                             childAspectRatio: 0.6,
//                                             mainAxisSpacing: 10,
//                                             crossAxisSpacing: 0,
//                                             crossAxisCount: 2,
//                                           ),
//                                           itemBuilder: (BuildContext context,
//                                               int index) {
//                                             return InkWell(
//                                               onTap: () {
//                                                 Navigator.pushNamed(
//                                                     context,
//                                                     ScreenRoutes
//                                                         .productDetailScreen);
//                                               },
//                                               child: ProductCardView(
//                                                 isBid: false,
//                                               ),
//                                             );
//                                           },
//                                         ),
//                                       );
//                                     },
//                                   );
//                                 },
//                               ),
//                             );
//                         }
//                       },
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   AppBar buildAppBar(BuildContext context) {
//     return AppBar(
//       elevation: 0,
//       backgroundColor: AppColors.whiteColor,
//       leading: IconButton(
//         icon: const Icon(
//           Icons.arrow_back,
//           color: AppColors.blackColor,
//         ),
//         onPressed: () {
//           // Handle back button press
//           Navigator.pop(context);
//         },
//       ),
//       title: const CustomSearchTextField(),
//       actions: [
//         // InkWell(
//         //   onTap: () {
//         //     showDialog(
//         //       context: context,
//         //       builder: (BuildContext context) {
//         //         return const RadioButtonsDialog();
//         //       },
//         //     );
//         //   },
//         //   child: Padding(
//         //     padding:
//         //         EdgeInsets.only(right: ConstantSize.getWidth(context) * 0.03),
//         //     child: SvgPicture.asset(
//         //       AppImages.svgSort,
//         //       width: 35,
//         //       height: 30,
//         //     ),
//         //   ),
//         // )
//       ],
//     );
//   }
  
// }

