import 'package:flutter/material.dart';
import 'package:tasks/database/dao/tasks_dao.dart';
import 'package:tasks/models/task.dart';

class TaskCard extends StatefulWidget {
  TaskCard({
    Key? key,
    required this.task,
    required this.callback,
  }) : super(key: key);

  final Task task;
  final Function callback;
  final TasksDao _dao = TasksDao();

  @override
  _TaskCardState createState() => _TaskCardState();
}

class _TaskCardState extends State<TaskCard> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8, top: 5),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: InkWell(
          splashColor: Colors.grey[600],
          onLongPress: () {
            print(widget.task.id);
          },
          onTap: () async {
            await widget._dao.update(widget.task.id, widget.task.isDone ? 0 : 1);
            widget.callback();
          },
          child: Padding(
            padding:
                const EdgeInsets.only(top: 16, bottom: 16, left: 8, right: 10),
            child: Center(
              child: Row(
                children: [
                  Container(
                    width: (width * 0.80),
                    padding: const EdgeInsets.only(right: 5, left: 5),
                    child: Text(
                      widget.task.title,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        decoration: widget.task.isDone ? TextDecoration.lineThrough : TextDecoration.none
                      ),
                    ),
                  ),
                  const Spacer(),
                  Container(
                      child: widget.task.isDone
                          ? const Icon(Icons.check_box)
                          : const Icon(Icons.check_box_outline_blank)),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
