import 'package:flutter/material.dart';
import 'package:World_time/Pages/home.dart';
import 'package:World_time/Pages/loading.dart';
import 'package:World_time/Pages/choose_location.dart';

void main() =>runApp(MaterialApp(
  initialRoute: '/',
  routes: {
    '/':(context) => Loading(),
    '/home':(context) => Home(),
    '/location':(context) => ChooseLocation(),
  },
));
