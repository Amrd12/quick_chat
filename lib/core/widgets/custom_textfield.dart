import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quick_chat/core/utils/app_colors.dart';
import '../../gen/assets.gen.dart';
import '../constants/app_text_styles.dart';
import '../utils/app_utils.dart';

enum CustomTextFieldType { phone, email, password, name, text }

class CustomTextFormField extends StatefulWidget {
  final String hintText;
  final String label;
  final Widget? icon;
  final Function(String)? onChanged;
  final bool? obscureText;
  final String? obsecuringCharacter;
  final TextInputType? keyboardType;
  final CustomTextFieldType? type;
  final TextEditingController? textEditingController;
  final int? maxLines;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextStyle? hintTextStyle;
  final BoxConstraints? prexixIconConstraints;
  final BoxConstraints? suffixIconConstraints;
  final double? top;
  final double? bottom;
  final double? end;
  final double? start;
  final String? Function(String?)? validator;
  final bool? isReadOnly;
  final bool? customValidation;
  final TextStyle? inputTextStyle;

  const CustomTextFormField({
    super.key,
    this.onChanged,
    required this.hintText,
    this.icon,
    this.obscureText = false,
    this.obsecuringCharacter = "*",
    this.textEditingController,
    this.keyboardType = TextInputType.text,
    this.type = CustomTextFieldType.text,
    this.maxLines = 1,
    required this.prefixIcon,
    this.suffixIcon,
    required this.label,
    this.hintTextStyle,
    this.prexixIconConstraints,
    this.suffixIconConstraints,
    this.top,
    this.bottom,
    this.end,
    this.start,
    this.validator,
    this.isReadOnly,
    this.customValidation = false,
    this.inputTextStyle, // Add the new parameter
  });
  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  late bool isObsecured;
  final FocusNode _focusNode = FocusNode();
  bool _hasValidationError = false;
  String? _errorMessage;
  @override
  void initState() {
    isObsecured = widget.obscureText ?? false;
    _focusNode.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  void togglePasswordVisibility() {
    setState(() {
      isObsecured = !isObsecured;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsetsDirectional.only(
            top: widget.top ?? (AppScreenUtils.isTablet ? 8.h : 4.h),
            end: widget.end ?? 23.w,
            bottom: widget.bottom ?? (AppScreenUtils.isTablet ? 8.h : 4.h),
            start: widget.start ?? 11.w,
          ),
          child: TextFormField(
            cursorHeight: 22.sp,
            readOnly: widget.isReadOnly ?? false,
            onTap: () {
              setState(() {
                _focusNode.requestFocus();
              });
            },
            focusNode: _focusNode,
            validator: (value) {
              //handle custom validation by helmy(11/11/2024)
              if (widget.customValidation == true) {
                return widget.validator?.call(value);
              } else if (value?.isEmpty ?? true) {
                setState(() {
                  _hasValidationError = true;
                  _errorMessage = "field_can't_be_empty";
                });
                return "";
              }
              final validationResult = widget.validator?.call(value);
              setState(() {
                _hasValidationError = validationResult != null;
                _errorMessage = validationResult;
              });
              return validationResult;
            },
            maxLines: widget.maxLines,
            obscureText: isObsecured,
            obscuringCharacter: "*",
            enableSuggestions: true,
            controller: widget.textEditingController,
            style: AppTextStyles.alexandria20WhitekW100,
            cursorColor: AppColors.whiteBlack,

            keyboardType: widget.keyboardType,
            decoration: InputDecoration(
              filled: true,
              fillColor:
                  Theme.of(context).colorScheme.onSurface.withOpacity(.3),
              errorStyle: const TextStyle(fontSize: 0),
              prefixIconConstraints: widget.prexixIconConstraints ??
                  BoxConstraints(
                    minWidth: 30.w,
                    minHeight: 30.h,
                    maxWidth: 50.w,
                    maxHeight: 50.h,
                  ),
              contentPadding: EdgeInsetsDirectional.only(
                start: widget.start ?? 15.w,
                end: widget.end ?? 15.w,
                top: widget.top ?? (AppScreenUtils.isTablet ? 8.h : 4.h),
                bottom: widget.bottom ?? (AppScreenUtils.isTablet ? 8.h : 4.h),
              ),
              labelText: _focusNode.hasFocus ? widget.label : widget.hintText,
              labelStyle: _focusNode.hasFocus
                  ? AppTextStyles.alexandria15WhiteBlackW500
                  : AppTextStyles.alexandria15WhiteBlackW500,
              hintText: widget.hintText,
              prefixIcon: Padding(
                padding: EdgeInsets.all(10.0.sp),
                child: widget.prefixIcon,
              ),
              hintStyle: widget.hintTextStyle ??
                  AppTextStyles.alexandria15WhiteBlackW500,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: BorderSide(
                  color: _hasValidationError
                      ? AppColors.red
                      : AppColors.whiteBlack,
                  width: 1,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: BorderSide(
                  color: AppColors.whiteBlack,
                  width: 1,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: BorderSide(
                  color: AppColors.whiteBlack,
                  width: 1.5,
                ),
              ),
              suffixIconConstraints: widget.suffixIconConstraints ??
                  BoxConstraints(
                    minWidth: AppScreenUtils.isTablet ? 20.w : 20.w,
                    minHeight: AppScreenUtils.isTablet ? 25.h : 25.h,
                    maxWidth: AppScreenUtils.isTablet ? 20.w : 20.w,
                    maxHeight: AppScreenUtils.isTablet ? 25.h : 25.h,
                  ),
              suffixIcon: checkAboutSuffixIcon(),
            ),
          ),
        ),
        if (_hasValidationError && _errorMessage != null)
          Padding(
            padding: EdgeInsets.only(top: 4.h),
            child: Text(
              _errorMessage!,
              style: AppTextStyles.alexandria11redw400,
            ),
          ),
      ],
    );
  }

  ///make check if the suffix icon is specified or no , if so then it will be returned and if not then make another check if the obsecure text is set to true and if so then it will provide a button to toggle the obsecure
  Widget? checkAboutSuffixIcon() {
    if (widget.suffixIcon != null) {
      return widget.suffixIcon;
    } else if (widget.obscureText == true) {
      return GestureDetector(
        onTap: () {
          togglePasswordVisibility();
        },
        child: Padding(
          padding:
              EdgeInsets.only(right: 20.w), // Add 20 spacing from the border
          child: Container(
            width: 30.w, // Ensure the icon retains its size
            height: 30.h,
            alignment: Alignment.center, // Center the icon
            child: isObsecured
                ? Assets.images.icons.eyeDisabled.svg(height: 20.h, width: 20.w)
                : Assets.images.icons.eyeEnabled.svg(height: 20.h, width: 20.w),
          ),
        ),
      );
    }
    return null;
  }

  /// Returns an [OutlineInputBorder] with a circular border radius of 10
  /// and a border side with the given [color].
  ///
  /// This is used to style the border of a [TextFormField].
  ///
  /// The [color] parameter is the color of the border side of the
  /// [OutlineInputBorder].
  ///
  /// The returned [OutlineInputBorder] has a [BorderRadius.circular] of 10
  /// and a [BorderSide] with the given [color].
  // OutlineInputBorder _buildBorder({required Color color}) {
  //   return OutlineInputBorder(
  //     borderRadius: BorderRadius.circular(10.r),
  //     borderSide: BorderSide(color: color),
  //   );
  // }
}
