import 'package:flutter/material.dart';

class TextFiledCommon extends StatelessWidget {
  final InputDecoration? decoration;
  final String? hintText;
  final int? minLines;
  final int? maxLines;
  final OutlineInputBorder? border;
  final OutlineInputBorder? disabledBorder;
  final bool? filled;
  final bool? enabled;
  final Color? fillColor;
  final TextEditingController? controller;
  final TextStyle? hintStyle;
  const TextFiledCommon(
      {Key? key,
      this.decoration,
      this.hintText,
      this.border,
      this.disabledBorder,
      this.filled,
      this.enabled,
      this.fillColor,
      this.controller,
      this.hintStyle,
      this.minLines,
      this.maxLines})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: maxLines ?? 1,
      minLines: minLines ?? 1,
      enabled: enabled ?? true,
      controller: controller,
      decoration: decoration ??
          InputDecoration(
            hintText: hintText ?? "",
            border: border ??
                const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black87),
                ),
            disabledBorder: disabledBorder ??
                const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black87),
                ),
            filled: filled ?? true,
            fillColor: fillColor ?? Colors.grey.shade300,
          ),
    );
  }
}
