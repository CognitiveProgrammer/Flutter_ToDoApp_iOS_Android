/*
 * MIT Licence
 * Copyright 2017-2018 @Daksh Gupta (www.dakshhub.com)
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
  runApp( new MyApp
  (
    appTitle: new Text("ToDo List"),
    cText: new Text("Display Text - 1"),
  ));
}
class MyApp extends StatefulWidget {
  MyApp({this.appTitle, this.cText});
  final Widget appTitle, cText;

  @override
  //MyAppState createState() => new MyAppState();
  MyAppState createState() {
    print("Called....");
   return new MyAppState();
  }
}
enum TestEnum { A }
class MyAppState extends State<MyApp> {
  String text = "";
  @override
  Widget build( BuildContext context) {
    return new MaterialApp
    (
      home: new Scaffold
      (
        appBar: new AppBar
        (
          title: widget.appTitle,
          backgroundColor: Colors.orange,
          actions: <Widget>[
            new IconButton
            (
                icon: new Icon(Icons.add_comment),
                onPressed: (){
                  setState((){
                    text="ADD";
                  });
                }
            ),
            new IconButton
            (
                icon: new Icon(Icons.remove),
                onPressed: (){
                  setState((){
                    text="REMOVE";
                  });
                }
            ),
            new PopupMenuButton
            (
                itemBuilder: (BuildContext ctxt) {
                  return <PopupMenuEntry<TestEnum>>
                  [
                    new PopupMenuItem
                    (
                        child: new FlatButton
                        (
                          child: new Text("ABCD"),
                          onPressed: (){
                            setState((){
                              text="ABCD";
                            });
                          },
                        )
                    ),
                    new PopupMenuItem
                    (
                        child: new FlatButton
                        (
                          child: new Text("DEFG"),
                          onPressed: (){
                            setState((){
                              text="DEFG";
                            });
                          },
                        )

                    ),
                  ];


                }
            )
          ],
        ),
        body: new Column
        (
          children: <Widget>
          [
            widget.cText,
            new Text("Value => $text")
          ],
        ),
      ),
    );
  }

}
