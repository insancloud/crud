import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../env.sample.dart';
import '../widgets/form.dart';

class Create extends StatefulWidget {
  final Function? refreshStudentList;

  const Create({super.key, this.refreshStudentList});

  @override
  // ignore: library_private_types_in_public_api
  _CreateState createState() => _CreateState();
}

class _CreateState extends State<Create> {
  // Required for form validations
  final formKey = GlobalKey<FormState>();

  // Handles text onchange
  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();

  // Http post request to create new data
  Future _createStudent() async {
    return await http.post(
      Uri.parse("${Env.URL_PREFIX}/create.php"),
      body: {
        "name": nameController.text,
        "age": ageController.text,
      },
    );
  }

  void _onConfirm(context) async {
    await _createStudent();

    // Remove all existing routes until the Home.dart, then rebuild Home.
    Navigator.of(context)
        .pushNamedAndRemoveUntil('/', (Route<dynamic> route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create"),
      ),
      bottomNavigationBar: BottomAppBar(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            // color: Colors.blue,
          // textColor: Colors.white,
          backgroundColor: Colors.blue,

          ),
          onPressed: () {
            if (formKey.currentState!.validate()) {
              _onConfirm(context);
            }
          },
          child: const Text("CONFIRM"),
        ),
      ),
      body: Container(
        height: double.infinity,
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: AppForm(
              formKey: formKey,
              nameController: nameController,
              ageController: ageController,
            ),
          ),
        ),
      ),
    );
  }
}
