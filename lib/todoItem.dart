import 'package:flutter/material.dart';

class SingleTodoItem extends StatelessWidget {
  final String id;
  final String title;
  final int index;
  final Function deleteTodo;
  SingleTodoItem(
      {required this.id,
      required this.title,
      required this.index,
      required this.deleteTodo});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        child: Row(
          children: <Widget>[
            Text(
              '$index',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Text(
              '$title',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w400,
              ),
            ),
            Spacer(),
            IconButton(
                onPressed: () {
                  deleteTodo(id);
                },
                icon: Icon(
                  Icons.delete,
                  size: 25,
                  color: Colors.red,
                ))
          ],
        ),
      ),
    );
  }
}
