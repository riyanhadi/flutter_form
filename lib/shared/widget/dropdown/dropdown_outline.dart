import 'package:flutter/material.dart';

class QDropdownField extends StatefulWidget {
  final String label;
  final String? hint;
  final List<Map<String, dynamic>> items;
  final String? Function(Map<String, dynamic>? value)? validator;
  final dynamic value;
  final bool emptyMode;
  final Function(dynamic value, String? label) onChanged;

  const QDropdownField({
    Key? key,
    required this.label,
    required this.items,
    required this.onChanged,
    this.value,
    this.validator,
    this.emptyMode = true,
    this.hint,
  }) : super(key: key);

  @override
  State<QDropdownField> createState() => _QDropdownFieldState();
}

class _QDropdownFieldState extends State<QDropdownField> {
  List<Map<String, dynamic>> items = [];
  Map<String, dynamic>? selectedValue;

  @override
  void initState() {
    super.initState();

    items = [];
    if (widget.emptyMode) {
      items.add({
        "label": "Pilih",
        "value": "-",
      });
      selectedValue = {
        "label": "Pilih",
        "value": "-",
      };
    }

    for (var item in widget.items) {
      items.add(item);
    }

    var values = widget.items.where((i) => i["value"] == widget.value).toList();
    if (values.isNotEmpty) {
      selectedValue = values.first;
    }
  }

  setAllItemsToFalse() {
    for (var item in items) {
// item["checked"] = false;
    }
  }

  Map<String, dynamic>? get currentValue {
    if (widget.emptyMode) {
      var foundItems =
          items.where((i) => i["value"] == selectedValue?["value"]).toList();
      if (foundItems.isNotEmpty) {
        return foundItems.first;
      }

      return {
        "label": "Pilih",
        "value": "-",
      };
    }
    return items.first;
  }

  @override
  Widget build(BuildContext context) {
    return FormField(
      initialValue: false,
      validator: (value) {
        if (widget.validator != null) {
          if (widget.emptyMode && selectedValue?["value"] == "-") {
            return widget.validator!(null);
          }
          return widget.validator!(selectedValue);
        }
        return null;
      },
      enabled: true,
      builder: (FormFieldState<bool> field) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.label,
              style: const TextStyle(
                fontSize: 16.0,
              ),
            ),
            const SizedBox(
              height: 5.0,
            ),
            DropdownButtonFormField<Map<String, dynamic>>(
              isExpanded: true,
              value: currentValue,
              iconSize: 36,
              elevation: 16,
              decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                contentPadding: const EdgeInsets.only(
                    top: 2.0, bottom: 2.0, left: 12.0, right: 4.0),
                enabledBorder: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                  borderSide: BorderSide(
                      color: Colors.grey.withOpacity(0.5), width: 1.0),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  borderSide: BorderSide(color: Colors.blue, width: 1.0),
                ),
                errorBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  borderSide: BorderSide(color: Colors.red, width: 1.0),
                ),
              ),
              onChanged: (Map<String, dynamic>? newValue) {
                if (widget.emptyMode && newValue?["value"] == "-") {
                  selectedValue = {
                    "label": "Pilih",
                    "value": "-",
                  };
                } else {
                  selectedValue = newValue!;
                }
                setState(() {});

                var label = selectedValue!["label"];
                var value = selectedValue!["value"];
                widget.onChanged(value, label);
              },
              items: List.generate(
                items.length,
                (index) {
                  var item = items[index];
                  return DropdownMenuItem<Map<String, dynamic>>(
                    value: item,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 0.0,
                        vertical: 0.0,
                      ),
                      child: Text(
                        item["label"],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
