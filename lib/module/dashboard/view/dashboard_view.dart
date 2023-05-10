import 'package:flutter/material.dart';
import 'package:flutter_form/core.dart';
import 'package:flutter_form/shared/util/validator/validator.dart';
import 'package:flutter_form/shared/widget/checkfield/checkfiled.dart';
import 'package:flutter_form/shared/widget/datefield/datefield.dart';
import 'package:flutter_form/shared/widget/dropdown/dropdown.dart';
import 'package:flutter_form/shared/widget/image_picker/image_picker.dart';
import 'package:flutter_form/shared/widget/textfield/textfield.dart';
import '../controller/dashboard_controller.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({Key? key}) : super(key: key);

  Widget build(context, DashboardController controller) {
    controller.view = this;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Dashboard"),
        actions: const [],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(15.0),
          child: Form(
            key: controller.formKey,
            child: Column(
              children: [
                //form_
                // QTextField(
                //   label: "Name",
                //   hint: "Name",
                //   // validator: Validator.required,
                //   value: "John Doe",
                //   onChanged: (value) {},
                // ),
                // QDatePicker(
                //   label: "Birth date",
                //   hint: "Your birth date",
                //   // validator: Validator.required,
                //   onChanged: (value) {
                //     print("value: $value");
                //   },
                // ),
                // QDropdownField(
                //   label: "Roles",
                //   hint: "Your roles",
                //   // validator: Validator.required,
                //   items: const [
                //     {
                //       "label": "Admin",
                //       "value": 1,
                //     },
                //     {
                //       "label": "Staff",
                //       "value": 2,
                //     }
                //   ],
                //   onChanged: (value, label) {},
                // ),
                // QImagePicker(
                //   label: "Photo",
                //   hint: "Your photo",
                //   // validator: Validator.required,
                //   value: null,
                //   onChanged: (value) {
                //     print("value: $value");
                //   },
                // ),
                // QCheckField(
                //   label: "Club",
                //   hint: "Your favorite football club",
                //   // validator: Validator.atLeastOneitem,
                //   items: const [
                //     {
                //       "label": "Persib",
                //       "value": 101,
                //       "checked": false,
                //     },
                //     {
                //       "label": "Persikabo",
                //       "value": 102,
                //       "checked": true,
                //     }
                //   ],
                //   onChanged: (values, ids) {},
                // ),
                QTextField(
                  label: "Name",
                  hint: "Name",
                  // validator: (value) {
                  //   if (value!.isEmpty) {
                  //     return 'Please enter your email';
                  //   } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                  //       .hasMatch(value)) {
                  //     return 'Please enter a valid email';
                  //   }
                  //   return null;
                  // },
                  validator: Validator.required,
                  value: "John Doe",
                  onChanged: (value) {},
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueGrey,
                  ),
                  onPressed: () {
                    bool isValid = controller.formKey.currentState!.validate();
                    if (isValid) {
                      return;
                    }
                  },
                  child: const Text("Save"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  State<DashboardView> createState() => DashboardController();
}
