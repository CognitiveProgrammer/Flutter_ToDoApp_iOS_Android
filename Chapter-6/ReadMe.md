# Chapter- 6: Handling User Inputs

Handling user inputs are an integral part of mobile app development. Whether it's a chat application, maintaining a to-do list or replying to an email, all required handling of user input in the form of a text.

In this chapter, we will learn about user input handling and take action on associated events

## 6.0:  Using TextField Widget

As the name suggests, `TextField` widget is used for taking input text from the end user. The `TextField` widget can be created inside the body of a `Scaffold` as 

```
  new TextField
  (

  )
```
Many a time we define a text hind in the text fields, these hints can be displayed using `decoration:` constructor parameter which takes`InputDecoration` as input. For example, to display a hint `ADD SOMETHING`, we should write the code as

```
 decoration: new InputDecoration.collapsed(hintText: "ADD SOMETHING")
```
## 6.1:  Handling TextField User Input Actions

`TextField Widget` allows us to handle two type of user Inputs 

1. When we user types a character, or delete a character, or delete a set of characters, an event called `onChanged(...)` is called.  This could be used for variety of reasons including but not limited to spell check etc

2. When the user submits the text, an event called `onSubmitted(...) gets called. This event could be used for taking appropriate actions on the submitted text. 

We can create a `Text Widget` which can be updated with the new text using `setState(...)`.  The code for both the events shall look like this

```
String value = "";
...
...
 onChanged: (String text) {
    setState((){
      value = text;
    });
  },
  onSubmitted: (String text) {
    setState((){
      value = text;
     });
  },
```

For properly handling the Text Input, like clearing the texts once it's submitted, we need to use `TextEditingController` as a `controller` of the `TextField widget` as depicted in the code below

```
 TextEditingController eCtrl = new TextEditingController();
 ...
 ...
  new TextField
  (
    controller: eCtrl,
    decoration: new InputDecoration.collapsed(hintText: "ADD SOMETHING"),
    onChanged: (String text) {
      setState((){
        value = text;
      });
    },
    onSubmitted: (String text) {
      setState((){
        value = text;
        eCtrl.clear();
      });
    },
  ),
```
## 6.2: Recap and Conclusion

In this chapter, we have seen how to handle user inputs and respond to them
