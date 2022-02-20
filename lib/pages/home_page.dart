import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:tasks/database/dao/tasks_dao.dart';
import 'package:tasks/widgets/add_task_modal.dart';
import 'package:tasks/widgets/loading_indicator.dart';
import 'package:tasks/widgets/task_card.dart';
import 'package:tasks/models/task.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TasksDao _dao = TasksDao();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          SizedBox(
            width: width,
            child: const Padding(
              padding: EdgeInsets.only(left: 16, top: 8, bottom: 8),
              child: Text(
                "Today's Task",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Expanded(
            child: FutureBuilder(
                // initialData: const [],
                future: _dao.findAll(),
                builder: (context, snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.none:
                      break;
                    case ConnectionState.waiting:
                      return const LoadingIndicator();
                    case ConnectionState.active:
                      break;
                    case ConnectionState.done:
                      final List<Task> tasks = snapshot.data as List<Task>;
                      if (tasks.isNotEmpty) {
                        return ListView.builder(
                            itemCount: tasks.length,
                            itemBuilder: (context, index) {
                              final Task task = tasks[index];
                              return TaskCard(task: task);
                            });
                      } else {
                        return const Center(
                          child: Text('Add your tasks'),
                        );
                      }
                  }
                  return const Text('Unknow error');
                }),
          ),
        ],
      )),
      floatingActionButton: FloatingActionButton(
        child: const Icon(
          Icons.add,
          size: 30,
        ),
        onPressed: () {
          showBarModalBottomSheet(
              context: context,
              builder: (BuildContext context) {
                return const AddTaskModal();
              });
        },
        backgroundColor: Colors.black,
      ),
    );
  }
}
