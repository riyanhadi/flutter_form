// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OutlinePrimaryButton extends StatefulWidget {
  final String label;
  final Function onPressed;

  const OutlinePrimaryButton(
      {Key? key, required this.label, required this.onPressed})
      : super(key: key);

  @override
  OutlinePrimaryButtonState createState() => OutlinePrimaryButtonState();
}

class OutlinePrimaryButtonState extends State<OutlinePrimaryButton> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 42,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          backgroundColor: _isPressed ? const Color(0xff3699ff) : Colors.white,
          foregroundColor: const Color(0xff256bb2),
          side: const BorderSide(
            color: Color(0xff3699ff),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        onPressed: () {
          setState(() {
            _isPressed = !_isPressed;
          });
          widget.onPressed();
        },
        child: Text(
          widget.label,
          style: GoogleFonts.poppins(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: _isPressed ? Colors.white : const Color(0xff3699ff),
          ),
        ),
      ),
    );
  }
}
