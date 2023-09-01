
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:kaufes/utils/constants/colors.dart';
import 'package:shimmer/shimmer.dart';

import '../../../widgets/global_widgets/align_left_text.dart';

class CategoryItemWidget extends StatefulWidget {
  const CategoryItemWidget({super.key,});

  @override
  State<CategoryItemWidget> createState() => _CategoryItemWidgetState();
}

class _CategoryItemWidgetState extends State<CategoryItemWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      CachedNetworkImage(
        width: 70,
        height: 70,
        fit: BoxFit.cover,
        // imageUrl: category.image ??
        //     "https://firebasestorage.googleapis.com/v0/b/kaufes.appspot.com/o/category-image1.8629333187.1676021718716.webp?alt=media",
        imageUrl:
            'https://ae01.alicdn.com/kf/Sbd271fdc08e54e24bd3c4166c088c68ce/Laptop-gaming-computer-13-3inch-2K-HD-touchscreen-360-flip-Intel-Celeron-N5100-fingerprint-recognition-1TB.jpg_220x220xz.jpg_.webp',
        placeholder: (context, url) => Shimmer.fromColors(
            baseColor: AppColors.grayColor,
            highlightColor: AppColors.whiteColor,
            child: Image.network(
                fit: BoxFit.cover,
                "https://www.haliburtonforest.com/wp-content/uploads/2017/08/placeholder-square.jpg")),
        errorWidget: (context, url, error) => const Icon(Icons.error),
      ),
      const SizedBox(height: 10,),
       Padding(
        padding: const EdgeInsets.all(8.0),
        child: alignCenterLeft(
           Text(
              "Electronics",
              maxLines: 2,
             style: MyTextStyles.regularBoldBlack,
            )),
      ),
    ]);
  }
}
