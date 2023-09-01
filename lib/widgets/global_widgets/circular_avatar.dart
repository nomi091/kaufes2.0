import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:kaufes/utils/constants/colors.dart';

class CireleAvatarImage extends StatelessWidget {
  CireleAvatarImage({Key? key, this.image, this.url, required this.border, this.file})
      : super(key: key);

  String? image;
  File? file;
  String? url;

  double border;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        CircleAvatar(
          minRadius: border,
          maxRadius: border,
          backgroundColor: AppColors.whiteColor,
          child: url == null
              ? CircleAvatar(
                  minRadius: (border - 3),
                  maxRadius: (border - 3),
                  backgroundImage: image == null
                      ? FileImage(file!) as ImageProvider
                      : AssetImage(image!),
                )
              : CachedNetworkImage(
                  imageUrl: url!,
                  imageBuilder: (context, imageProvider) => Container(
                    decoration: BoxDecoration(
                      border: Border.all(width: 3, color: AppColors.whiteColor),
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  placeholder: (context, url) => const CircularProgressIndicator(color: Colors.white),
                  errorWidget: (context, url, error) => Icon(Icons.error, size: border - 5, color: Colors.white),
                ),
        ),
       Positioned(
          bottom: 0,
          right: 2,
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            padding: const EdgeInsets.all(6.0), // Adjust the padding as needed
            child: const Icon(
              Icons.camera_alt,
              size:  20, // Adjust the size of the camera icon as needed
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }
}
