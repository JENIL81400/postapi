import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:post_api_demo/apidemo.dart';

void main() {
  runApp( MaterialApp(home: demo(),));
}

class demo extends StatefulWidget {

  @override
  State<demo> createState() => _demoState();
}

class _demoState extends State<demo> {

  List<apidemo> list=[];
  apidemo? m;
  bool isLoading = true;

  get()
  async {

    var url = Uri.parse('https://jenilzalavadiya.000webhostapp.com/test.php');
    var response = await http.post(url);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    Map<String,dynamic> data = jsonDecode(response.body);

    if(response.statusCode == 200)
    {
        m = await apidemo.fromJson(data);
        if(m!=null)
          {
            setState((){
              isLoading = false;
            });
          }
        else{
          print("null");
        }
      }else{
      print("null");
    }

    setState((){
      m=apidemo.fromJson(data);
    });


  }

  @override
  void initState(){
    super.initState();
    get();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: isLoading? Center(
        child: CircularProgressIndicator(),
      ): ListView.builder(
          itemCount: m!.data!.length,
          itemBuilder: (context, index)  {
            return Column(
              children: [
                ListTile(
                  leading: Text("${m!.data![index].id}"),
                )
              ],
            );
          },)
    );
  }
}
