import 'package:flutter/cupertino.dart';

class Space extends StatelessWidget {
  double? width;
  double? height;

  Space({this.width, this.height});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
    );
  }
}
