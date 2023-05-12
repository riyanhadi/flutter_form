import 'package:flutter/material.dart';
import 'package:flutter_form/core.dart';
import 'package:flutter_form/shared/widget/button/danger_button.dart';
import 'package:flutter_form/shared/widget/button/disabled_button.dart';
import 'package:flutter_form/shared/widget/button/info_button.dart';
import 'package:flutter_form/shared/widget/button/primary_button.dart';
import 'package:flutter_form/shared/widget/button/secondary_button.dart';
import 'package:flutter_form/shared/widget/button/success_button.dart';
import 'package:flutter_form/shared/widget/button/warning_button.dart';
import 'package:flutter_form/shared/widget/button_outline/danger_button.dart';
import 'package:flutter_form/shared/widget/button_outline/disabled_button.dart';
import 'package:flutter_form/shared/widget/button_outline/info_button.dart';
import 'package:flutter_form/shared/widget/button_outline/primary_button.dart';
import 'package:flutter_form/shared/widget/button_outline/secondary_button.dart';
import 'package:flutter_form/shared/widget/button_outline/success_button.dart';
import 'package:flutter_form/shared/widget/button_outline/warning_button.dart';
import 'package:flutter_form/shared/widget/checkfield/checkfiled.dart';
import 'package:flutter_form/shared/widget/dropdown/dropdown_outline.dart';
import 'package:flutter_form/shared/widget/image_picker/image_picker.dart';
import 'package:flutter_form/shared/widget/radiofield/radiofield.dart';
import 'package:flutter_form/shared/widget/textfield/textarea.dart';
import 'package:flutter_form/shared/widget/textfield/textfield_number_outline.dart';
import 'package:flutter_form/shared/widget/textfield/textfield_outline.dart';
import 'package:flutter_form/shared/widget/textfield/textfield_password.dart';
import '../controller/latihan_controller.dart';

class LatihanView extends StatefulWidget {
  const LatihanView({Key? key}) : super(key: key);

  Widget build(context, LatihanController controller) {
    controller.view = this;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Teras UI KIT"),
        actions: const [],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Button",
                style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                height: 8.0,
              ),
              SuccessButton(
                label: "Success",
                onPressed: () {},
              ),
              const SizedBox(
                height: 10.0,
              ),
              DangerButton(
                label: "Danger",
                onPressed: () {},
              ),
              const SizedBox(
                height: 10.0,
              ),
              WarningButton(
                label: "Warning",
                onPressed: () {},
              ),
              const SizedBox(
                height: 10.0,
              ),
              InfoButton(
                label: "Info",
                onPressed: () {},
              ),
              const SizedBox(
                height: 10.0,
              ),
              DisabledButton(
                label: "Disabled",
                onPressed: () {},
              ),
              const SizedBox(
                height: 10.0,
              ),
              PrimaryButton(
                label: "Primary",
                onPressed: () {},
              ),
              const SizedBox(
                height: 10.0,
              ),
              SecondaryButton(
                label: "Secondary",
                onPressed: () {},
              ),
              const SizedBox(
                height: 20.0,
              ),
              const Text(
                "Button Outline",
                style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                height: 8.0,
              ),
              OutlineSuccessButton(
                label: "Success",
                onPressed: () {},
              ),
              const SizedBox(
                height: 10.0,
              ),
              OutlineDangerButton(
                label: "Danger",
                onPressed: () {},
              ),
              const SizedBox(
                height: 10.0,
              ),
              OutlineWarningButton(
                label: "Warning",
                onPressed: () {},
              ),
              const SizedBox(
                height: 10.0,
              ),
              OutlineInfoButton(
                label: "Info",
                onPressed: () {},
              ),
              const SizedBox(
                height: 10.0,
              ),
              OutlineDisabledButton(
                label: "Disabled",
                onPressed: () {},
              ),
              const SizedBox(
                height: 10.0,
              ),
              OutlinePrimaryButton(
                label: "Primary",
                onPressed: () {},
              ),
              const SizedBox(
                height: 10.0,
              ),
              OutlineSecondaryButton(
                label: "Secondary",
                onPressed: () {},
              ),
              const SizedBox(
                height: 20.0,
              ),
              const Text(
                "Form",
                style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                height: 8.0,
              ),
              QTextField(
                label: "Nama",
                // validator: Validator.required,
                value: "",
                onChanged: (value) {},
              ),
              const SizedBox(
                height: 10.0,
              ),
              QNumberField(
                label: "Umur",
                // validator: Validator.required,
                value: "",
                onChanged: (value) {},
              ),
              const SizedBox(
                height: 5.0,
              ),
              QPasswordField(
                label: "",
                hint: "Password",
                // validator: Validator.required,
                value: "",
                onChanged: (value) {},
              ),
              const SizedBox(
                height: 20.0,
              ),
              QMemoField(
                label: "Address",
                hint: "Your addresses",
                // validator: Validator.required,
                value: "Kamboja street 16, Bogor, West Java, Indonesia",
                onChanged: (value) {},
              ),
              const SizedBox(
                height: 10.0,
              ),
              QDropdownField(
                label: "Roles",
                // validator: Validator.required,
                items: const [
                  {
                    "label": "Admin",
                    "value": 1,
                  },
                  {
                    "label": "Staff",
                    "value": 2,
                  }
                ],
                onChanged: (value, label) {},
              ),
              const SizedBox(
                height: 10.0,
              ),
              QCheckField(
                label: "Club",
                // validator: Validator.atLeastOneitem,
                items: const [
                  {
                    "label": "Persib",
                    "value": 101,
                    "checked": false,
                  },
                  {
                    "label": "Persikabo",
                    "value": 102,
                    "checked": true,
                  }
                ],
                onChanged: (values, ids) {},
              ),
              const SizedBox(
                height: 10.0,
              ),
              QRadioButton<String>(
                label: 'Jenis Kelamin',
                options: const [
                  QRadioButtonOption(label: 'Laki-laki', value: 'L'),
                  QRadioButtonOption(label: 'Perempuan', value: 'P'),
                ],
                value: 'L',
                onChanged: (value) {},
              ),
              const SizedBox(
                height: 10.0,
              ),
              QImagePicker(
                label: "Photo",
                hint: "Your photo",
                // validator: Validator.required,
                value: null,
                onChanged: (value) {},
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  State<LatihanView> createState() => LatihanController();
}
