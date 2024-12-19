
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quick_chat/core/utils/app_colors.dart';
import 'package:quick_chat/core/utils/validator_utils.dart';
import 'package:quick_chat/core/widgets/custom_textfield.dart';
import 'package:quick_chat/gen/assets.gen.dart';

class EmailTextFormField extends StatefulWidget {
  const EmailTextFormField({super.key});

  @override
  State<EmailTextFormField> createState() => _EmailTextFormFieldState();
}

class _EmailTextFormFieldState extends State<EmailTextFormField> {
  TextEditingController EmailTextEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
        textEditingController: EmailTextEditingController,
        validator: (p0) => Validators.emailValidator(p0!),
        keyboardType: TextInputType.emailAddress,
        inputTextStyle: TextStyle(fontSize: 10.sp, color: Colors.white),
        hintText: 'Enter your email',
        prefixIcon:
            Assets.images.icons.emailIcon.image(color: AppColors.whiteBlack),
        label: 'Email');
  }
}
