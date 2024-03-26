import 'package:flutter/material.dart';
import 'package:genrobotictask/core/constant.dart';

class LoadingGradientContainer extends StatelessWidget {
  const LoadingGradientContainer({
    super.key,
    required this.width,
  });
  final double width;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsetsGeometry.lerp(EdgeInsets.zero, EdgeInsets.zero, 0),
      shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 10,
      child: Container(
        width: width,
        height: 50,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: const LinearGradient(
              colors: [Color(0xff232526), Color(0xff414345)],
            )),
        child: const Center(
            child: CircularProgressIndicator(
          color: kwhite,
        )),
      ),
    );
  }
}
