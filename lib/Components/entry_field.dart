import 'package:flutter/material.dart';
import 'package:shifftie/Theme/colors.dart';
import 'package:shifftie/utilities/utilities.dart';

class EntryField extends StatelessWidget {
  final TextEditingController? controller;
  final String? label;
  final String? initialValue;
  final bool? readOnly;
  final TextInputType? keyboardType;
  final int? maxLength;
  final int? maxLines;
  final String? hint;
  final Widget? prefix;
  final Widget? suffixIcon;
  final Function? onTap;
  final TextCapitalization? textCapitalization;
  final Color? fillColor;
  final EdgeInsets? padding;
  final Widget? counter;

  const EntryField({
    Key? key,
    this.controller,
    this.label,
    this.initialValue,
    this.readOnly,
    this.keyboardType,
    this.maxLength,
    this.hint,
    this.prefix,
    this.maxLines,
    this.suffixIcon,
    this.onTap,
    this.textCapitalization,
    this.fillColor,
    this.padding,
    this.counter,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? const EdgeInsets.symmetric(vertical: 4.0),
      child: TextFormField(
        style: TextStyle(color: secondaryColor),
        enableInteractiveSelection: false,
        textCapitalization: textCapitalization ?? TextCapitalization.sentences,
        cursorColor: mainColor,
        onTap: onTap as void Function()?,
        autofocus: false,
        controller: controller,
        initialValue: initialValue,
        readOnly: readOnly ?? false,
        keyboardType: keyboardType,
        minLines: 1,
        maxLength: maxLength,
        maxLines: maxLines,
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(22.0),
            filled: true,
            fillColor: fillColor ?? textFieldColor,
            prefixIcon: prefix,
            suffixIcon: suffixIcon,
            labelText: label,
            labelStyle: Theme.of(context)
                .textTheme
                .subtitle1!
                .copyWith(color: disabledTextColor),
            hintText: hint,
            hintStyle: TextStyle(fontSize: 13.3, color: lightTextColor),
            counter: counter ?? const Offstage(),
            border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius:
                    BorderRadius.all(Radius.circular(Utilities.borderRadius)))),
      ),
    );
  }
}
