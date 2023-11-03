import 'package:api_testpracticeall/reg_to_log/imageshow/images.dart';
import 'package:api_testpracticeall/reg_to_log/postdata.dart';
import 'package:api_testpracticeall/reg_to_log/testapi.dart';
import 'package:flutter/material.dart';

import 'log_inpage/log_in.dart';



void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LogInPage(),
    );
  }
}
