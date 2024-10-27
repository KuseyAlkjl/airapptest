import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomTextFieldWidget extends StatefulWidget {
  final String? hintText;
  final String? labelText;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final FocusNode? nextFocus;
  final TextInputType inputType;
  final TextInputAction inputAction;
  final Color? fillColor;
  final int maxLines;
  final bool isPassword;
  final bool isCountryPicker;
  final bool isShowBorder;
  final bool isIcon;
  final bool isShowSuffixIcon;
  final bool isShowPrefixIcon;
  final Function? onTap;
  final Function? onChanged;
  final Function? onSuffixTap;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool isSearch;
  final Function(String)? onSubmit;
  final bool isEnabled;
  final TextCapitalization capitalization;
  final String? Function(String?)? validator; // Optional validator function
  final Map<String, String> validationConditions; // Validation conditions
  final Map<String, String> validationErrorMessages; // Error messages for each condition
  final String? type;// Optional type
  final bool readOnly;

  CustomTextFieldWidget({
    Key? key,
    this.hintText = 'Write something...',
    this.labelText = 'Write something',
    this.controller,
    this.focusNode,
    this.readOnly=false,
    this.nextFocus,
    this.isEnabled = true,
    this.inputType = TextInputType.text,
    this.inputAction = TextInputAction.next,
    this.maxLines = 1,
    this.onSuffixTap,
    this.fillColor,
    this.onSubmit,
    this.onChanged,
    this.capitalization = TextCapitalization.none,
    this.isCountryPicker = false,
    this.isShowBorder = false,
    this.isShowSuffixIcon = false,
    this.isShowPrefixIcon = false,
    this.onTap,
    this.isIcon = false,
    this.isPassword = false,
    this.suffixIcon,
    this.prefixIcon,
    this.isSearch = false,
    this.validator,
    this.validationConditions = const {},
    this.validationErrorMessages = const {},
    this.type,
  }) : super(key: key);

  @override
  State<CustomTextFieldWidget> createState() => _CustomTextFieldWidgetState();
}

class _CustomTextFieldWidgetState extends State<CustomTextFieldWidget> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: widget.maxLines,
      controller: widget.controller,
      focusNode: widget.focusNode,
      style: Theme.of(context).textTheme.displayMedium!.copyWith(color: Colors.deepPurple, fontSize: 15),
      textInputAction: widget.inputAction,
      keyboardType: widget.inputType,
      cursorColor: Colors.deepPurple,
      textCapitalization: widget.capitalization,
      enabled: widget.isEnabled,
      obscureText: widget.isPassword ? _obscureText : false,
      inputFormatters: widget.inputType == TextInputType.phone
          ? <TextInputFormatter>[FilteringTextInputFormatter.allow(RegExp('[0-9+]'))]
          : null,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 22),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(style: BorderStyle.none, width: 1, color: Colors.deepPurple),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(width: 1, color: Colors.deepPurple),
        ),
        isDense: true,
        hintText: widget.hintText,
        fillColor: Colors.transparent,
        hintStyle: TextStyle(
          fontSize: 14,
          color: Colors.grey,
        ),
        labelText: widget.labelText,
        prefixIcon: widget.prefixIcon?? null,
        suffixIcon: widget.suffixIcon?? null,
      ),
      onTap: widget.onTap as void Function()?,
      onFieldSubmitted: (text) => widget.nextFocus != null ? FocusScope.of(context).requestFocus(widget.nextFocus) : widget.onSubmit!(text),
      onChanged: widget.onChanged as void Function(String)?,
      validator: widget.type != null
          ? (value) => validateInput(value: value ?? '', type: widget.type!)
          : widget.validator,
    );
  }

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  String? validateInput({
    required String value,
    required String type,
  }) {
    switch (type) {
      case 'email':
        final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+$');
        if (value.isEmpty) {
          return widget.validationErrorMessages['email'] ?? 'البريد الإلكتروني لا يمكن أن يكون فارغاً';
        }
        if (!emailRegex.hasMatch(value)) {
          return widget.validationErrorMessages['emailInvalid'] ?? 'يرجى إدخال بريد إلكتروني صحيح';
        }
        break;

      case 'name':
        final hasDigits = RegExp(r'\d').hasMatch(value);
        if (value.isEmpty) {
          return widget.validationErrorMessages['name'] ?? 'الاسم لا يمكن أن يكون فارغاً';
        }
        if (hasDigits) {
          return widget.validationErrorMessages['nameInvalid'] ?? 'الاسم لا يمكن أن يحتوي على أرقام';
        }
        break;

      case 'password':
        if (value.length < 3) {
          return widget.validationErrorMessages['password'] ?? 'كلمة المرور يجب أن تحتوي على ثلاث أحرف على الأقل';
        }
        break;

      case 'phone':
        final phoneRegex = RegExp(r'^\d{8,}$');
        if (value.isEmpty) {
          return widget.validationErrorMessages['phone'] ?? 'رقم الهاتف لا يمكن أن يكون فارغاً';
        }
        if (!phoneRegex.hasMatch(value)) {
          return widget.validationErrorMessages['phoneInvalid'] ?? 'رقم الهاتف يجب أن يحتوي على ثمانية أرقام على الأقل';
        }
        break;
      case 'cvc':
        final phoneRegex = RegExp(r'^\d{3,}$');
        if (value.isEmpty) {
          return widget.validationErrorMessages['phone'] ?? 'Hata';
        }
        if (!phoneRegex.hasMatch(value)) {
          return widget.validationErrorMessages['phoneInvalid'] ?? '3 rakam olması gerekyor';
        }
        break;

      default:
        return widget.validationErrorMessages['default'] ?? 'نوع التحقق غير مدعوم';
    }
    return null; // إذا لم يكن هناك خطأ
  }
}