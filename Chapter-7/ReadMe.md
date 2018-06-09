# Chapter- 7: Dynamically Displaying Widgets

This is illustrated using `Alert Dialog` widget. The `Alert` box is an integral part of the mobile application and used for a variety of purposes including but not limited to the displaying some information.  Notwithstanding its usage 'Alert` dialogs are not displayed on the screen for the duration of the application, instead it's displayed as part of some actions.

In this chapter, we'll explore the dynamic display of widgets based on user actions by taking Alert Dialog as a reference.

## 7.0 : Creating an Alert Dialog


We'll again start with the skeleton code of `MaterialApp` containing `Scaffold`  with `AppBar` and `Body` as `Column`. 

We can create an `Alert Dialog` within the body as
```
new AlertDialog
(
     title: new Text("Alert Dialog"),
)
```
As soon as the application loads, we can see this alert dialog and it will remain present till the app is loaded.  

## 7.1:  Dynamic Display of Alert Dialog

Since this is not what we want, let's trigger this dialog as a result of a user action. We'll create an action button on `AppBar` and as a result of pressing the button, `AlertDialog` should be created.

There are two separate activities that need to be done over here.

1. Trigger the redraw (as setState(...)) from the `AppBar` so that the dialog is displayed.

2. Have a logic in `body` to display the `Alert Dialog` if and only if the button is pressed. 

We can achieve the 2nd by having a boolean variable, which if enabled will show the dialog and not otherwise.

The code of the `AppBar` will contain `actions` will enable a boolean variable called `showDialog` and triggers a redraw with `setState(...)` as shown below.

```
 appBar: new AppBar
(
  title: widget.title,
  actions: <Widget>[
    new IconButton(icon: new Icon(Icons.add_comment),
    onPressed: () {
      setState(() {
        showDialog = true;
      });

    })
  ]
  ,
),
````

The body will decide to display the dialog box based on value `showDialog == true` which is implemented as a ternary operator. 

Just remember that this is the only way as we can't write any if conditions as a widget, it can be written in the functions only. The code will look like this

```
showDialog == true ? new AlertDialog
(
  title: new Text("Alert Dialog"),
) : new Text("");         

```

## 7.2 Adding Contents and Actions on Alert Dialog

`Alert Dialog` can add multiple contents as well as Actions. As an illustration, I'll add `TextField` as a content and a `FlatButton` which closes the `Alert Dialog` when pressed. This is achieved by calling `setState(...)` again after making `showDialog` as `false`

Here is how the complete `AlertDialog` code looks like

```
new AlertDialog
(
  title: new Text("Alert Dialog"),
  content:new TextField
    (
    controller: eCtrl,
    decoration: new InputDecoration.collapsed(hintText: "ADD Something"),
    maxLines: 3,
    onSubmitted: (String text) {
        eCtrl.clear();
    },
  ),
  actions: <Widget>[

    new FlatButton
    (
      onPressed: () {
        setState(() {
          showDialog = false;
          eCtrl.clear();
        });
      },
      child: new Text("OK")
    )
  ],
)
            
```

In the code, we are using `TextEditingController` to clear the screen once the text is submitted using `OK` button.

## 7.3: The importance of `TextEditingController`

In the last chapter, we have seen that we use `TextEditingController` as a mechanism for handling input texts. However, in the current scenario, a text can be submitted by pressing enter at `TextField` or by pressing `OK` button. Unfortunately, the callback handler `onPressed` of the button is not having the text and if we want to use the text entered by the user, we need to use 'TextEditingController'

## 7.4: Recap & Conclusion

In this chapter, we've seen how we can dynamically display the widgets on the `body` based on events.  Any real world application will always have something or other being displayed dynamically.

In the next chapter, we'll see more about displaying dynamic widgets

