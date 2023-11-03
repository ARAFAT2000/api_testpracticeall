import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;

class ImagesShow extends StatefulWidget {
  const ImagesShow({super.key});

  @override
  State<ImagesShow> createState() => _ImagesShowState();
}

class _ImagesShowState extends State<ImagesShow> {
  Future getImages()async{
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));
    print(response.statusCode);
    return jsonDecode(response.body);
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Images show In Api'),
      ),
      body: FutureBuilder(future: getImages(),
          builder: (context,snapshot){
        if(snapshot.hasData){
          return ListView.builder(
              itemBuilder: (context,index){
                return ListTile(
                  leading: Image.network(snapshot.data[index]['thumbnailUrl'].toString()),
                  title: Text(snapshot.data[index]['title']),
                );
              });
        }
                return CircularProgressIndicator();
          }),
      
    );
  }
}
