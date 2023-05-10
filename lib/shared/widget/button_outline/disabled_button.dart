// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OutlineDisabledButton extends StatefulWidget {
  final String label;
  final Function onPressed;

  const OutlineDisabledButton(
      {Key? key, required this.label, required this.onPressed})
      : super(key: key);

  @override
  OutlineDisabledButtonState createState() => OutlineDisabledButtonState();
}

class OutlineDisabledButtonState extends State<OutlineDisabledButton> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 42,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          backgroundColor: _isPressed ? const Color(0xff86c1ff) : Colors.white,
          foregroundColor: const Color(0xff86b0ff),
          side: const BorderSide(
            color: Color(0xff86c1ff),
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
            color: _isPressed ? Colors.white : const Color(0xff86c1ff),
          ),
        ),
      ),
    );
  }
}
