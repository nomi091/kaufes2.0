// import 'package:flutter/material.dart';
// import 'package:kaufes/view/home_screens/popular_product_screen/popular_categories.dart';
// import 'package:kaufes/view/home_screens/sell_your_product_screen/sell_your_product.dart';
// import '../../widgets/global_widgets/custom_app_bar.dart';
// import '../../widgets/global_widgets/custom_search_text_field_flutter.dart';
// import '../../utils/constants/constant_width.dart';
// import '../google_location/google_suggestion_text_field.dart';
// import 'category_screen/category_list.dart';
// import 'our_partners_screen/our_partner.dart';

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({Key? key}) : super(key: key);

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//           backgroundColor: Colors.white,
//           automaticallyImplyLeading: false,
//           title: const MyCustomAppBar(
//             height: 150,
//           )),
//       body: SingleChildScrollView(
//         scrollDirection: Axis.vertical,
//         child: Column(
//           children: [
//           //  search and Location widgets
//             Padding(
//               padding: EdgeInsets.all(ConstantSize.getWidth(context) * 0.07),
//               child: Column(
//                 children: [
//                   const AutocompleteTextField(),
//                   SizedBox(
//                     height: ConstantSize.getHeight(context) * 0.01,
//                   ),
//                   const CustomSearchTextField(),
//                 ],
//               ),
//             ),
//             SizedBox(
//               height: ConstantSize.getHeight(context) * 0.01,
//             ),
//             //Category View
//             const CategoryListViewItem(),
//             SizedBox(
//               height: ConstantSize.getHeight(context) * 0.01,
//             ),
//             //Sell products
//             Padding(
//                 padding: EdgeInsets.only(
//                     left: ConstantSize.getWidth(context) * 0.07,
//                     right: ConstantSize.getWidth(context) * 0.07),
//                 child: const SellProductBanner()),
//             SizedBox(
//               height: ConstantSize.getHeight(context) * 0.01,
//             ),
//             const PopularProductScreen(),
//             SizedBox(
//               height: ConstantSize.getHeight(context) * 0.01,
//             ),
//             // /// OUR PARTNER
//             // const OurPartners(),
//           ],
//         ),
//       ),
//     );
//   }
// }
