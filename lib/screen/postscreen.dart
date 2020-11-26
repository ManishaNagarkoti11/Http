import 'dart:convert';
import 'package:fhttp/widgets/post_card.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart 'as http;
import 'package:fhttp/models/Post.dart';
class PostScreen extends StatefulWidget {
  @override
  _PostScreenState createState() => _PostScreenState();
}
class _PostScreenState extends State<PostScreen>
{
  List posts=[];
  Future<List> getPostFromServer() async{
    try {
      http.Response response = await http.get(
          "https://jsonplaceholder.typicode.com/posts");
      if (response.statusCode == 200) {
        final List jsonDecodeData = jsonDecode(response.body);
        jsonDecodeData.forEach((element) {
          Post post = Post.fromJsonToInstance(element);
          posts.add(post);
        });
        return posts;
      } else {
        return [];
      }
      } catch (e) {
      throw e;
    }
  }
  @override
  void initState(){
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: FutureBuilder(
          future: this.getPostFromServer(),
          builder: (BuildContext context, AsyncSnapshot asyncSnapshot){
            //print(asyncSnapshot.hasError);
            if(asyncSnapshot.hasData){
              List data = asyncSnapshot.data;
              return ListView.builder(itemCount:data.length,
                  itemBuilder: (context ,int i)
              {
                //return Text("e");
          return Card2(
          userId:data[i].userID,
           id: data[i].id,
            title: data[i].title,
            body: data[i].body,
              );
              });
            }else if(asyncSnapshot.hasError){
              print(asyncSnapshot.error);
              return Container(
                alignment: Alignment.center,
                child: Text("Error"),
              );
            }else{
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
