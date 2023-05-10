import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class QNumberField extends StatefulWidget {
  final String label;
  final String? value;
  final String? hint;
  final String? Function(String?)? validator;
  final Function(String) onChanged;
  final Function(String)? onSubmitted;

  final String? pattern;
  final String? locale;

  const QNumberField({
    Key? key,
    required this.label,
    this.value,
    this.validator,
    this.hint,
    required this.onChanged,
    this.onSubmitted,
    this.pattern,
    this.locale = "en_US",
  }) : super(key: key);

  @override
  State<QNumberField> createState() => _QNumberFieldState();
}

class _QNumberFieldState extends State<QNumberField> {
  String? value;
  late TextEditingController controller;

  @override
  void initState() {
    super.initState();

    RegExp r = RegExp(r'^[0-9]+(.[0-9]+)?$');
    value = widget.value?.replaceAll(RegExp(r'^[0-9,]+$'), '');
    controller = TextEditingController(
      text: formattedValue,
    );
  }

  String? get formattedValue {
    if (widget.pattern != null) {
      final currencyFormat = NumberFormat(widget.pattern, widget.locale);
      var pValue = num.tryParse(value.toString()) ?? 0;
      print("pValue: $pValue");
      return currencyFormat.format(pValue);
    }
    return value;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            widget.label,
            style: const TextStyle(
              fontSize: 16.0,
            ),
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.7,
          child: Theme(
            data: Theme.of(context).copyWith(
              colorScheme: ThemeData().colorScheme.copyWith(
                    primary: const Color(0xff8950fc),
                  ),
            ),
            child: TextFormField(
              cursorColor: const Color(0xff8950fc),
              controller: controller,
              validator: widget.validator,
              // maxLength: 20,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 20.0),
                enabledBorder: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(Radius.circular(15.0)),
                  borderSide: BorderSide(
                      color: Colors.grey.withOpacity(0.5), width: 1.0),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15.0)),
                  borderSide: BorderSide(color: Color(0xff8950fc), width: 2.0),
                ),
                prefixIcon: const Icon(
                  Icons.numbers,
                ),
                focusColor: const Color(0xff8950fc),
                // helperText: widget.hint,
              ),
              onChanged: (newValue) {
                var newValue = controller.text;
                print("newValue: $newValue");

                value = newValue.replaceAll(RegExp(r'[^0-9.]'), '');

                print("value: $value");
                controller.text = formattedValue ?? "";
                controller.selection =
                    TextSelection.collapsed(offset: controller.text.length);

                widget.onChanged(newValue.replaceAll(RegExp(r'D'), ''));
              },
              onFieldSubmitted: (newValue) {
                var newValue = controller.text;
                print("newValue: $newValue");

                value = newValue.replaceAll(RegExp(r'[^0-9.]'), '');

                print("value: $value");
                controller.text = formattedValue ?? "";
                controller.selection =
                    TextSelection.collapsed(offset: controller.text.length);

                if (widget.onSubmitted != null) {
                  widget.onSubmitted!(newValue.replaceAll(RegExp(r'D'), ''));
                }
              },
            ),
          ),
        ),
      ],
    );
  }
}
