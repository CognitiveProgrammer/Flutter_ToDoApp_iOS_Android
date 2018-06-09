# Chapter- 8: Dynamically building Widget 

Even the simplest of applications like a ToDo Application, we need to display content dynamically.  In a ToDo list, users can add ToDo at any point in time, and it should be reflected somewhere in some widget which should load it dynamically.

In `Flutter` it's possible to dynamically build the `widgets` based on changing contents. Many widgets provide a mechanism called '`itemBuilder` which generates dynamic widgets. 

One such widget which used `itemBuilder` is `ListView.Builder` which can be used inside the `Flexible` widget.

## 8.0: Displaying the texts entered by user in Alert Dialog

In the last chapter, we have created an `Alert Dialog` with text input and an ok button. Let's store the text inputs and start displaying the same on the screen. 

First, to create a storage of texts, I'll use a `List<String> array` created as empty in the widget.

```
List<String> textList = [];
```

Then, I'll change the implementation of `OK` button on the `Alert Dialog` to add the text to this `Array`

```
 new FlatButton
(
  onPressed: () {
    setState(() {
      showDialog = false;
      textList.add(eCtrl.text);  // added to the array
      eCtrl.clear();
    });
  },
)
```

Next, I'll create a dynamic builder using `ListView.builder` to display all of the list items. The `itemBuilder` is akin to a for loop which will run for the `count` which will come from the length of List array

```
new Flexible
(
    child: new ListView.builder
    (
      itemCount: textList.length,
      itemBuilder: (_, int index) {
        return new Column
          (
          children: <Widget>[
                new Text(textList[index])
          ],
        );
      }
  )
)
```


This will display the all the items as inserted into the list

## 8.1: Displaying multiple Widgets dynamically

The `itembuilder` can use to display multiple widgets, for example, we can create a `Checkbox` corresponding to the each entry of the text. This is done as

```
new Flexible
(
    child: new ListView.builder
    (
      itemCount: textList.length,
      itemBuilder: (_, int index) {
        return new Row
          (
          children: <Widget>[
            new Checkbox(
            value : false,
            onChanged:(bool newValue) {}
            ),
            new Text(textList[index])
          ],
        );
      }
  )
```

## 8.2: Recap & Conclusion

After completing this chapter, we've almost learned all the things necessary to create a simple ToDo application. 

As you might have guessed, the only thing pending is to remove items from the list and the next chapter will implement that. 

Feel free to take the challenge and implement it yourself before looking into the next chapter

