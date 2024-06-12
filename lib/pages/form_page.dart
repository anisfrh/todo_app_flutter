import 'package:flutter/material.dart';
import 'package:todo_app/models/todo_items.dart';
import 'package:todo_app/utils/network_manager.dart';

class FormPage extends StatefulWidget {
  const FormPage({super.key});

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final formKey = GlobalKey<FormState>();
  final titleController = TextEditingController();
  final descController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Make To Do List !',
          style: TextStyle(
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(
          20,
        ),
        width: size.width,
        child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  controller: titleController,
                  decoration: const InputDecoration(hintText: "Title..."),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Title Kosong !";
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 30,
                ),
                TextFormField(
                  controller: descController,
                  decoration: const InputDecoration(hintText: "Description..."),
                  maxLines: 4,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Deskripsi Kosong !";
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () async {
                    final item = ToDoItem(
                        title: titleController.text,
                        description: descController.text,
                        isDone: false);

                    if (item.title.isNotEmpty && item.description.isNotEmpty) {
                      await NetworkManager().postData(item);
                      Navigator.pop(context);
                    }
                  },
                  child: const Text('Save'),
                ),
              ],
            )),
      ),
    );
  }
}