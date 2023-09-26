import 'dart:io';
import 'package:flutter/material.dart';

class ProfilePicImageViewer extends StatelessWidget {
  const ProfilePicImageViewer({
    this.image,
    this.width,
    this.height,
    // this.networkImage,
    // this.fileImage,
    required this.imageType,
    Key? key,
  }) : super(key: key);
  final String? image;
  final double? width;
  final double? height;
  // final String? networkImage;
  // final String? fileImage;
  final ImageType imageType;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      width: width ?? 117,
      height: height ?? 122,
      duration: const Duration(seconds: 2),
      decoration: BoxDecoration(
        color: Color(0xff98A2B3),
        // image: returnImage(image??'',imageType),
        shape: BoxShape.circle,
      ),
      // child: imageType==ImageType.network?ClipRRect(
      //   borderRadius: BorderRadius.circular(400),
      //   // borderRadius: BorderRadius.circular(400),
      //   child: Image.network(
      //     image??'',
      //     // width: 117,
      //     // height: 122,
      //     fit: BoxFit.cover,
      //     gaplessPlayback: true,
      //   ),
      // ):null,
    );
  }
  DecorationImage? returnImage(String image, ImageType imageType){
    // log(image);
    switch(imageType){

      case ImageType.asset:
        return DecorationImage(
          image: AssetImage(
            image,
          ),
          fit: BoxFit.cover,
        );
      case ImageType.file:
        return DecorationImage(
            fit: BoxFit.cover,
            image: FileImage(
              File(image),
            ));

      case ImageType.network:
        return DecorationImage(
          // repeat: ,
            fit: BoxFit.cover,
            image: NetworkImage(
              image,

            ));
      case ImageType.empty:
        return null;
    }
  }
}
enum ImageType{
  asset,
  file,
  network,
  empty,
}