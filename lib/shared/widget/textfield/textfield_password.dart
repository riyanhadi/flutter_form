import 'package:flutter/material.dart';

class QPasswordField extends StatefulWidget {
  final String? id;
  final String label;
  final String? value;
  final String? hint;
  final String? Function(String?)? validator;
  final bool obscure;
  final bool enabled;
  final int? maxLength;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final Function(String) onChanged;
  final Function(String)? onSubmitted;

  const QPasswordField({
    Key? key,
    required this.label,
    this.id,
    this.value,
    this.validator,
    this.hint,
    this.maxLength,
    required this.onChanged,
    this.onSubmitted,
    this.obscure = true,
    this.enabled = true,
    this.prefixIcon,
    this.suffixIcon,
  }) : super(key: key);

  @override
  State<QPasswordField> createState() => _QPasswordFieldState();
}

class _QPasswordFieldState extends State<QPasswordField> {
  TextEditingController textEditingController = TextEditingController();
  bool isShown = true;

  @override
  void initState() {
    textEditingController.text = widget.value ?? "";
    super.initState();
  }

  @override
  getValue() {
    return textEditingController.text;
  }

  @override
  setValue(value) {
    textEditingController.text = value;
  }

  @override
  resetValue() {
    textEditingController.text = "";
  }

  @override
  focus() {
    focusNode.requestFocus();
  }

  FocusNode focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(
            top: 8,
            left: 25 / 1.8,
          ),
          child: TextFormField(
            enabled: widget.enabled,
            controller: textEditingController,
            focusNode: focusNode,
            validator: widget.validator,
            maxLength: widget.maxLength,
            obscureText: isShown,
            textAlign: TextAlign.center,
            decoration: InputDecoration(
              hintText: widget.hint,
              filled: true,
              fillColor: Colors.greenAccent.withOpacity(0.2),
              isDense: true,
              contentPadding: const EdgeInsets.only(
                left: 44,
              ),
              border: OutlineInputBorder(
                borderSide: const BorderSide(),
                borderRadius: BorderRadius.circular(20.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.grey),
                borderRadius: BorderRadius.circular(20.0),
              ),
              disabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.grey),
                borderRadius: BorderRadius.circular(20.0),
              ),
              suffixIcon: IconButton(
                  icon: isShown
                      ? const Icon(Icons.visibility)
                      : const Icon(Icons.visibility_off),
                  onPressed: () {
                    isShown = !isShown;
                    setState(() {});
                  }),
            ),
            onChanged: (value) {
              widget.onChanged(value);
            },
            onFieldSubmitted: (value) {
              if (widget.onSubmitted != null) widget.onSubmitted!(value);
            },
          ),
        ),
        Transform.translate(
          offset: const Offset(0, 7),
          child: const Align(
            alignment: Alignment.centerLeft,
            child: CircleAvatar(
                radius: 25,
                child: Icon(
                  Icons.key,
                  size: 25,
                )),
          ),
        ),
      ],
    );
  }
}
