import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Edit_notebook extends StatefulWidget {

  String appBarTitle;
  Edit_notebook(this.appBarTitle);
  @override
  State<StatefulWidget> createState() {
    return Edit_notebook_sqlite(this.appBarTitle);
  }
}

class Edit_notebook_sqlite extends State<Edit_notebook> {
  var _indicator = ["High", "Low"];
  String _default_indicator = "High";

  TextEditingController first_textfield = TextEditingController();
  TextEditingController second_textfield = TextEditingController();

  String appBarTitle;
  Edit_notebook_sqlite(String appBarTitle);

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.subtitle2;
    var count = 0;
    return WillPopScope(

      onWillPop: (){
        moveToLastScreen();
      },

      child: Scaffold(
            appBar: AppBar(
              leading: IconButton(icon: Icon(
                Icons.arrow_back,
              ),
              onPressed: (){
                moveToLastScreen();
              },
              ),
              title: Text(appBarTitle),
            ),
            body: Container(
                padding: EdgeInsets.all(10.0),
                child: ListView(children: <Widget>[
                    DropdownButton(
                    style: textStyle,
                    items: _indicator.map((String dropdownValue) {
                      return DropdownMenuItem<String>(
                        value: dropdownValue,
                        child: Text(dropdownValue),
                      );
                    }).toList(),

                    onChanged: (String value) {
                      setState(() {
                        this._default_indicator = value;
                      });
                    },
                    value: _default_indicator,
                  ),

                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 5.0),
                    child:  TextFormField(
                        controller: first_textfield,
                        style: textStyle,
                        keyboardType: TextInputType.text,
//                  validator: (String value){
//                    if(value.isEmpty){
//                      return 'Please enter year';
//                    }
//                  },
                        decoration: InputDecoration(
                            labelStyle: textStyle,
                            labelText: "Title",
                            //hintText: "Time in years",
                            errorStyle: TextStyle(
                              color: Colors.yellowAccent,
                              fontSize: 15.0,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            )),
                      ),
                    ),

                  Padding(
                      padding: EdgeInsets.symmetric(vertical: 5.0),

                        child: TextFormField(
                          controller: second_textfield,
                          style: textStyle,
                          keyboardType: TextInputType.text,
//                  validator: (String value){
//                    if(value.isEmpty){
//                      return 'Please enter year';
//                    }
//                  },
                          decoration: InputDecoration(
                              labelStyle: textStyle,
                              labelText: "Description",
                              //hintText: "Time in years",
                              errorStyle: TextStyle(
                                color: Colors.yellowAccent,
                                fontSize: 15.0,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0),
                              )),
                        ),
                      ),

                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 5.0),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: RaisedButton(
                            child: Text(
                              "Save",
                              textScaleFactor: 1.5,
                            ),
                            onPressed: () {
//                        setState(() {
//                          if(_formkey.currentState.validate()) {
//                            this.text = _calculate();
//                          }
//                        });
                            },
                            color: Theme.of(context).primaryColorDark,
                            textColor: Theme.of(context).primaryColorLight,
                          ),
                        ),
                        Container(
                          width: 5.0,
                        ),
                        Expanded(
                            child: RaisedButton(
                          child: Text(
                            "Delete",
                            textScaleFactor: 1.5,
                          ),
                          onPressed: () {
//                          _reset();
                          },
                          color: Theme.of(context).primaryColorDark,
                          textColor: Theme.of(context).primaryColorLight,
                        )),
                      ],
                    ),
                  ),
                ]))));
  }

  void moveToLastScreen(){
    Navigator.pop(context);
  }

}
