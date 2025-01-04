import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:rick_and_morty/core/config/theme/app_colors.dart';


///  A custom text field that can be used to enter text.
///  It provides a way to style the text field and its label.
///  It also provides a way to validate user input.
///  It is a wrapper around [TextField] and [TextFormField].
class CustomTextField extends StatefulWidget {
  /// Default constructor.
  const CustomTextField({
    required this.hint,
    required this.showPrefixIcon,
    required this.keyboardType,
    required this.currentFocus,
    required this.controller,
    required this.label,
    this.onFieldSubmitted,
    this.onIconTap,
    super.key,
    this.svgSize,
    this.validator,
    this.svgColorFilter,
    this.svgBlendMode = BlendMode.srcIn,
    this.textCapitalization,
    this.borderRadius = 12.0,
    this.hintSize,
    this.iconSize,
    this.onChange,
    this.iconColor,
    this.suffixIconSvg,
    this.isPrefixIcon,
    this.prefixIcon,
    this.assetsPath,
    this.nextFocus,
    this.autoFocus,
    this.validate,
    this.readOnly = false,
    this.onTap,
    this.maxLines,
    this.maxLength,
    this.suffixIcon,
    this.autofillHints,
  });

  /// The `validate` function is used to validate the text in the field. It is
  /// called when the field is changed, and when the field is submitted.
  ///
  /// If the `validate` function returns null, the input is considered valid.
  /// Otherwise, the returned string is displayed as an error message.
  ///
  /// example:
  ///
  ///  *  `validate: (value) => Validator.password(value)`
  final String? Function(String?)? validate;

  /// validator
  final FormFieldValidator<String>? validator;

  /// A boolean flag to determine if the `prefixIcon` is icon or svg.
  ///
  /// This is set to `true` then a `prefixIcon` will show
  /// otherwise if `false` then an `assetsPath` will show
  ///
  /// otherwise it defaults to `false`.
  final bool? isPrefixIcon;

  /// if `prefixIcon` is provided and `showPrefixIcon` is true then
  /// show the [prefixIcon] `witch is an icon(IconData)`
  ///
  ///
  /// if `prefixIcon` is not provided and `showPrefixIcon` is true then n
  /// show the [assetsPath] `witch is an svg image`
  ///
  ///
  /// if `showPrefixIcon` is false
  /// it will not show ether of svg image or an icon
  ///
  /// `this variable must be provided`
  final bool showPrefixIcon;

  /// if `showPrefixIcon` is true and `isPrefixIcon` is true then
  /// `prefixIcon` will show
  final IconData? prefixIcon;

  /// if `showPrefixIcon` is true and `isPrefixIcon` is false then
  /// by providing the `svg path` here will show an svg icon
  final String? assetsPath;

  /// The controller that will be used to manipulate the text field.
  final TextEditingController controller;

  /// The type of keyboard to use for editing the text.
  final TextInputType keyboardType;

  /// The current focus state of the text field.
  final FocusNode currentFocus;

  /// The next focus state of the text field.
  final FocusNode? nextFocus;

  /// A boolean flag to determine if the text field is in focus.
  final bool? autoFocus;

  /// A boolean flag to determine if the text field is read only.
  final bool? readOnly;

  /// A callback function to be called when the text field is tapped.
  final VoidCallback? onTap;

  /// The color of the icon.
  final Color? iconColor;

  /// The size of the icon.
  final double? iconSize;

  /// The hint text to be displayed when the text field is empty.
  final String hint;

  /// The size of the hint text.
  final double? hintSize;

  /// The text capitalization to be used for the text field.
  final TextCapitalization? textCapitalization;

  /// A callback function to be called when the text field is changed.
  final void Function(String)? onChange;

  /// Am svg path for the suffix icon.
  final String? suffixIconSvg;

  /// The maximum number of lines for the text field.
  final int? maxLines;

  /// The border radius of the text field.
  final double borderRadius;

  /// The label text to be displayed above the text field.
  final String? label;

  /// max length of the text field.
  final int? maxLength;

  /// svg color filter
  final Color? svgColorFilter;

  /// svg blend mode
  final BlendMode svgBlendMode;

  /// svg size
  final double? svgSize;

  /// on tap on suffix icon
  final void Function()? onIconTap;

  /// suffix icon
  final IconData? suffixIcon;

  /// autofillHints
  final Iterable<String>? autofillHints;

  /// on field submitted
  final void Function(String)? onFieldSubmitted;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool showPassword = false;
  bool isError = false;

  void _changeVisibility() {
    setState(() {
      showPassword = !showPassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: widget.keyboardType,
      scrollPadding: const EdgeInsets.only(bottom: 200),
      obscureText:
          widget.keyboardType == TextInputType.visiblePassword && !showPassword,
      controller: widget.controller,
      autofillHints: widget.autofillHints,
      textCapitalization: widget.textCapitalization ?? TextCapitalization.none,
      focusNode: widget.currentFocus,
      autofocus: widget.autoFocus ?? false,
      readOnly: widget.readOnly ?? false,
      onTap: widget.onTap,
      onEditingComplete: widget.onTap,
      onTapOutside: (event) {
        widget.currentFocus.unfocus();
      },
      textAlignVertical: TextAlignVertical.center,
      maxLength: widget.maxLength,
      maxLines: widget.maxLines ?? 1,
      decoration: InputDecoration(
        hintText: widget.hint,
        hintStyle: TextStyle(
          fontSize: widget.hintSize ?? 14.0,
        ),
        suffixIconConstraints: const BoxConstraints(maxHeight: 30),
        prefixIconConstraints: BoxConstraints.tight(const Size(48, 22)),
        prefixIcon: Icon(widget.prefixIcon, color: widget.iconColor),
        fillColor: Colors.white,
        filled: true,
        errorMaxLines: 9,
        errorStyle: TextStyle(color: AppColor.errorColor, fontSize: 12),
        errorBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: AppColor.errorColor,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(widget.borderRadius),
          ),
          borderSide: BorderSide(
            color: AppColor.errorColor,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(widget.borderRadius),
          ),
          borderSide: BorderSide(
            color: AppColor.color300,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(widget.borderRadius),
          ),
          borderSide: BorderSide(
            color: AppColor.color300,
          ),
        ),
        disabledBorder: InputBorder.none,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(
              widget.borderRadius,
            ),
          ),
          borderSide: BorderSide(
            color: AppColor.color300,
          ),
        ),
      ),
      textInputAction: widget.nextFocus == null
          ? TextInputAction.done
          : TextInputAction.next,
      onFieldSubmitted: widget.onFieldSubmitted,
      onChanged: widget.onChange ,
      validator: widget.validator ??
          (value) {
            if (widget.validate != null) {
              return widget.validate!(value);
            }
            return null;
          },
    );
  }
}
