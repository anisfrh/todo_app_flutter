import 'package:flutter/material.dart';
import 'package:todo_app/pages/form_page.dart';
import 'package:todo_app/pages/todo_done.dart';

class ToDoPage extends StatefulWidget {
  const ToDoPage({super.key});

  @override
  State<ToDoPage> createState() => _ToDoPageState();
}

class _ToDoPageState extends State<ToDoPage> {
  bool isLoading = false;
  int totalDone = 0;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "ToDo List App",
          style: TextStyle(
            fontWeight: FontWeight.w700,
            color: Colors.black87,
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        width: size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Your To Do List",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context){
                      return const ToDoDonePage();
                    },
                    ));
                  }, 
                  child: Text("List selesai : $totalDone",
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            isLoading ? const Center(
              child: CircularProgressIndicator(),
            )
            : const Expanded(
              child: Center(
                child: Text(
                  "Tidak Ada Data",
                  ),
                ),
              ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.push(context, MaterialPageRoute(
            builder: (context){
            return const FormPage();
          }));
          // refreshData();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
