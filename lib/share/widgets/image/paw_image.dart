import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paw_fund_shelter_owner/share/constans/enums/paw_enums.dart';
import 'package:paw_fund_shelter_owner/share/controller/image/paw_image_controller.dart';

class PImage extends StatelessWidget {
  const PImage({
    super.key,
    required this.url,
    this.width = 15,
    this.height = 15,
    this.boxFit = BoxFit.cover,
    required this.imageType
  });

  final String url;
  final double width;
  final double height;
  final BoxFit boxFit;
  final EImageType imageType;

  @override
  Widget build(BuildContext context) {
    switch (imageType) {
      case EImageType.asset:
        return AssetImage(
          assetUrl: url,
          height: height,
          width: width,
          boxFit: boxFit,
        );
      case EImageType.network :
        return NetworkImage(
            networkUrl: url,
            width: width,
            height: height,
            boxFit: boxFit
        );
    }
  }
}

class AssetImage extends StatelessWidget {
  const AssetImage({
    super.key,
    required this.assetUrl,
    required this.width,
    required this.height,
    required this.boxFit
  });

  final String assetUrl;
  final double width;
  final double height;
  final BoxFit boxFit;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
        assetUrl,
        width: width,
        height: height,
        fit: boxFit,
    );
  }
}

class NetworkImage extends StatefulWidget {
  NetworkImage({
    super.key,
    required this.networkUrl,
    required this.width,
    required this.height,
    required this.boxFit
  });

  final String networkUrl;
  final double width;
  final double height;
  final BoxFit boxFit;

  @override
  State<NetworkImage> createState() => _NetworkImageState();
}

class _NetworkImageState extends State<NetworkImage> {
  final ImageController imageController = Get.find();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      imageController.setImageUrl(widget.networkUrl);
    },);
  }

  @override
  Widget build(BuildContext context) {


    return Obx(() {
      if(imageController.getIsPending()) {
        return SizedBox();
      } else {
        return Image.network(
          imageController.getUrl(),
          width: widget.width,
          height: widget.height,
          fit: widget.boxFit,
        );
      }

    },);
  }
}

class Test extends StatefulWidget {
  const Test({super.key});



  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {

  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

