import 'package:sqflite/sqflite.dart';
import 'package:tasks/database/database.dart';
import 'package:tasks/models/task.dart';

class TasksDao {
  static const String tableSql = 'CREATE TABLE tasks('
                                  'id INTEGER PRIMARY KEY,'
                                  'title TEXT,'
                                  'is_done INTEGER)';

  Future<int> save(Task task) async{
    final Database db = await createDatabase();
    Map<String, dynamic> taskMap = _toMap(task);
    return db.insert('tasks', taskMap);
  }

  Future<int> remove(int id) async {
    final Database db = await createDatabase();
    return db.rawDelete('DELETE FROM tasks WHERE id = $id');
  }

  Future<int> update(int id, int isDone) async {
    final Database db = await createDatabase();
    return db.rawUpdate('UPDATE tasks SET is_done = $isDone WHERE id = $id');
  }

  Map<String, dynamic> _toMap(Task task) {
    final Map<String, dynamic> taskMap = {};
    taskMap['title'] = task.title;
    taskMap['is_done'] = task.isDone? 1 : 0;
    return taskMap;
  }
  Future<List<Task>> findAll() async {
    final Database db = await createDatabase();
    final List<Map<String, dynamic>> result = await db.query('tasks', orderBy: 'is_done ASC, id DESC');
    List<Task> tasks = _toList(result);
    return tasks;
  }
  List<Task> _toList(List<Map<String, dynamic>> result){
    final List<Task> tasks = [];
    for(Map<String, dynamic>row in result){
      Task task = Task(
        row['id'],
        row['title'],
        row['is_done'] == 1 ? true : false ,
      );
      tasks.add(task);
    }
    return tasks;
  }
}