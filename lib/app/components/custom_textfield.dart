import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextInputField extends StatefulWidget {
  const CustomTextInputField({
    this.onTap,
    this.ispassword = false,
    this.fieldlabel,this.prefixIcon,
    this.maxlines,
    this.textinputtype,
    this.maxlength,
    this.fieldcurve,
    this.bordercolor,
    this.topmargin,
    this.controller,
    this.isEmail = false,
    this.onChanged,
    this.isEnabled,
    this.autofocus,
    this.readOnly = false,
    this.filled = false,
    this.labelText,
    this.minLines,
    this.filledColor = const Color(0xffF2F4F7),
    required this.errorText,
    this.textCapitalization,this.floatingLabelBehavior,
    this.suffixIcon,
    Key? key,
  }) : super(key: key);

  final Function()? onTap;
  final Function(String value)? onChanged;
  final bool ispassword;
  final bool isEmail;
  final FloatingLabelBehavior? floatingLabelBehavior;
  final bool? isEnabled;
  final String? fieldlabel;
  final String? labelText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;

  final TextInputType? textinputtype;
  final int? maxlines;
  final int? minLines;
  final int? maxlength;
  final double? fieldcurve;
  final double? topmargin;
  final Color? bordercolor;
  final bool? autofocus;
  final TextEditingController? controller;
  final TextCapitalization? textCapitalization;
  final String? errorText;
  final bool readOnly;
  final bool filled;
  final Color filledColor;
  @override
  State<CustomTextInputField> createState() => _CustomTextInputFieldState();
}

class _CustomTextInputFieldState extends State<CustomTextInputField> {
  bool showpassword = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: widget.topmargin ?? 10),
      child: TextField(
        autofocus: widget.autofocus ?? false,
        readOnly: widget.readOnly,
        enabled: widget.isEnabled,
        maxLines: widget.maxlines ?? 1,
        minLines: widget.minLines,
        maxLength: widget.maxlength,
        controller: widget.controller,
        onChanged: widget.onChanged ?? (value) {},
        obscureText: widget.ispassword ? showpassword : false,
        keyboardType: widget.textinputtype ?? TextInputType.text,
        style: GoogleFonts.blinker(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          // fontFamily: 'Microgamma',
          color: Color(0xff1D2939),
        ),
        textCapitalization:
            widget.textCapitalization ?? TextCapitalization.none,
        decoration: InputDecoration(
          floatingLabelBehavior: widget.floatingLabelBehavior,
          filled: widget.filled,
          labelText: widget.labelText,
          fillColor: widget.filledColor,
          prefixIcon: widget.prefixIcon,
          suffixIcon: widget.suffixIcon,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 10,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              width: 1,
              color: widget.bordercolor ?? Color(0xff98A2B3),
            ),
            borderRadius: BorderRadius.circular(widget.fieldcurve ?? 10),
          ),
          disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              width: 1,
              color: widget.bordercolor ?? Color(0xff98A2B3),
            ),
            borderRadius: BorderRadius.circular(widget.fieldcurve ?? 10),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              width: 1,
              color: widget.bordercolor ?? Color(0xff98A2B3),
            ),
            borderRadius: BorderRadius.circular(widget.fieldcurve ?? 10),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              width: 1,
              color: widget.bordercolor ?? Color(0xff98A2B3),
            ),
            borderRadius: BorderRadius.circular(widget.fieldcurve ?? 10),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              width: 1,
              color: widget.bordercolor ?? Color(0xff98A2B3),
            ),
            borderRadius: BorderRadius.circular(widget.fieldcurve ?? 10),
          ),
          errorText: widget.errorText,
          suffix: widget.ispassword
              ? IconButton(
                  padding: const EdgeInsets.symmetric(vertical: 0),
                  constraints: const BoxConstraints(),
                  iconSize: 20,
                  color: Color(0xff98A2B3),
                  onPressed: () {
                    setState(() {
                      showpassword = !showpassword;
                    });
                  },
                  icon: !showpassword
                      ? const Icon(
                    Icons.visibility,
                        )
                      : const Icon(
                          Icons.visibility_off,
                        ),
                )
              : widget.isEmail
                  ? SizedBox(
                      child: widget.errorText != null
                          ? const Icon(
                              Icons.warning_amber,
                              color: Color(0xffD92D20),
                            )
                          : const SizedBox(),
                    )
                  : const SizedBox(),
          hintText: widget.fieldlabel ?? '',
          hintStyle: GoogleFonts.blinker(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            // fontFamily: 'Microgamma',
            color: Color(0xff1D2939),
          ),
        ),
      ),
    );
  }
}
