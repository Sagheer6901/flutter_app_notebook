

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterappnotebook/screens/editing.dart';

class Notebook extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return Notebook_sqlite();
  }

}


class Notebook_sqlite extends State<Notebook>{
  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.subtitle2;
    var count = 0;
    return Scaffold(
        appBar: AppBar(
          title: Text("My Notebook"),
        ),
        body: ListView.builder(
          itemCount: count,
          itemBuilder: (BuildContext context, int position) {
            return Card(
              color: Colors.white,
              elevation: 2.0,
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.yellow,
                  child: Icon(Icons.keyboard_arrow_right,),
                ),
                title: Text("Fisrt Title", style: textStyle,),
                subtitle: Text("subtitle"),
                trailing: Icon(Icons.delete),
                onTap: (){
                  debugPrint("pressed");
                  navigatorDetail("Edit Detail");
                },
              ),
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: (){
            debugPrint("fab pressed");
            navigatorDetail("Add Note");
          },
          tooltip: "Add Note",
          child: Icon(Icons.add),
        ),
      );
  }

  void navigatorDetail(String title){
    Navigator.push(context, MaterialPageRoute(builder: (context){
      return Edit_notebook(title);
    }));
  }
}