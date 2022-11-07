import 'package:flutter/material.dart';

const COLOR_BROWN = Color.fromRGBO(64,59,34,1.0);
const COLOR_LIGHT_BROWN = Color.fromRGBO(250, 237, 205, 1.0);
const COLOR_YELLOW = Color.fromRGBO(228, 193, 77, 1.0);
const COLOR_GREY = Color.fromRGBO(221, 221, 221, 1.0);

final BoxDecoration mainDecoration = BoxDecoration(
  image: DecorationImage(
    image: AssetImage('assets/background.png'),
    fit: BoxFit.cover,
  ),
);

//TODO add fonts here kind of as shown in https://www.youtube.com/watch?v=Y6xAQVXkhLA