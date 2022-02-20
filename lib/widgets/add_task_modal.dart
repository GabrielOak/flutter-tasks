import 'package:flutter/material.dart';
import 'package:tasks/database/dao/tasks_dao.dart';
import 'package:tasks/models/task.dart';
import 'package:tasks/widgets/input.dart';

class AddTaskModal extends StatelessWidget {
  
  AddTaskModal({Key? key}) : super(key: key);

  final TasksDao _dao = TasksDao();
  final inputController = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Container(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: width,
                child: const Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 16,
                  ),
                  child: Text(
                    'Create a new task',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 16,
                  horizontal: 8,
                ),
                child: Input(
                  hintText: 'Task name',
                  controller: inputController,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 16,
                  horizontal: 8,
                ),
                child: ElevatedButton(
                    onPressed: () {
                      final task = Task(0, inputController.text, false);
                      _dao.save(task);
                      Navigator.pop(context);
                    },
                    child: const Text('Add'),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.black,
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
