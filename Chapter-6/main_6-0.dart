/*
 * MIT Licence
 * Copyright 2018 @CodesBay (www.CodesBay.com)
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
  runApp(new MyApp (
      title: new Text("My App"), someText: new Text("Some Text..."),));
 }

 class MyApp extends StatefulWidget {
  MyApp({this.title, this.someText});
  final Widget title, someText;
  @override
  MyAppState createState() => new MyAppState();
 }

 class MyAppState extends State<MyApp> {
  TextEditingController eCtrl = new TextEditingController();
  String value = "";
  @override
   Widget build(BuildContext ctxt) {
    return new MaterialApp
    (
      home: new Scaffold
      (
        appBar: new AppBar( title: widget.title,),
        body: new Column
        (
          children: <Widget>[
            widget.someText,
            new TextField
            (
              controller: eCtrl,
              decoration: new InputDecoration.collapsed(hintText: "ADD SOMETHING"),

              onChanged: (String text) {
                setState(() {
                  value = text;
                });
              },
              onSubmitted: (String text) {
                setState(() {
                  value = eCtrl.text;
                });
                eCtrl.clear();
              },

            ),
            new Text("\n\n $value")
          ],
        ),
      ),
    );


  }

 }
