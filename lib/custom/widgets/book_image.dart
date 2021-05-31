import 'package:flutter/material.dart';

class BookImage extends StatelessWidget {

  final String path;
  final double height;
  final double width;

  BookImage({
    required this.path,
    required this.height,
    required this.width
  });

  @override
  Widget build(BuildContext context) {
    final image = Container(
      width: width,
      height: height,
      margin: EdgeInsets.only(right: 20.0),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(path),
          fit: BoxFit.cover
        )
      ),
    );

    return image;
  }

}