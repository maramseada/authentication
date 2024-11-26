
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../constants/app_colors.dart';

class CustomTextField extends StatefulWidget {
  final TextInputType type;
  final Widget? prefix;
  final Widget? suffix;
  final String hint;
  final String? errorText;
  final Color? fillColor;
  final Color? borderColor;
  final bool? enabled;
  final FocusNode? focusNode;
  final int? minLines;
  final TextDirection? textDirection;
  final String? Function(String?)? validator;
  final void Function(String)? onChange;
  final void Function(String)? onFieldSubmitted;
  final TextEditingController? controller;
  final String? initialValue;
  final Function()? onTap;
  final double? height;
  final int? maxLines;
  final TextStyle? textStyle; // Ensure textStyle is defined
  final TextStyle? hintStyle;
  final bool showBorder;
  final double borderRadius;
  final EdgeInsets? contentPadding;
  final BoxConstraints? prefixIconConstraints;
  final List<TextInputFormatter>? inputFormatters;
  final TextAlign? textAlign;
  final double? borderWidth;

  const CustomTextField({
    super.key,
    this.type = TextInputType.text,
    this.prefix,
    required this.hint,
    this.suffix,
    this.fillColor,
    this.validator,
    this.initialValue,
    this.onTap,
    this.height,
    this.enabled = true,
    this.showBorder = true,
    this.borderRadius =6,
    this.maxLines,
    this.onChange,
    this.controller,
    this.onFieldSubmitted,
    this.focusNode,
    this.textStyle,
    this.prefixIconConstraints,
    this.hintStyle,
    this.inputFormatters,
    this.textDirection,
    this.minLines,
    this.textAlign,
    this.errorText,
    this.borderColor,
    this.contentPadding,
    this.borderWidth,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _visible = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TextFormField(
        enabled: widget.enabled,
        controller: widget.controller,
        keyboardType: widget.type,
        readOnly: widget.onTap != null,
        initialValue: widget.initialValue,
        onTap: widget.onTap,
        onChanged: widget.onChange,
        onFieldSubmitted: widget.onFieldSubmitted,
        validator: widget.validator,
        focusNode: widget.focusNode,
        maxLines:
        widget.type == TextInputType.visiblePassword ? 1 : widget.maxLines,
        minLines: widget.minLines,
        obscureText: widget.type == TextInputType.visiblePassword && !_visible,
        inputFormatters: widget.inputFormatters,
        // textDirection: widget.textDirection ??
        //     (widget.isEn ? TextDirection.ltr : TextDirection.rtl),
        textAlign: widget.textAlign ?? TextAlign.start,
        style: widget.textStyle, // Apply the textStyle here
        decoration: InputDecoration(
          hintText: widget.hint,
          alignLabelWithHint: true,
          contentPadding: widget.contentPadding ??
              const EdgeInsets.symmetric(horizontal: 10),
          hintStyle: widget.hintStyle,
          labelStyle: widget.textStyle,
          border: widget.showBorder
              ? OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.borderRadius),
            borderSide: widget.borderColor != null
                ? BorderSide(
                color: widget.borderColor!,
                width: widget.borderWidth ?? 1)
                : const BorderSide(),
          )
              : InputBorder.none,
          errorText: widget.errorText,
          fillColor: widget.fillColor,
          filled: widget.fillColor != null,
          prefixIcon: widget.prefix,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.borderRadius),
            borderSide: widget.borderColor != null
                ? BorderSide(
                color: widget.borderColor!, width: widget.borderWidth ?? 1)
                : const BorderSide(),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.borderRadius),
            borderSide: widget.borderColor != null
                ? BorderSide(
                color: widget.borderColor!, width: widget.borderWidth ?? 1)
                : const BorderSide(),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.borderRadius),
            borderSide: widget.borderColor != null
                ? BorderSide(
                color: widget.borderColor!, width: widget.borderWidth ?? 1)
                : const BorderSide(),
          ),
          prefixIconConstraints: widget.prefixIconConstraints,
          suffixIcon: widget.suffix ??
              (widget.type != TextInputType.visiblePassword
                  ? null
                  : GestureDetector(
                onTap: () => setState(() => _visible = !_visible),
                child: Icon(
                  _visible
                      ? Icons.visibility_outlined
                      : Icons.visibility_off_outlined,
                  color: _visible ? AppColors.primaryBlue : Colors.grey,
                ),
              )),
        ),
      ),
    );
  }
}
