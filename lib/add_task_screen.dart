import 'package:flutter/material.dart';

class AddTaskScreen extends StatelessWidget {
 final Function addTaskCallback;

 AddTaskScreen(this.addTaskCallback);

  @override
  Widget build(BuildContext context) {
    String newTextTitle= "";
    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text(
            "ADD To DO",
            textAlign: TextAlign.center,
          ),
          TextField(
            autofocus: true,
            textAlign: TextAlign.center,
            onChanged: (newText){
              newTextTitle = newText;
            },
          ),
          TextButton(
              onPressed: () {
                addTaskCallback(newTextTitle);
              },
              child: Text("ADD"))
        ],
      ),
    );
  }
}
