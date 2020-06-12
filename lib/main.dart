import 'package:flutter/material.dart';
import 'package:flutterappnotebook/screens/editing.dart';
import 'package:flutterappnotebook/screens/first_screen.dart';

void main(){
  runApp(MaterialApp(
      title: 'My Notebook',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: Notebook(),
  )
  );
}


