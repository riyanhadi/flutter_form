import 'package:flutter/material.dart';

class QRadioButton<T> extends StatefulWidget {
  final String label;
  final List<QRadioButtonOption<T>> options;
  final T? value;
  final void Function(T value)? onChanged;

  const QRadioButton({
    Key? key,
    required this.label,
    required this.options,
    this.value,
    this.onChanged,
  }) : super(key: key);

  @override
  _QRadioButtonState<T> createState() => _QRadioButtonState<T>();
}

class _QRadioButtonState<T> extends State<QRadioButton<T>> {
  late T _value;

  @override
  void initState() {
    super.initState();
    _value = widget.value ?? widget.options.first.value;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16.0,
          ),
        ),
        const SizedBox(height: 8.0),
        Wrap(
          children: List.generate(
            widget.options.length,
            (index) {
              var option = widget.options[index];
              return Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Radio<T>(
                    value: option.value,
                    groupValue: _value,
                    onChanged: (value) {
                      setState(() {
                        _value = value!;
                        widget.onChanged?.call(value);
                      });
                    },
                  ),
                  Text(option.label),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}

class QRadioButtonOption<T> {
  final String label;
  final T value;

  const QRadioButtonOption({
    required this.label,
    required this.value,
  });
}
