# Chapter - 0 : Background & Introduction

## 0.0: The evolution of Mobile Application Development 

Way back in late 1990's, people had to write the different set of codes (including javascript) so that the web page can display in a similar way in Internet Explorer and Netscape Navigator, the two prominent browsers of that time. This problem was later solved with standardization and uniform support of HTML & ECMAScript (aka JavaScript).

As of today when web pages are converting themselves into mobile applications, we're facing the similar situation. We need to code differently for Android and iOS( the two prominent mobile operating systems of the day).

Things have changed with the arrival of Facebook's React Native, where same JavaScript code can be used to create platform independent mobile apps. As of today, there are many JavaScipt frameworks for creating Mobile Apps e.g. meteorjs and vuejs to name a few.

## 0.1:  Welcome Flutter

Let's hail the new entrant called __"Flutter"__ from Google. The differentiating factor with flutter is that the code is written not in JavaScript but in __Dart__, a single threaded programming language like JavaScript. 

The benefit of writing a mobile application in flutter is that it directly generates arm binaries which allows the apps to run fast in the native environment as oppose to javascript frameworks which need a JavaScript bridge to convert JavaScript into Native code.

## 0.2: Flutter framework as Widget

Flutter made app development easy because it designs the screen using widgets.
- Everything that can be displayed on a screen is a widget. 
- Widgets can also act as a container on which can have multiple widgets. 
- The layouts, topbar, bottom bar or everything we can think of is a widget
- Widgets can be stateless (to display static items) or  stateful(to handle user interactions)

Typically a flutter application looks like this

![Flutter Widget Framework](https://github.com/DakshHub/Flutter_MobileApp_Development/blob/master/Chapter-%200/Widget%20Framework.png)

## 0.3: A short intro to Stateless and Stateful widget(s)

All widgets are categorized as either Stateful or Stateless widget. We're going to discuss the same in great details however at this moment we can consider Stateless widget as something which draws itself only once, while stateful widgets can redraw itself multiple time based on events like user input and timers.

## 0.4: A simple ToDo Application

Let's create a simple ToDo App using flutter Widgets of Flutter
