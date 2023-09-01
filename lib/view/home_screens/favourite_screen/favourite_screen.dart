// import 'package:flutter/material.dart';
// import 'package:kaufes/utils/routes/routes.dart';
// import 'package:provider/provider.dart';

// import '../../../data/responce/status.dart';
// import '../../../widgets/global_widgets/filter_app_bar.dart';
// import '../../../utils/constants/constant_width.dart';
// import '../../../view_model/home_view_model/favourite_view_model.dart';
// import '../../global_cards/product_card_item_view.dart';

// class FavoriteScreen extends StatefulWidget {
//   const FavoriteScreen({super.key});

//   @override
//   // ignore: library_private_types_in_public_api
//   _FavoriteScreenState createState() => _FavoriteScreenState();
// }

// class _FavoriteScreenState extends State<FavoriteScreen>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _animationController;
//   late Animation<Offset> _animation;
//   FavouriteViewModel favouriteViewModel = FavouriteViewModel();
//   // final List<String> data = List.generate(10, (index) => 'Item ${index + 1}');

//   @override
//   void initState() {
//     super.initState();
//     favouriteViewModel.getFavouriteItems();

//     _animationController = AnimationController(
//       vsync: this,
//       duration: const Duration(seconds: 2),
//     );
//     _animation = Tween<Offset>(
//       begin: const Offset(0, 1), // Start the cards at the bottom
//       end: Offset.zero, // Move the cards to their final position
//     ).animate(
//       CurvedAnimation(
//         parent: _animationController,
//         curve: Curves.easeInOutSine,
//       ),
//     );

//     // Start the animation
//     _animationController.forward();
//   }

//   @override
//   void dispose() {
//     _animationController.dispose();

//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: PreferredSize(
//             preferredSize: Size.square(ConstantSize.getHeight(context) * 0.06),
//             child: FilterAppBar(
//               onTapBack: () {
//                 Navigator.pop(context);
//               },
//               height: ConstantSize.getHeight(context) * 0.05,
//               title: "Favorites",
//               trailingCheck: false,
//               onTapTrailing: () {
//                 //    Get.offAndToNamed(MyRoutes.getHomeScreen());
//               },
//             )),
//         body: Padding(
//             padding: EdgeInsets.symmetric(
//                 horizontal: ConstantSize.getWidth(context) * 0.04,
//                 vertical: ConstantSize.getHeight(context) * 0.0),
//             child: ChangeNotifierProvider<FavouriteViewModel>.value(
//               value: favouriteViewModel,
//               child: Consumer<FavouriteViewModel>(
//                 builder: (context, value, _) {
//                   switch (value.getAllItemsData.status) {
//                     case Status.LOADING:
//                       return const Center(child: CircularProgressIndicator());
//                     case Status.ERROR:
//                       return Text(value.getAllItemsData.message.toString());
//                     default:
//                       return SizedBox(
//                           width: ConstantSize.getWidth(context),
//                           height: ConstantSize.getHeight(context) * 1,
//                           child: AnimatedBuilder(
//                             animation: _animationController,
//                             builder: (context, child) {
//                               return LayoutBuilder(
//                                 builder: (BuildContext context,
//                                     BoxConstraints constraints) {
//                                   return SlideTransition(
//                                     position: _animation,
//                                     child: GridView.builder(
//                                       physics: const ScrollPhysics(),
//                                       shrinkWrap: true,
//                                       primary: true,
//                                       scrollDirection: Axis.vertical,
//                                       itemCount: 10,
//                                       gridDelegate:
//                                           const SliverGridDelegateWithFixedCrossAxisCount(
//                                         childAspectRatio: 0.6,
//                                         mainAxisSpacing: 15,
//                                         crossAxisSpacing: 1,
//                                         crossAxisCount: 2,
//                                       ),
//                                       itemBuilder:
//                                           (BuildContext context, int index) {
//                                         return InkWell(
//                                           onTap: () {
//                                             Navigator.pushNamed(
//                                                 context,
//                                                 ScreenRoutes
//                                                     .productDetailScreen);
//                                           },
//                                           child: ProductCardView(
//                                             isBid: false,
//                                           ),
//                                         );
//                                       },
//                                     ),
//                                   );
//                                 },
//                               );
//                             },
//                           )

//                           // : Center(
//                           //     child: SvgPicture.asset(AppImages.svgNoAdsIcon),
//                           //   );,
//                           );
//                   }
//                 },
//               ),
//             )));
//   }
// }
