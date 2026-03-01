class Urls {
  static const String _baseUrl = 'https://todo-restapi-crud-render.onrender.com';

  static const getPost = '$_baseUrl/get_all_todo';
  static String getTodoById({required String id}) => '$_baseUrl/get_todo_by_id/$id';
  static const createTodo = '$_baseUrl/create_todo';
  static String updateTodo({required String id}) => '$_baseUrl/update_todo_by_id/$id';
  static String deleteTodo(String id) => '$_baseUrl/delete_todo_by_id/$id';
}