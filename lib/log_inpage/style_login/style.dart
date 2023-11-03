import 'package:flutter/material.dart';


InputDecoration LogInEmailInputDecoration(){
  return InputDecoration(
      hintText: 'Email',
      filled: true,
      enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
              width: 1,color: Colors.green
          )
      ),
      border: OutlineInputBorder()
  );
}

InputDecoration LogInPassInputDecoration(){
  return InputDecoration(
      hintText: 'Password',
      filled: true,
      enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
              width: 1,color: Colors.green
          )
      ),
      border: OutlineInputBorder()
  );
}

TextStyle ButtonTextStyle(){
  return TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold
  );
}