
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../components/data/dataTodo.dart';
import '../components/utils/dialog_box.dart';
import '../components/utils/todo_tile.dart';
class Todo extends StatefulWidget {
  const Todo({super.key});

  @override
  State<Todo> createState() => _TodoState();
}

class _TodoState extends State<Todo> {

  ToDoDatabase db = ToDoDatabase();
  final _myBox = Hive.box('myBox');
  final _controller = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    if (_myBox.get('TODO')==null){
      db.initData();
    }else{
      db.loadData();
    }

    super.initState();
  }


  void onSave(){

    setState(() {
      db.todoList.add([_controller.text, false]);
      _controller.clear();

    });
    db.update();

  }


  void tapped(bool? value, int index){
    setState(() {
      db.todoList[index][1] = !db.todoList[index][1];
    });
    db.update();
  }

  void taskDeleted(int index){
    setState(() {
      db.todoList.removeAt(index);
    });
    db.update();
  }
  void createNewTask(){
    showDialog(
        context: context,
        builder:(context){
          return DialogBox(
            controller: _controller,
            onSave: (){
              onSave();
              Navigator.pop(context);
            },
            onCancel: Navigator.of(context).pop,
          );
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title:  Text('Todo List', style: TextStyle(
          color: Colors.red[900],
          fontWeight: FontWeight.bold,fontSize: 35
        ),),
        centerTitle: true,
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed:createNewTask,
        child: Icon(Icons.add,color: Colors.white,),
        backgroundColor: Colors.red[900],
      ),
      body: ListView.builder(
        itemCount: db.todoList.length,
        itemBuilder: (context, index){
          return ToDo(
            name: db.todoList[index][0],
            taskDone: db.todoList[index][1],
            onChanged: (value)=> tapped(value, index),
            taskDeleted: (context) => taskDeleted(index),
          );
        },
      ),


    );

  }

}
