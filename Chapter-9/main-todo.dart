/*
 * MIT Licence
 * Copyright 2017 @CodesBay (www.CodesBay.com)
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files(the "Software"), to deal in the
 * Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and / or sell copies of the Software,
 * and to permit persons to whom the Software is furnished to do so, subject to the following conditions :
 * The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
 * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR
 * ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH
 * THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 */


import 'package:flutter/material.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp
      (
        title: "ToDoNote Project",
        home: new HomePage()
    );
  }
}

class HomePage extends StatefulWidget  {
  //@override
  @override
  State<StatefulWidget> createState() {
    return new HomePageWithState();
  }
}

class HomePageWithState extends State<HomePage> {
  final TextEditingController eCtrl = new TextEditingController();
  List<String> theToDoList = <String>[];
  // CheckBox Widgets
  List<String> timeOfToDo = <String>[];
  List<Widget> theCheckBox = <Widget>[];
  List<bool> theCheckboxState = <bool>[];
  bool showAlertDialog = false;
  bool showSelectedToDo = false;
  int selectedToDoIndex = 0;

  Widget build (BuildContext context) {
    return new Scaffold
      (
        appBar: _createAppBar(),
        body: new Column
          (
            children: <Widget>
            [
              showSelectedToDo == true? _showSelectedToDo() : new Text(""),
              showAlertDialog == true? _createAlertDialogBox() : new Text(""),
              new Flexible(
                  child: new ListView.builder(
                    padding: new EdgeInsets.all(8.0),
                    reverse: false,
                    itemBuilder: (_, int index) {
                      return new Column
                        (
                          children: <Widget>
                          [
                            new Row
                              (
                                children: <Widget>
                                [
                                  new IconButton(
                                      icon: new Icon(Icons.arrow_drop_down_circle),
                                      color: Colors.blueAccent,
                                      onPressed: () {
                                        setState(() {
                                          selectedToDoIndex = index;
                                          showSelectedToDo = true;
                                        });
                                      }
                                  ),
                                  _createCheckBox(index),
                                  new Text
                                    (
                                      theToDoList[index],
                                      style: new TextStyle (
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold
                                      )
                                  ),
                                ]
                            ),
                            new Row
                              (
                                children: <Widget>
                                [
                                  new Text
                                    (
                                      "Created At => ",
                                      style: new TextStyle (
                                          color: Colors.green,
                                          fontSize: 15.0,
                                          fontStyle: FontStyle.italic
                                      )
                                  ),
                                  new Text
                                    (
                                      timeOfToDo[index],
                                      style: new TextStyle (
                                          color: Colors.blueAccent,
                                          fontSize: 10.0,
                                          fontStyle: FontStyle.italic
                                      )

                                  )
                                ]
                            ),
                            new Divider (
                              height: 5.0,
                              color: Colors.orange,
                            )
                          ]
                      );
                    },
                    itemCount: theToDoList.length,
                  )
              ),
            ]
        )
    );
  }
  Widget _showSelectedToDo() {
    return new AlertDialog
      (
        title: new Text("Selected ToDO"),
        content: new SingleChildScrollView
          (
          child: new Text (theToDoList[selectedToDoIndex]),
        ),
        actions: <Widget>
        [
          new FlatButton
            (
            child: new Text("OK"),
            onPressed: () {
              setState((){
                showSelectedToDo = false;
              });
            },
          ),
        ]
    );
  }

  Widget _createCheckBox(int index) {
    // Make sure that checkbox is already present if not we need to add
    if(theCheckBox.length < theToDoList.length) {
      theCheckboxState.add(false);
      theCheckBox.add
        (
          new Checkbox
            (
              value: theCheckboxState[index],
              onChanged: (bool value) {
                setState(() {
                  print("Current INDEX Is => $index");
                  theCheckboxState[index] = value;
                });
              }
          )
      );
    } else {
      theCheckBox[index] =
      new Checkbox
        (
          value: theCheckboxState[index],
          onChanged: (bool value) {
            setState(() {
              print("Current INDEX Is => $index");
              theCheckboxState[index] = value;
            });
          }
      );
    }

    return theCheckBox[index];

  }
  Widget _createAppBar() {
    return new AppBar
      (
        title: new Text("ToDo Note App"),
        backgroundColor: Colors.orange,
        actions:<Widget>
        [
          new IconButton
            (
              color: Colors.red,
              icon: new Icon(Icons.add_comment),
              tooltip: 'Add Into List',
              onPressed: () {
                print("On Pressed Called...");
                showAlertDialog = true;
                setState(() {

                });
              }
          ),
          new IconButton
            (
            color: Colors.red,
            icon: new Icon(Icons.delete),
            tooltip: 'Remove from list',
            onPressed: () {
              setState(() {
                _removeCheckedItems();
              });
            },
          )
        ]
    );
  }

  void _removeCheckedItems() {
    for (int i = 0; i < theCheckboxState.length ; i++  ) {
      if(theCheckboxState[i] == true) {
        print("Removing at index $i value of checkbox => $theCheckboxState[i]");
        theToDoList.removeAt(i);
        theCheckboxState.removeAt(i);
        theCheckBox.removeAt(i);
        timeOfToDo.removeAt(i);
        // rerun the loop
        i = 0;
      }
    }
  }

  Widget _createAlertDialogBox() {
    String newMessage = "";
    return new AlertDialog
      (
        title: new Text("Create Your Note.."),
        content: new SingleChildScrollView(
          child: new ListBody(
              children: <Widget>
              [
                new TextField
                  (
                  maxLines: 3,
                  textAlign: TextAlign.left,
                  controller: eCtrl,
                  onChanged: null,
                  onSubmitted: null,
                  decoration: new InputDecoration.collapsed
                    (
                    hintText: ("Add you Todo Note"),
                  ),
                  style: new TextStyle(
                      fontSize: 20.0,
                      color: Colors.red
                  ),

                ),
              ]
          ),
        ),
        actions: <Widget>
        [
          new FlatButton
            (
            child: new Text("OK"),
            onPressed: () {
              setState((){
                showAlertDialog = false;
                // Create the text Box
                print("The Text to be added is $eCtrl.text");
                theToDoList.add(eCtrl.text);
                eCtrl.clear();
                // Add the time its Added
                timeOfToDo.add
                  (
                    new DateTime.now().toString()
                );
              });
            },
          ),
          new FlatButton
            (
            child: new Text("BACK"),
            onPressed: () {
              setState((){
                showAlertDialog = false;
                eCtrl.clear();
              });
            },
          )
        ]
    );
  }
}

