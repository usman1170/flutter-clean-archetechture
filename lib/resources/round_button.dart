import 'package:flutter/material.dart';

class BasicButton extends StatelessWidget {
  const BasicButton(
      {super.key,
      required this.ontap,
      required this.height,
      required this.width,
      required this.color, required this.title});
  final VoidCallback ontap;
  final double height;
  final double width;
  final Color color;
  final String title;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Center(
          child: Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
