import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:super_fitness_app/core/utilities/style/app_icons.dart';

class CustomTextFormField extends StatefulWidget {
  CustomTextFormField({
    super.key,
    required this.labelText,
    required this.hintText,
    required this.keyboardType,
    required this.controller,
    required this.validator,
    this.isPasswordVisible = true,
    this.showPassword,
    this.onChanged,
    this.custfocusNode,
    this.prefixIcon,
    this.suffixIcon// optional prefix icon parameter
  });

  final String? labelText;
  final String? hintText;
  final TextInputType? keyboardType;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  bool isPasswordVisible;
  void Function()? showPassword;
  void Function(String)? onChanged;
  final FocusNode? custfocusNode;
  final String? suffixIcon;
  final String? prefixIcon; // user-provided prefix icon

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  // Internal focus node
  final FocusNode _focusNode = FocusNode();
  bool _isFocused = false;

  // State variable to decide if the suffix icon should be shown
  bool _showSuffixIcon = false;

  @override
  void initState() {
    super.initState();

    // Listen to focus changes
    _focusNode.addListener(() {
      setState(() {
        _isFocused = _focusNode.hasFocus;
      });
    });

    // Listen to text changes to decide whether to show the suffix icon
    widget.controller.addListener(() {
      setState(() {
        _showSuffixIcon = widget.controller.text.isNotEmpty;
      });
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isSummaryField = widget.labelText == "Summary";

    return TextFormField(
      focusNode: widget.custfocusNode ?? _focusNode,
      controller: widget.controller,
      onChanged: widget.onChanged,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      // If showPassword is provided, treat this as a password field.
      obscureText:
          widget.showPassword == null ? false : widget.isPasswordVisible,
      validator: widget.validator,
      keyboardType:
          isSummaryField ? TextInputType.multiline : widget.keyboardType,
      maxLines: isSummaryField ? 5 : 1,
      style: const TextStyle(
        color: Color(0xFFD3D3D3),
        fontSize: 12,
        fontFamily: 'Baloo Thambi 2',
        fontWeight: FontWeight.w400,
        height: 1.40,
      ),
      decoration: InputDecoration(
        // Use the user-provided prefix icon if any
        prefixIcon: widget.prefixIcon != null
            ? Padding(
                padding: const EdgeInsets.only(left: 16, right: 8),
                child: SvgPicture.asset(
                  widget.prefixIcon!,
                  width: 20,
                  height: 20,
                  color: Color(0xFFD9D9D9),
                ),
              )
            : null,

        suffixIcon: widget.showPassword != null
            ? (_showSuffixIcon
                ? IconButton(
                    onPressed: widget.showPassword,
                    icon: widget.isPasswordVisible
                        ? SvgPicture.asset(AppIcons.eyeIcon)
                        : const Icon(
                            Icons.visibility_off_outlined,
                            color: Color(0xFFD9D9D9),
                            size: 20,
                          ),
                  )
                : null)
            : _showSuffixIcon
                ? IconButton(
                    onPressed: () {
                      widget.controller.clear();
                      if (widget.onChanged != null) {
                        widget.onChanged!(
                            ""); // Notify that text has been cleared
                      }
                    },
                    icon: const Icon(
                      Icons.clear,
                      color: Colors.white,
                    ),
                  )
                : null,

        hintText: widget.hintText,
        hintStyle: const TextStyle(
          color: Color(0xFFD3D3D3),
          fontSize: 12,
          fontFamily: 'Baloo Thambi 2',
          fontWeight: FontWeight.w400,
          height: 1.40,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
          borderSide: const BorderSide(
            color: Color(0xFFD9D9D9),
            width: 1.0,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
          borderSide: const BorderSide(
            color: Color(0xFFD9D9D9),
            width: 1.0,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
          borderSide: const BorderSide(
            color: Colors.red,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
          borderSide: const BorderSide(
            color: Colors.red,
          ),
        ),
        filled: true,
        fillColor: Colors.transparent,
      ),
    );
  }
}
