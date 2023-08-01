import 'package:flutter/material.dart';
import 'package:kaufes/utils/constants/colors.dart';

// ignore: must_be_immutable
class CategoryItemListCard extends StatefulWidget {
   CategoryItemListCard({super.key,required this.title});
  var title='';
  @override
  State<CategoryItemListCard> createState() => _CategoryItemListCardState();
}

class _CategoryItemListCardState extends State<CategoryItemListCard> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(
       widget.title,
        style: MyTextStyles.detailCardBoldBlack,
        overflow: TextOverflow.ellipsis,
      ),
      trailing: const Icon(
        Icons.arrow_forward_ios_outlined,
        color: AppColors.blackColor,
        size: 20,
      ),
    );
  }
}
