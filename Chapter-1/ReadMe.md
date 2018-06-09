# Chapter - 1: Hello Flutter

Let's create the first __Hello Flutter__ Application. By the end of this chapter, we shall be able to display the texts onto the screen.

## 1.0: Setup & Installation

First and foremost we need to install flutter SDK and the development environment. There are detailed instructions provided at flutter home page.  Please see the instructions at https://flutter.io/setup/ 

You may use any editor of your choice to write Dart code, however, if you want a proper IDE, I'll recommend IntelliJ IDEA CE with Flutter plugin.

Post setup and installation, the way to create the first app by calling the following

```
flutter create myapp
```

It will create a folder called `myapp`. There will be a file called `lib/main.dart` which is where all the code will be written. Please remove all the generated code to start afresh

## 1.1: The Code Structure

The code structure starts with a `main()` function which loads a widget. For simplicity, we can consider a single widget as a container (visible/invisible), which loads other widgets. 


## 1.2: Hello Flutter 

Everything is a widget in flutter, so Text has to be displayed using what we call `Text widget`. However, before we go ahead and display texts on screen, we need to remember a couple of points about the widgets.

Technically, though not differentiated explicitly in flutter, we can consider widgets are of two types. 
- Widgets which can act as a container and hold different widgets inside it
- Child only widget, which needs a container widget as a parent 
 
The `Text Widget` is a child only widget and needs a parent container widget to display itesel. We'll use the widget `Directionality` which determines the text direction as a container widget for the same.

So basically here is how our screen will look like

![Hello Flutter Widget](https://github.com/DakshHub/Flutter_MobileApp_Development/blob/master/Chapter-%201/Widget%20First.png)


The first line of code is about importing the basic material so that we can call the `runApp()` function which draws the widget.

```
import 'package:flutter/material.dart';
```

The function `runApp()` takes a widget, which is created using `new` keyword. Let's name the widget as `MyApp`

```
void main() {
  runApp(new MyApp());
}

```
We will create MyApp as a stateless widget which draws a container called `Directionality' which contains a child widget called 'Text`

```
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Directionality
      (
        textDirection: TextDirection.ltr, // left to right direction
        child: new Text("Hello Flutter")
    );
  }
} 

```

## 1.3: Hello Flutter Code

To draw a widget, `build(...)` function is called and that's why we overwrite the base class function. Whatever widgets we'll create inside this function will be drawn on screen

## 1.4 Rearrangement of Widgets

The existing code displays the text in the upper top left corner which is undesirable. To write the text in the center of the screen we need another widget called '`Center` which will contain the `Text` Widget as depicted in the picture below

![Hello Flutter Widget-2](https://github.com/DakshHub/Flutter_MobileApp_Development/blob/master/Chapter-%201/Widget-2.png
)

The `build(...)` function after adding the `Center` widget will be changed as

```
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Directionality
      (
        textDirection: TextDirection.ltr,
        child: new Center  // new Widget
        (
          child: new Text("Hello Flutter")
        )
    );
  }
} 
```
As a result, the text is displayed at the center of the screen.

## 1.5 That's all for this Chapter

We've seen how to create our first app which displays some basic texts onto the screen. In the next chapter, we'll learn about creating widgets with proper application bar and bodies





