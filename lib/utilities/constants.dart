import 'package:flutter/material.dart';

const kMessageTextStyle =
    TextStyle(fontFamily: 'Spartan MB', fontSize: 40.0, color: Colors.white);

const kButtonTextStyle =
    TextStyle(fontSize: 30.0, fontFamily: 'Spartan MB', color: Colors.white);

const kConditionTextStyle = TextStyle(
  fontSize: 90,
);

const kTextFieldInputDecoration = InputDecoration(
  filled: true, // заполненный контейнер
  fillColor: Colors.white, //цвет заполненного контейнера
  icon: Icon(
    Icons.location_city,
    color: Colors.white,
  ),
  hintText: 'Напиши название Города',
  hintStyle: TextStyle(color: Colors.grey),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(10.0),
    ),
    borderSide: BorderSide.none, //убрать пограничное поле
  ),
);
