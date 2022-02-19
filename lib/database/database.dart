import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:tasks/database/dao/tasks_dao.dart';

Future<Database> createDatabase() async {
  final String dbPath = await getDatabasesPath();
  final String path = join(dbPath, 'tasks.db');
  return openDatabase(
    path,
    onCreate: (db, version) {
      db.execute(TasksDao.tableSql);
    },
    version: 1,
    onDowngrade: onDatabaseDowngradeDelete,
  );
}