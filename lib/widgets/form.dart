import 'package:flutter/material.dart';

class AppForm extends StatefulWidget {
  // Required for form validations
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  // Handles text onchange
  TextEditingController nameController;
  TextEditingController ageController;

  AppForm(
      {super.key,
      required this.formKey,
      required this.nameController,
      required this.ageController});

  @override
  // ignore: library_private_types_in_public_api
  _AppFormState createState() => _AppFormState();
}

class _AppFormState extends State<AppForm> {
  String _validateName(String value) {
    if (value.length < 3) return 'Name must be more than 2 charater';
    return null as String;
  }

  String _validateAge(String value) {
    Pattern pattern = r'(?<=\s|^)\d+(?=\s|$)';
    RegExp regex = RegExp(pattern as String);
    if (!regex.hasMatch(value)) return 'Age must be a number';
    return null as String;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      // autovalidate: true,
      child: Column(
        children: <Widget>[
          TextFormField(
            controller: widget.nameController,
            keyboardType: TextInputType.text,
            decoration: const InputDecoration(labelText: 'Name'),
            // validator: _validateName,
          ),
          TextFormField(
            controller: widget.ageController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(labelText: 'Age'),
            // validator: _validateAge,
          ),
        ],
      ),
    );
    ;
  }
}
