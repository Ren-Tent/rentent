import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:lottie/lottie.dart';

import '../../widgets/constants.dart';
import '../../widgets/empty_widget.dart';

class AuthTextInput extends StatelessWidget {
  const AuthTextInput({
    Key? key,
    required this.isFocused,
    required this.focusNode,
    required this.prefixIcon,
    this.suffixIcon,
    required this.hintText,
    this.label,
    required this.obscureText,
    required this.controller,
    this.onTap,
    this.validator,
    this.keyboardType,
    this.textCapitalization,
    this.onSaved,
    required this.isEnabled,
    this.autovalidateMode,
  }) : super(key: key);
  final bool isFocused;
  final FocusNode focusNode;
  final String prefixIcon;
  final String? suffixIcon;
  final String hintText;
  final Widget? label;
  final bool obscureText;
  final TextEditingController controller;
  final void Function()? onTap;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final TextCapitalization? textCapitalization;
  final void Function(String?)? onSaved;
  final bool isEnabled;
  final AutovalidateMode? autovalidateMode;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Container(
          height: 60,
          alignment: AlignmentDirectional.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            color: Theme.of(context).brightness == Brightness.light
                ? isFocused
                    ? kLightFocused
                    : kLightUnFocused
                : isFocused
                    ? kDarkFocused
                    : kDarkUnFocused,
          ),
          child: TextFormField(
            focusNode: focusNode,
            obscureText: obscureText,
            enabled: isEnabled,
            controller: controller,
            validator: validator,
            autovalidateMode: autovalidateMode,
            keyboardType: keyboardType,
            textCapitalization: textCapitalization == null
                ? TextCapitalization.none
                : textCapitalization!,
            onSaved: onSaved,
            decoration: InputDecoration(
              border: InputBorder.none,
              label: label,
              hintText: hintText,
              prefixIcon: Padding(
                padding: const EdgeInsets.only(right: 20, left: 20),
                child: SvgPicture.asset(
                  'assets/icons/$prefixIcon',
                  colorFilter: ColorFilter.mode(
                    isFocused ? kPrimaryColor : kGreyColor,
                    BlendMode.srcIn,
                  ),
                ),
              ),
              suffixIcon: suffixIcon == null
                  ? const SizedBox.shrink()
                  : IconButton(
                      onPressed: onTap,
                      icon: Padding(
                        padding: const EdgeInsets.only(right: 20, left: 20),
                        child: SvgPicture.asset(
                          'assets/icons/$suffixIcon',
                          colorFilter: ColorFilter.mode(
                            isFocused ? kPrimaryColor : kGreyColor,
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
                    ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: const BorderSide(color: kPrimaryColor),
              ),
            ),
          ),
        ),
      );
    });
  }
}

class SearchTextField extends StatelessWidget {
  const SearchTextField({
    Key? key,
    required this.isFocused,
    required this.focusNode,
    required this.prefixIcon,
    required this.hintText,
    required this.controller,
    // this.validator,
    // required this.onChanged,
    // required this.selectedItem,
    // required this.asyncItems,
  }) : super(key: key);
  final bool isFocused;
  final FocusNode focusNode;
  final String prefixIcon;

  final String hintText;
  final TextEditingController controller;
  // final String? Function(Drug?)? validator;
  // final void Function(Drug?)? onChanged;
  // final Drug selectedItem;
  // final Future<List<Drug>> Function(String)? asyncItems;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Container(
          height: 60,
          alignment: AlignmentDirectional.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            color: Theme.of(context).brightness == Brightness.light
                ? isFocused
                    ? kLightFocused
                    : kLightUnFocused
                : isFocused
                    ? kDarkFocused
                    : kDarkUnFocused,
          ),
          child: DropdownSearch(
            dropdownButtonProps: DropdownButtonProps(
              onPressed: () {},
              icon: SvgPicture.asset(
                'assets/icons/filter.svg',
                colorFilter: const ColorFilter.mode(
                  kPrimaryColor,
                  BlendMode.srcIn,
                ),
              ),
            ),
            popupProps: PopupProps.dialog(
              showSearchBox: true,
              searchFieldProps: TextFieldProps(
                controller: controller,
                focusNode: focusNode,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: hintText,
                  prefixIcon: Padding(
                    padding: const EdgeInsets.only(right: 20, left: 20),
                    child: SvgPicture.asset(
                      'assets/icons/$prefixIcon',
                      colorFilter: ColorFilter.mode(
                        isFocused ? kPrimaryColor : kDarkColor,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(color: kPrimaryColor),
                  ),
                ),
              ),
              emptyBuilder: (context, searchEntry) {
                return EmptyWidget(
                  text: '$searchEntry not found!',
                );
              },
              errorBuilder: (context, searchEntry, exception) {
                return Center(
                  child: Column(
                    children: [
                      SvgPicture.asset(
                        "assets/icons/cry_illustration.svg",
                        width: 150,
                      ),
                      Text(
                        '$searchEntry not found!',
                        style: const TextStyle(
                          color: kPrimaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                      Text('$exception'),
                    ],
                  ),
                );
              },
              loadingBuilder: (context, searchEntry) {
                return Lottie.asset(
                  'assets/animations/loading_animation.json',
                  repeat: true,
                );
              },
            ),
            // selectedItem: selectedItem,
            dropdownDecoratorProps: DropDownDecoratorProps(
              dropdownSearchDecoration: InputDecoration(
                border: InputBorder.none,
                hintText: hintText,
                prefixIcon: Padding(
                  padding: const EdgeInsets.only(right: 20, left: 20),
                  child: SvgPicture.asset(
                    'assets/icons/$prefixIcon',
                    colorFilter: ColorFilter.mode(
                      isFocused ? kPrimaryColor : kDarkColor,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: const BorderSide(color: kPrimaryColor),
                ),
              ),
            ),
            // asyncItems: asyncItems,
            // onChanged: onChanged,
          ),
        ),
      );
    });
  }
}

class TextInput extends StatelessWidget {
  const TextInput({
    Key? key,
    required this.isFocused,
    required this.focusNode,
    required this.hintText,
    required this.label,
    required this.controller,
    this.validator,
    this.keyboardType,
    this.textCapitalization,
    this.onSaved,
    this.onChanged,
  }) : super(key: key);
  final bool isFocused;
  final FocusNode focusNode;
  final String hintText;
  final Widget label;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final TextCapitalization? textCapitalization;
  final void Function(String?)? onSaved;
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        height: 60,
        alignment: AlignmentDirectional.center,
        // padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: Theme.of(context).brightness == Brightness.light
              ? isFocused
                  ? kLightFocused
                  : kLightUnFocused
              : isFocused
                  ? kDarkFocused
                  : kDarkUnFocused,
        ),
        child: TextFormField(
          focusNode: focusNode,
          controller: controller,
          validator: validator,
          keyboardType: keyboardType,
          textCapitalization: textCapitalization == null
              ? TextCapitalization.none
              : textCapitalization!,
          onSaved: onSaved,
          onChanged: onChanged,
          decoration: InputDecoration(
            border: InputBorder.none,
            contentPadding: const EdgeInsets.symmetric(horizontal: 20),
            label: label,
            hintText: hintText,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(color: kPrimaryColor),
              gapPadding: 5,
            ),
          ),
        ),
      ),
    );
  }
}

class AuthPhoneInput extends StatelessWidget {
  const AuthPhoneInput({
    Key? key,
    required this.isFocused,
    required this.focusNode,
    this.validator,
    required this.phoneNumber,
    required this.onInputChanged,
    required this.prefixIcon,
    required this.hintText,
    this.label,
    required this.isEnabled,
  }) : super(key: key);
  final bool isFocused;
  final FocusNode focusNode;
  final String? Function(String?)? validator;
  final PhoneNumber phoneNumber;
  final void Function(PhoneNumber)? onInputChanged;
  final String prefixIcon;
  final String hintText;
  final Widget? label;
  final bool isEnabled;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        height: 60,
        alignment: AlignmentDirectional.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: Theme.of(context).brightness == Brightness.light
              ? isFocused
                  ? kLightFocused
                  : kLightUnFocused
              : isFocused
                  ? kDarkFocused
                  : kDarkUnFocused,
        ),
        child: InternationalPhoneNumberInput(
          selectorConfig: const SelectorConfig(
            selectorType: PhoneInputSelectorType.DIALOG,
            leadingPadding: 20,
            trailingSpace: false,
          ),
          isEnabled: isEnabled,
          formatInput: true,
          initialValue: phoneNumber,
          focusNode: focusNode,
          validator: validator,
          inputDecoration: InputDecoration(
            border: InputBorder.none,
            label: label,
            hintText: hintText,
            prefixIcon: Padding(
              padding: const EdgeInsets.only(right: 20, left: 20),
              child: SvgPicture.asset(
                'assets/icons/$prefixIcon',
                colorFilter: ColorFilter.mode(
                  isFocused ? kPrimaryColor : kDarkLightColor,
                  BlendMode.srcIn,
                ),
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(color: kPrimaryColor),
            ),
          ),
          keyboardType: TextInputType.phone,
          onInputChanged: onInputChanged,
        ),
      ),
    );
  }
}

class DateTimeTextInput extends StatelessWidget {
  const DateTimeTextInput({
    Key? key,
    required this.isFocused,
    required this.focusNode,
    required this.prefixIcon,
    this.suffixIcon,
    required this.hintText,
    this.label,
    required this.obscureText,
    required this.controller,
    required this.onTap,
    this.validator,
    this.keyboardType,
    this.textCapitalization,
    this.onSaved,
    required this.isEnabled,
  }) : super(key: key);
  final bool isFocused;
  final FocusNode focusNode;
  final String prefixIcon;
  final String? suffixIcon;
  final String hintText;
  final Widget? label;
  final bool obscureText;
  final TextEditingController controller;
  final void Function() onTap;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final TextCapitalization? textCapitalization;
  final void Function(String?)? onSaved;
  final bool isEnabled;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 10,
        ),
        child: Container(
          height: 60,
          alignment: AlignmentDirectional.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            color: Theme.of(context).brightness == Brightness.light
                ? isFocused
                    ? kLightFocused
                    : kLightUnFocused
                : isFocused
                    ? kDarkFocused
                    : kDarkUnFocused,
          ),
          child: TextFormField(
            focusNode: focusNode,
            obscureText: obscureText,
            enabled: isEnabled,
            controller: controller,
            validator: validator,
            keyboardType: keyboardType,
            onTap: onTap,
            readOnly: true,
            textCapitalization: textCapitalization == null
                ? TextCapitalization.none
                : textCapitalization!,
            onSaved: onSaved,
            decoration: InputDecoration(
              border: InputBorder.none,
              label: label,
              hintText: hintText,
              prefixIcon: Padding(
                padding: const EdgeInsets.only(right: 20, left: 20),
                child: SvgPicture.asset(
                  'assets/icons/$prefixIcon',
                  colorFilter: ColorFilter.mode(
                    isFocused ? kPrimaryColor : kDarkLightColor,
                    BlendMode.srcIn,
                  ),
                ),
              ),
              suffixIcon: suffixIcon == null
                  ? const SizedBox.shrink()
                  : IconButton(
                      onPressed: onTap,
                      icon: Padding(
                        padding: const EdgeInsets.only(right: 20, left: 20),
                        child: SvgPicture.asset('assets/icons/$suffixIcon'),
                      ),
                    ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: const BorderSide(color: kPrimaryColor),
              ),
            ),
          ),
        ),
      );
    });
  }
}
