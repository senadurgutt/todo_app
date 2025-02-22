import 'dart:convert';
import 'package:todo_app/model/todo.dart';
import "package:http/http.dart" as http;

class TodoService {
  //apiden veri alır
  final String url = "https://dummyjson.com/todos/";
  final String addurl = "https://dummyjson.com/todos/add";

  Future<List> getUncompleted() async {
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
        Todo task = Todo.fromJson(element);
        //  todos.add(Todo.fromJson(element));  Todo.fromJson(element) → JSON nesnesini Todo nesnesine çevirir.

        if (task.completed! == false) {
          todos.add(task);
        }
      },
    );

    return todos;
  }

  Future<List> getCompleted() async {
    final response = await http.get(Uri.parse(url));
    List<dynamic> resp = jsonDecode(response.body)["todos"];

    List<dynamic> todos = List.empty(growable: true);

    resp.forEach(
      (element) {
        Todo task = Todo.fromJson(element);

        if (task.completed! == true) {
          todos.add(task);
        }
      },
    );

    return todos;
  }

  Future<String> addTodo(Todo newTodo) async {
    final response = await http.post( // response futureken returnde response döndüremeyeceğimiz için await yaptık
      Uri.parse(addurl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset-UTF-8'
      },
      body: json.encode(newTodo.toJson()),
    );
    print(response.body);
    return response.body;
  }
}
