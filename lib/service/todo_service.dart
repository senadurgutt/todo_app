import 'dart:convert';
import 'package:todo_app/model/todo.dart';
import "package:http/http.dart" as http;

class TodoService {
  //apiden veri alır
  final String url = "https://dummyjson.com/todos/";

  Future<List> getTodos() async {
    // API’den todo listesi çeker ve Todo nesneleri oluşturur

    final response = await http.get(Uri.parse(url));
    //API’ye istek atar (verileri çeker)
    // response → API’den gelen cevabı saklar
    // await → API’den gelen veriyi bekler
    List<dynamic> resp = jsonDecode(response.body)["todos"];
    // jsonDecode(response.body) → API’den gelen JSON verisini Dart nesnesine çevirir.
    // ["todos"] → JSON içindeki "todos" adlı listeyi alır.
    // resp → Çekilen verilerin saklandığı liste.

    List<dynamic> todos = List.empty(growable: true);
    // todos → Boş bir liste oluşturuluyor, içine Todo nesneleri eklenecek.
    // growable: true → Listeyi sonradan genişletebiliriz

    resp.forEach(
      (element) {
        todos.add(Todo.fromJson(element)); //Todo.fromJson(element) → JSON nesnesini Todo nesnesine çevirir.
      },
    );

    return todos;
  }
}
