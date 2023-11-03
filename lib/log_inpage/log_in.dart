import 'dart:convert';
import 'dart:developer';

import 'package:api_testpracticeall/log_inpage/style_login/style.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import 'package:http/http.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({super.key});

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  TextEditingController emailController =TextEditingController();
  TextEditingController passwordController =TextEditingController();
  void logIn(String email,dynamic password)async {
   try{
     // api link reqres.in theke newya hoyeche

     // create api use krchi and stutascode =201
    // Response response =await post(Uri.parse('https://reqres.in/api/users'),

     //Update method a stutascode=200
        // Response response =await put(Uri.parse('https://reqres.in/api/users/2'),

             // Resgister  api use krchi and stutascode =200
             // Response response =await post(Uri.parse('https://reqres.in/api/register'),

             //delete method use krchi
     Response response =await delete(Uri.parse('https://reqres.in/api/users/2'),
     body: {
       'email': email,
       'password': password,
     }
     );
     print(response.body);
     if(response.statusCode == 204){
       var data = jsonDecode(response.body.toString());
       print('account creates succesfully');
     }else{
       print('failed');
     }
   }catch(e){
     print(e.toString());
   }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.only(left: 25,right: 25,top: 150),
          child: Column(
            children: [
              TextFormField(
                controller: emailController,
                decoration: LogInEmailInputDecoration(),
              ),
              SizedBox(height: 10,),
              TextFormField(
                controller: passwordController,
                decoration: LogInPassInputDecoration(),
              ),
              SizedBox(height: 15,),
              GestureDetector(
                onTap: (){
                  logIn(emailController.text.toString(),passwordController.text.toString());

                },
                child: Container(
                  height: MediaQuery.of(context).size.height/15,
                  decoration:BoxDecoration(
                    color: Colors.green,

                  ),
                  child: Center(
                    child: Text('Register'),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
