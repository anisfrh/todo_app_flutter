import 'package:flutter/material.dart';
import 'package:todo_app/models/todo_items.dart';
import 'package:todo_app/utils/network_manager.dart';

class ToDoWidget extends StatelessWidget {
  const ToDoWidget({
    Key? key,
    required this.toDoItem,
    required this.handleRefresh,
  }) : super(key: key);

  final ToDoItem toDoItem;
  final Function() handleRefresh;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: toDoItem.isDone ? Colors.grey : Colors.white30,
      child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          toDoItem.title,
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.blue.shade900,
                            fontSize: 18,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          toDoItem.description,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                            color: Colors.blue,
                          ),
                        )
                      ]),
                ),
                if (!toDoItem.isDone)
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueGrey,
                    ),
                    onPressed: () async {
                      await NetworkManager()
                          .updateData(toDoItem.copyWith(isDone: true));
                      handleRefresh();
                    },
                    child: const Icon(
                      Icons.check,
                    ),
                  ),
                const SizedBox(width: 10),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.redAccent[300],
                  ),
                  onPressed: () async {
                    await NetworkManager().deleteData(toDoItem);
                    handleRefresh();
                  },
                  child: const Icon(
                    Icons.delete,
                  ),
                ),
              ])),
    );
  }
}