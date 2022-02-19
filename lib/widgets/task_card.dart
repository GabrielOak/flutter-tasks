import 'package:flutter/material.dart';
import 'package:tasks/models/task.dart';

class TaskCard extends StatefulWidget {
  const TaskCard({
    Key? key,
    required this.task,
  }) : super(key: key);

  final Task task;

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
        // color: Colors.blue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: InkWell(
          splashColor: Colors.grey[600],
          onLongPress: () {
            print(widget.task.id);
          },
          onTap: () {
            setState(() {
              widget.task.isDone = !widget.task.isDone ;
            });
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
