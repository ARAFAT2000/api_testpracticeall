import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class TestApi extends StatefulWidget {
  const TestApi({super.key});

  @override
  State<TestApi> createState() => _TestApiState();
}

class _TestApiState extends State<TestApi> {

  Future  getApi()async{
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts/'));
    print(response.statusCode);
    return jsonDecode(response.body);

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Test Api'),
      ),
      body:FutureBuilder(
          future: getApi(),
          builder:(context ,snapshot){
            if(snapshot.hasData){
              return ListView.builder(
                itemCount: snapshot.data.length,
                  itemBuilder: (context,index){
                    return Card(
                      child: ListTile(
                        // int to String Convert =  add toString
                        //leading:Text(snapshot.data[index]['userId'].toString()) ,
                        title: Text(snapshot.data[index]['title']),
                        subtitle: Text(snapshot.data[index]['id'].toString()),
                      ),
                    );
                  });
            }
            return CircularProgressIndicator();
          })
    );
  }
}
