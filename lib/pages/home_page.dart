import 'package:flutter/material.dart';
import 'package:tasks/widgets/task_card.dart';
import 'package:tasks/models/task.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              width: width,
              padding: const EdgeInsets.all(15),
              child: const Text(
                "Today's Tasks",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              child: Column(
              children: [
                TaskCard(task: Task('Estudar inglês', false)),
              ],
            ))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(
          Icons.add,
          size: 30,
        ),
        onPressed: () {},
        backgroundColor: Colors.black,
      ),
    );
  }
}
