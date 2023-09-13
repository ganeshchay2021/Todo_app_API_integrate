import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/features/ui/pages/widgets/todo_card.dart';

import '../../../common/todo_list.dart';

class TodoListingScreen extends StatefulWidget {
  const TodoListingScreen({super.key});

  @override
  State<TodoListingScreen> createState() => _TodoListingScreenState();
}

class _TodoListingScreenState extends State<TodoListingScreen> {
  // List<TodoList> _items = [
  //   TodoList(
  //       title: "title",
  //       description: "description",
  //       isCompleted: true,
  //       createdAt: DateTime.now()),
  //   TodoList(
  //       title: "title",
  //       description: "description",
  //       isCompleted: false,
  //       createdAt: DateTime.now()),
  //   TodoList(
  //       title: "title",
  //       description: "description",
  //       isCompleted: true,
  //       createdAt: DateTime.now()),
  //   TodoList(
  //       title: "title",
  //       description: "description",
  //       isCompleted: false,
  //       createdAt: DateTime.now()),
  //   TodoList(
  //       title: "title",
  //       description: "description",
  //       isCompleted: true,
  //       createdAt: DateTime.now()),
  //   TodoList(
  //       title: "title",
  //       description: "description",
  //       isCompleted: false,
  //       createdAt: DateTime.now()),
  //   TodoList(
  //       title: "title",
  //       description: "description",
  //       isCompleted: true,
  //       createdAt: DateTime.now()),
  // ];

  Future<List<TodoList>> fetchData() async {
    final responce =
        await Dio().get("https://note-backend-n9u1.onrender.com/api/notes");
    final result = List.from(responce.data["data"])
        .map((e) => TodoList.fromMap(e))
        .toList();
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green.shade50,
      appBar: AppBar(
        title: Text("MY TODO"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
              future: fetchData(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.data != null) {
                    if (snapshot.data!.isNotEmpty) {
                      return ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          return TodoCard(
                            title: snapshot.data![index].title,
                            description: snapshot.data![index].description,
                            isCompleted: snapshot.data![index].isCompleted,
                            createdAt: snapshot.data![index].createdAt,
                          );
                        },
                      );
                    } else {
                      return Center(
                        child: Text(
                          "Data is not available",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey.shade600,
                          ),
                        ),
                      );
                    }
                  } else {
                    return Center(
                      child: Text(snapshot.error.toString()),
                    );
                  }
                } else {
                  return Center(
                    child: CircularProgressIndicator.adaptive(),
                  );
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
