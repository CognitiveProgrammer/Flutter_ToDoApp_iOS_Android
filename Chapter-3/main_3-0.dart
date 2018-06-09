/*
 * MIT Licence
 * Copyright 2017-2018 @9lean (www.9lean.com)
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
  runApp(new MyApp
  (
    appTitle: new Text("ToDo App"),
    contextText: new Text("Displayed Text"),
  ));
}

class MyApp extends StatelessWidget {
  MyApp({this.appTitle, this.contextText});
  final Widget appTitle, contextText;
  int counter = 0;
  bool chkValue = false;
  @override
  Widget build (BuildContext context) {
    return new MaterialApp
    (
      title: "MyApplication",
      home: new Scaffold
      (
        appBar: new AppBar
        (
          title: this.appTitle,
          backgroundColor: Colors.orange,
        ),
        body: new Column
        (
          children: <Widget>
          [
            new FlatButton
            (
              child: new Text("AButton"),
              onPressed: (){
                print("Button Pressed..");
                counter++;
              },
            ),
            new Text("\n\n\nCounter Value = $counter\n\n\n"),
            new Checkbox
            (
              value: chkValue,
              onChanged: (bool newValue) {
                chkValue = newValue;
              }
            ),
            this.contextText
          ],
        )
      )
    );
  }

}
