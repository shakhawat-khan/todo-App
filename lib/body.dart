import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

import 'todo.dart';
import 'todoItem.dart';

class Body extends StatefulWidget {
  Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final textControler = TextEditingController();
  List<Todo> todoData = [];
  var uuid = Uuid();

  int indexx = 0;

  void _addTodo() {
    Todo todo = Todo(id: uuid.v4(), title: textControler.text);

    //print(uuid.v4());

    setState(() {
      todoData.add(todo);
    });
    textControler.text = '';
  }

  void deleteTodo(String id) {
    setState(() {
      todoData.removeWhere((element) => element.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(15),
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 20),
          ),
          Row(
            children: <Widget>[
              Expanded(child: addField()),
              IconButton(
                  onPressed: () {
                    _addTodo();
                  },
                  icon: Icon(Icons.add)),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
              child: ListView.builder(
                  physics: ScrollPhysics(),
                  itemCount: todoData.length,
                  itemBuilder: (context, i) {
                    return SingleTodoItem(
                      index: i + 1,
                      id: todoData[i].id,
                      title: todoData[i].title,
                      deleteTodo: deleteTodo,
                    );
                  })),
        ],
      ),
    );
  }

  Widget addField() {
    return TextField(
      style: TextStyle(
        fontSize: 25,
      ),
      controller: textControler,
      decoration: InputDecoration(
        labelText: 'Add Title',
        hintText: 'name of to do',
      ),
      keyboardType: TextInputType.text,
    );
  }
}
