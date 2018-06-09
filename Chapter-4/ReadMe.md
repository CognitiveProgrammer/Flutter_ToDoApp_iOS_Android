# Chapter - 4: Using Stateful Widgets

As we say in the last chapter that interactive widgets cannot be used with `Stateless` widgets as it doesn't redraw the screen as a result of user input. However, `Stateful` widgets can redraw themselves based on some action and that's why they are used for creating interactive widgets.

## 4.0: Creating Stateful Widget

A `Stateful` widget is created by extending the application class from `Stateful Widget`, for example, to convert `MyApp` into a Stateful widget, we need to write the following code

```
class MyApp extends StatefulWidget {
    @override
    MyAppState createState() => new MyAppState();
}

class MyAppState extends State<MyApp> {
}
```
As is obvious from the code above, creating `Stateful widget` is a two step process

1. Extending the class from `StatefulWidget` class.
2. Creating a separate class derived from `State<StatefulWidget>`

The functionality remains in the `MyAppState` class, but just that its invocation is changed which makes it a part of `States`

## 4.1: Accessing Constructor Parameters inside the Stateful Widget

The end user will still invoke `new MyApp` which means the constructor parameters shall be defined inside the `MyApp` class itself as

```
class MyApp extends StatefulWidget {
  MyApp({this.appTitle, this.cText});
  final Widget appTitle, cText;
 }

```
However, as mentioned in 4.0, the functionalities will remain in `MyAppState` class, the constructor parameters of the 'MyApp` shall be used by prefixing the parameters with `widget` as 

```
widget.appTitle
&
widget.cText
```
## 4.2: Triggering Widget Redraw

Okay, we know that `Stateful widget` can redraw itself multiple times, but the question is "WHEN" and "HOW"?

The good news is that redraw can be triggered manually each and every time we call `setState(...)`. We can call the same from the `onPressed(...)` of `FlatButton` or from the `onChanged(...)` from `CheckBox`.

The `setState(...)` will completely rebuild every widget irrespective of whether it was changed or not. It's as good as calling `build(....)` function of the widget again with new values.

The action handler code of the `CheckBox` and `FlatButton` will look like this after adding `setState(...)`

```
new FlatButton
  (
      onPressed: () {
        setState((){
          counter++;
        });
      },
      child: new Text("AButton $counter")
  ),
  new Checkbox
  (
      value: chkValue,
      onChanged: (bool newValue){
        setState(() {
          print("Set State...");
          chkValue = newValue;
        });

      }
  )

```

## 4.3 Recap & Conclusion

In this chapter, we've seen how we redraw a `Stateful` widget at runtime using `setState(...)` function


