import 'package:dio/dio.dart';
import 'package:todo_app/models/todo_items.dart';

class NetworkManager {
  late final Dio _dio;
  final baseUrl = 'https://3b3e-103-144-175-53.ngrok-free.app';
  NetworkManager() {
    _dio = Dio();
  }

  // function buat ambil data to do yg sudah selesai
  Future<List<ToDoItem>> getToDoIsDone(bool isDone) async {
    final result = await _dio.get(
      '$baseUrl/todos?isDone=$isDone',
    );

    return (result.data as List).map((e) => ToDoItem.fromMap(e)).toList();
  }

  // function buat create data
  Future<ToDoItem> postData(ToDoItem item) async {
    final result = await _dio.post(
      '$baseUrl/todos',
      data: item.toMap(),
    );

    return ToDoItem.fromMap(result.data);
  }

  // function buat update data
  Future<ToDoItem> updateData(ToDoItem item) async {
    final result = await _dio.put(
      '$baseUrl/todos/${item.id}',
      data: item.toMap(),
    );

    return ToDoItem.fromMap(result.data);
  }

  // function buat delete data
  Future<void> deleteData(ToDoItem item) async {
    await _dio.delete(
      '$baseUrl/todos/${item.id}',
      data: item.toMap(),
    );
  }
}