class Todo {
  Todo({
    required this.id,
    required this.todo,
    required this.completed,
    required this.userId,
  });

  int? id;
  String? todo;
  bool? completed;
  int? userId;

  // from json

  Todo.fromJson(Map<String, dynamic> json) {
    // API'den JSON formatında veri aldığımızda, bunu Todo nesnesine çeviriyıor
    id = json["id"];
    todo = json["todo"];
    completed = json["completed"];
    userId = json["userId"];
  }

  //to json

  Map<String, dynamic> toJson() { //toJson metodu nesneyi JSON formatına çeviriyor, böylece bunu bir API’ye gönderiyoruz
    final Map<String, dynamic> data = {};
    data["id"] = id;
    data["todo"] = todo;
    data["completed"] = completed;
    data["userId"] = userId;

    return data;
  }

// API’den JSON formatında gelen veriyi Todo nesneye 
//  Todo gorev = Todo.fromJson(apiVerisi);
// Bir Todo nesnesini JSON formatına çevirebilir ve API’ye gönder
// Map<String, dynamic> gonderilecekJson = gorev.toJson();

}
