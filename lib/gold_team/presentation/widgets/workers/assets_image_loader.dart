import 'package:flutter/material.dart';
import 'loading_widget.dart';

class AssetImageLoader extends StatelessWidget {
  final String assetPath;

  AssetImageLoader({required this.assetPath});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: loadImage(context),
      builder: (context, AsyncSnapshot<Image> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return LoadingWidget();
        } else if (snapshot.hasError) {
          return Center(child: Text('Error loading image'));
        } else {
          return Image(image: snapshot.data!.image);
        }
      },
    );
  }

  Future<Image> loadImage(BuildContext context) async {
    final image = Image(image: AssetImage(assetPath));
    await Future.delayed(Duration(seconds: 2));
    return image;
  }
}
