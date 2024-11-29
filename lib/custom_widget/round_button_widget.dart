import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

roundButtonWidget({
  required String text,
  double? height,
  double? width,
  Color? color,
  VoidCallback? onTap,
}) {
  return InkWell(
    onTap:onTap ,
    child: Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Text(text, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    ),
  );
}
