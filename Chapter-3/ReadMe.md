# Chapter - 3: Extending Home Screen using Interactive Widgets

Interactive widgets are those which acts on user input and can change its state. In this chapter, we will look into `FlatButton` and `CheckBox` widgets as an example.

We'll start this chapter by doing some modifications to the code written in the last chapter. We'll now take application title as a constructor parameter. So the 'MyApp' code changes as 

```
 MyApp({this.appTitle, this.contextText});
 final Widget appTitle, contextText;

```
and the instantiation of `MyApp` shall be changed as

```
 runApp(new MyApp
  (
    appTitle: new Text("ToDo App"),
    contextText: new Text("Displayed Text"),
    
  ));
   
```

## 3.0: Creating FlatButton

We can create a button using `FlatButton Widget`. We can use this widget as

```
 new FlatButton
  (
    child: new Text("AButton"),
    onPressed: null,
  )
``` 
Each `FlatButton` comes with an associated `onPressed` event handler. we can define the event handler as `null`, which specifies that pressing the button has no actions associated with it. 

However, if we don't define the `FlatButton`, the button will be greyed out. To enable the button, we have to provide an implementation to the `onPressed` . We can have empty implementation as

```
 onPressed: (){ },
 
```

## 3.1: Creating CheckBox

'CheckBox` widget is very similar to `FlatButton` widget with a default value and an action handler called `onChanged`.  If the action handler is `null` then the checkbox remains grey.

The `CheckBox` code shall be written as

```
new Checkbox
  (
    value: chkValue,
    onChanged: (bool newValue) { }
  ),

```

## 3.2: The Hot Reload

The Hot Reload Functionality

Hot Reload functionality is provided in `flutter` which allows any changes to be loaded at runtime. The best thing about hot reload is that it preserves the state across the changes

For example, we can have a counter variable which increments itself every time the button is pressed. If the counter value is printed, the value will be preserved across hot reload.

The code with the counter shall look like

```
// Declare counter
 final Widget appTitle, contextText;
 int counter = 0;
  ...
  ..
  new FlatButton
    (
      child: new Text("AButton"),
      onPressed: (){
        counter++;
      },
    ),
// Printing the counter in text widget
 new Text("Counter Value => $counter"),
```

With every button press, the counter will be incremented. A hot reload will always fetch the latest value of `counter` . However, if we reload the application again, the counter shall begin from zero

## 3.3: CheckBox Action

The `CheckBox` action handler can be set with the help of a variable called `chkValue` . The `chkValue` will reflect the current status based on user action.

```
...
...
  final Widget appTitle, contextText;
  int counter = 0;
  bool chkValue = false;
  ...
  ...
  ....
  new Checkbox
  (
    value: chkValue,
    onChanged: (bool newValue) {
      chkValue = newValue;
    }
  )
```

If we click on the checkbox and do a hot reload, the new value will be reflected. However, this is not the expected behavior, we should see the change in the checkbox as soon as we click it.

This is the place where `Stateless` widget limitation comes and we require a `Stateful` widget.

#3.4: Recap and Conclusion

This chapter focused on how we can extend home screen as add interactivity to the widgets. We've also seen the limitations of `Stateless` widget and why we should move to `Stateful` widget.

In the next chapter, we'll focus on `Stateful` Widgets

