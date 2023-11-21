import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../env.sample.dart';
import '../models/student.dart';
import '../widgets/form.dart';

class Edit extends StatefulWidget {
  final Student? student;

  const Edit({super.key, this.student});

  @override
  // ignore: library_private_types_in_public_api
  _EditState createState() => _EditState();
}

class _EditState extends State<Edit> {
  // This is  for form validations
  final formKey = GlobalKey<FormState>();

  // This is for text onChange
  late TextEditingController nameController;
  late TextEditingController ageController;

  // Http post request
  Future editStudent() async {
    return await http.post(
      Uri.parse("${Env.URL_PREFIX}/update.php"),
      body: {
        "id": widget.student!.id.toString(),
        "name": nameController.text,
        "age": ageController.text
      },
    );
  }

  void _onConfirm(context) async {
    await editStudent();
  }

  @override
  void initState() {
    nameController = TextEditingController(text: widget.student!.name);
    ageController = TextEditingController(text: widget.student!.age.toString());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit"),
      ),
      bottomNavigationBar: BottomAppBar(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shadowColor: Colors.blue,
          ),
          child: const Text('CONFIRM'),
          onPressed: () {
            _onConfirm(context);
          },
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
