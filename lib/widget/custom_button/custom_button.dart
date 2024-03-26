import 'package:flutter/material.dart';
import 'package:genrobotictask/core/constant.dart';
import 'package:genrobotictask/core/font_size/font_size.dart';
import 'package:genrobotictask/widget/text_widget/text_widget.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    required this.width,
    required this.function,
  });
  final String text;
  final double width;
  final Function() function;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: function,
      child: Card(
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
          child: Center(
              child: textWidget(
                  text: text,
                  color: kwhite,
                  size: mediumFont,
                  weight: FontWeight.w500)),
        ),
      ),
    );
  }
}
