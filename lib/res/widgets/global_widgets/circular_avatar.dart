import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:kaufes/utils/constants/colors.dart';


// ignore: must_be_immutable
class CireleAvatarImage extends StatelessWidget {
  CireleAvatarImage({Key? key, this.image, this.url,required this.border,this.file}) : super(key: key);
  String? image;
  File? file;
  String? url;

  double border;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      minRadius: border,
      maxRadius: border,
      backgroundColor:AppColors.secondaryColor ,
      child: url==null ? CircleAvatar(
        minRadius: (border-3),
        maxRadius: (border-3),
        backgroundImage: image==null ?  FileImage(file!) as ImageProvider :  AssetImage(image!,),)
          :  CachedNetworkImage(
            imageUrl: url!,
            imageBuilder: (context, imageProvider) => Container(
              decoration: BoxDecoration(
                border: Border.all(width: 3, color: AppColors.secondaryColor ),
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.cover,
                ),
              ),
            ),
            placeholder: (context, url) => const CircularProgressIndicator(color: Colors.white),
            errorWidget: (context, url, error) => Icon(Icons.error,size: border-5,color: Colors.white,),
          ),
    ) ;
  }
}
