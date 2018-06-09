# Chapter- 5: Adding Actions to Application Bar

Most of the applications provide some sort of actions at the Application bar including the three dots, which provides application wide options.  These options play a very important role in user navigation and invocation of functionalities.

In this chapter, we shall see how to create those actions in the application bar.

## 5.0: Adding actions on AppBar

The `AppBar` constructor provides an optional parameter called `action: `. where we can create buttons, icons, etc and invoke respective actions on them. As an example for this chapter, I'm adding two `Icons` in the application bar, one for adding and another for removing.

Just like `FlatButton`, the icon actions can also be handled using `onPressed(...)` and we can redraw the Widget using `setState(...)`

To verify the actions, I'm creating a string called `text` the value of which shall be set differently for different actions and that will be displayed on the screen.

The code for `AppBar` with actions shall look like this

```
 String text = "";
 ...
 ...
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
)
...
...
body: new Column
  (
    children: <Widget>
    [
      widget.cText,
      new Text("Value => $text")
    ],
  ),

```
The `text` value displayed on screen shall changed based on the Icon we click

## 5.2: Adding PopupMenu in Application Bar

Along with normal action items, it's a norm to add popup menu items which are depicted by 3 dots. These 3 dots contains popup menus with application wide options.

We can create the PopupMenu using `PopupMenuButton Widget`. As an example for this chapter, I'm creating two `FlatButton` and the actions associated with calling them. 

The code for `PopupMenuButton` shall look like this

```
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

``` 

`TestEnum` is necessary to complete the syntax, there are other ways to generate the PopupMenuItem from iterating through an enumerator, but if we have just one or two items, then this approach is simpler in nature

## 5.3: Recap & Conclusion

In this chapter we have seen how to add actions to the application bar and how to add PopupMenuItem

