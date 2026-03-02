import 'package:flutter/material.dart';
import 'package:todo_application/model/todo_list_model.dart';
import 'package:todo_application/screens/task_form.dart';
import 'package:todo_application/screens/view_task_screen.dart';
import 'package:todo_application/services/network_caller.dart';
import 'package:todo_application/services/network_response.dart';
import 'package:todo_application/urls.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<TodoListModel> todoList = [];
  bool _inProgress = false;

  Future<void> fetchPost() async {
    setState(() => _inProgress = true);

    final NetworkResponse response = await NetworkCaller.getRequest(
      url: Urls.getPost,
    );

    if (response.isSuccess) {
      final List<dynamic> postListModel = response.responseData;

      setState(() {
        todoList = postListModel.map((e) => TodoListModel.fromJson(e)).toList();
      });
    } else {
      // print('Failed to fetch posts: ${response.statusCode}');
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(response.errorMessage)));
      }
    }
    setState(() => _inProgress = false);
  }

  Future<void> deleteTodo({required String id}) async {
    setState(() {
      _inProgress = true;
    });

    final NetworkResponse response = await NetworkCaller.deleteRequest(
      url: Urls.deleteTodo(id),
    );
    setState(() {
      _inProgress = false;
    });
    if (response.isSuccess) {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Task has been deleted...!')));
      }
    } else {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Task has been deleted...!')));
      }
    }
  }

  @override
  void initState() {
    fetchPost();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('To-Do App', style: TextStyle(fontWeight: FontWeight.w600)),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => TaskForm()),
          );
          if (result == true) {
            fetchPost();
          }
        },
        child: const Icon(Icons.add),
      ),
      body: todoList.isEmpty
          ? Center(child: Text('No task available...!'))
          : Column(
              children: [
                Expanded(
                  child: RefreshIndicator(
                    onRefresh: fetchPost,
                    child: _inProgress
                        ? Center(child: CircularProgressIndicator())
                        : ListView.builder(
                            padding: const EdgeInsets.all(8),
                            itemCount: todoList.length,
                            itemBuilder: (context, index) {
                              final item = todoList[index];

                              return Container(
                                margin: const EdgeInsets.only(bottom: 10),
                                decoration: BoxDecoration(
                                  color: Colors.white12,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: ListTile(
                                  title: Text(
                                    item.title ?? '',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  subtitle: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        item.description ?? '',
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.justify,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          TextButton(
                                            onPressed: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      ViewTaskScreen(
                                                        id: todoList[index].sId
                                                            .toString(),
                                                      ),
                                                ),
                                              );
                                            },
                                            child: Icon(Icons.remove_red_eye),
                                          ),
                                          TextButton(
                                            onPressed: () async {
                                              final result =
                                                  await Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          TaskForm(
                                                            todoListModel: item,
                                                          ),
                                                    ),
                                                  );
                                              if (result == true) {
                                                await fetchPost();
                                              }
                                            },
                                            child: Icon(Icons.edit),
                                          ),
                                          TextButton(
                                            onPressed: () async {
                                              await deleteTodo(
                                                id: item.sId.toString(),
                                              );
                                              await fetchPost();
                                            },
                                            child: Icon(Icons.delete),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                  ),
                ),
              ],
            ),
    );
  }
}