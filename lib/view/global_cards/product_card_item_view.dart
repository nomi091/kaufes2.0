import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kaufes/utils/constants/colors.dart';
import 'package:kaufes/utils/constants/image_paths.dart';
import 'package:shimmer/shimmer.dart';

import '../../res/widgets/global_widgets/devider_widget.dart';
import '../../utils/constants/constant_width.dart';

// ignore: must_be_immutable
class ProductCardView extends StatelessWidget {
  ProductCardView({super.key, required this.isBid});
  bool isBid = false;
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(7),
      ),
      elevation: 3,
      child: Column(
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(3.0),
                  topRight: Radius.circular(3.0),
                ),
                child: CachedNetworkImage(
                  height: ConstantSize.getHeight(context) * 0.18,
                  width: ConstantSize.getWidth(context) * 1,
                  fit: BoxFit.cover,
                  imageUrl:
                      "https://cdn.pixabay.com/photo/2019/07/07/14/03/fiat-500-4322521_1280.jpg",
                  placeholder: (context, url) => Shimmer.fromColors(
                    baseColor: AppColors.grayColor,
                    highlightColor: AppColors.whiteGrayColor,
                    child: Image.network(
                      fit: BoxFit.cover,
                      "https://www.haliburtonforest.com/wp-content/uploads/2017/08/placeholder-square.jpg",
                    ),
                  ),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
              Positioned(
                  top: 0.0,
                  right: 0.0,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(60, 29),
                        backgroundColor: Colors.white,
                        shape: const CircleBorder(),
                      ),
                      onPressed: () {
                        // print('Is Favourite before ${listOfAdModel["_isFavourite"]}');
                        // if (detailController.userID.toString() == "") {
                        //   showCustomSnackBar(
                        //       message: "Please Login", title: "Login");
                        // } else {
                        //   if (productListModel.isFavourite!.value == true) {
                        //     controller
                        //         .removeFavorites(productListModel);
                        //   } else {
                        //     controller.addFavorites(productListModel);
                        //   }
                        // }

                        // print(
                        //     'Is Favourite after ${detailController.userID.toString()}');
                      },
                      child: const Icon(
                        // productListModel.isFavourite!.value == true
                        //     ? CupertinoIcons.heart_fill
                        //     : CupertinoIcons.heart,
                        CupertinoIcons.heart_fill,
                        color: AppColors.primaryColor,
                      )
                      // : const Icon(
                      //     CupertinoIcons.heart,
                      //     color: productBackgroundDark,
                      //   )
                      )),
            ],
          ),
          const SizedBox(height: AppPadding.wDefaultPadding / 4),
          Padding(
            padding: EdgeInsets.all(ConstantSize.getWidth(context) * 0.02),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Electronics",
                      textAlign: TextAlign.left,
                      maxLines: 1,
                      style: MyTextStyles.cardBoldPrimary,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      "10 June 2023",
                      style: MyTextStyles.cardRegularBlack,
                    ),
                  ],
                ),
                SizedBox(height: ConstantSize.getHeight(context) * 0.01),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "16GB RAM Windows 10 Laptop 15.6 FHD Screen 128GB/2562GB/512GB/1T SSD Ultra thin office notebook",
                    style: MyTextStyles.regularMediumBlack,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    softWrap: false,
                  ),
                ),
                SizedBox(height: ConstantSize.getHeight(context) * 0.01),
                customDevider(height: 1.0, indent: 2.0, endindent: 2.0),
                SizedBox(height: ConstantSize.getHeight(context) * 0.01),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset(
                          AppImages.svgMoney,
                          width: 24, // specify desired width
                          height: 24, // specify desired height
                        ),
                        const SizedBox(width: 8),
                         Text(
                          'Buy Now \n \$2500',
                          style:MyTextStyles.regularBoldBlack
                        ),
                      ],
                    ),
                    Container(
                      width: 1,
                      height: 20,
                      color: Colors.grey,
                    ),
                    Row(
                      children: [
                        const Icon(Icons.offline_pin_rounded,color: AppColors.primaryColor,),
                        // SvgPicture.asset(
                        //   AppImages.svgMoney,
                        //   width: 24, // specify desired width
                        //   height: 24, // specify desired height
                        // ),
                        const SizedBox(width: 8),
                         Text(
                          'Suggest\nPrice',
                          style: MyTextStyles.regularBoldBlack
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: ConstantSize.getHeight(context) * 0.01),
                customDevider(height: 1.0, indent: 2.0, endindent: 2.0),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
