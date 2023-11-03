
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'imageshow/Modelforpostdata/datamodel.dart';
import 'dart:convert';


class PostApi extends StatefulWidget {
  const PostApi({super.key});

  @override
  State<PostApi> createState() => _PostApiState();
}
//final<DataModel>  _dataModel =[];


class _PostApiState extends State<PostApi> {

  TextEditingController nameController=TextEditingController();
  TextEditingController jobController=TextEditingController();
  Future<DataModel?> postoption(String name,String job)async{
    final response = await http.post(Uri.http('reqres.in','api/users'),
        body: {
          " name ": name,'job': job
        });
    var data =response.body;
    print(data);

    if(response.statusCode == 201){
      String responseString = response.body;

    }else  null;

    Future<DataModel> dataModelFromJson(String jsonString) async {
      final jsonData = json.decode(jsonString);
      return DataModel(name: name, job: job, id: '101');
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Post Api'),
      ),
     body: Padding(
       padding: const EdgeInsets.all(8.0),
       child: Column(
         children: [
           TextFormField(
             controller: nameController,
             decoration: InputDecoration(
               hintText: 'name'
             ),
           ),
           SizedBox(
             height: 10,
           ),
           TextFormField(
             controller: jobController,
             decoration: InputDecoration(
                 hintText: 'home'
             ),
           ),
           SizedBox(
             height: 10,
           ),
           ElevatedButton(onPressed: ()async{
               DataModel _dataModel;
             String name =nameController.text;
             String job = jobController.text;
                 DataModel? data= await postoption(name,job);
             setState(() {
               _dataModel =data!;
             });
           },
               child: Text('Post '))
         ],
       ),
     ),
    );
  }
}

