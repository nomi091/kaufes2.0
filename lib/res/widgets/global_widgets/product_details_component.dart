import 'package:flutter/material.dart';
import 'package:kaufes/utils/constants/colors.dart';


// ignore: must_be_immutable
class ProductDetilComponents extends StatelessWidget {
  ProductDetilComponents({Key? key,required this.title,required this.titleDetails,required this.line}) : super(key: key);
  String title;
  String titleDetails;
  bool line;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height:AppPadding.wDefaultPadding/1.5,),
        Row(children: [
          Expanded(child: Text(title,overflow: TextOverflow.ellipsis,maxLines: 1,style: MyTextStyles.regularDetailGrey,)),
          Text(titleDetails,textAlign: TextAlign.right,style: MyTextStyles.regularDetailGrey,)
        ],),
        const SizedBox(height: AppPadding.wDefaultPadding/1.5,),
        line==true ? const Divider(
            color:AppColors.grayColor 
        ) : const SizedBox(),
      ],
    );
  }
}
