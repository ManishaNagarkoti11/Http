import 'dart:convert';
import 'package:fhttp/widgets/post_card.dart';
import 'package:fhttp/widgets/user_card.dart';
import 'package:fhttp/models/user.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
class UserScreen extends StatefulWidget {
  @override
  _UserScreenState createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  List<User_Info>result=[];
  List<User_Info> users=[];
  Future<List> getUserFromServer() async {
    try {
      http.Response response = await http.get(
          "https://jsonplaceholder.typicode.com/users");
      if (response.statusCode == 200) {
        final List jsonDecodeData = jsonDecode(response.body);
        jsonDecodeData.forEach((element) {
          User_Info user =User_Info.fromJsonToInstance(element);
          users.add(user);
        });
        return users;
      }else{
        return [];
      }
    }catch(e){
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
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              margin: EdgeInsets.only(top: 50.0),
              child: TextField(
                onChanged: ( value){
                  value = value.toLowerCase();
                    List<User_Info> tempResult = users.where((element) {
                      String tempName = element.name.toLowerCase();
                      return tempName.contains(value);
                    }).toList();
                    setState(() {
                      result=tempResult ;
                    });

                },
                decoration: InputDecoration(
                  labelText: "Type to search",
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue,style: BorderStyle.solid),
                      borderRadius: BorderRadius.circular(50.0)),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: result.length==0? Center(child: Text("NOT FOUND"),)
           : ListView.builder(itemCount: result.length,itemBuilder: (context ,int a){
              return UserCard1(
                id:result[a].id,
                name: result[a].name,
                username: result[a].username,
                email: result[a].email,
                //address: data[a].address,
                phone: result[a].phone,
                website: result[a].website,
                // company: data[a].company,
              );
              // return Text(result[i],style: TextStyle(fontSize: 24),);
            }),
          ),
          SizedBox(
            height: 12.0,
          ),
          Expanded(
            flex: 2,
            child: Container(
              child: FutureBuilder(
                future: this.getUserFromServer(),
                builder: (BuildContext context,AsyncSnapshot asyncSnapshot){
                  if(asyncSnapshot.hasData){
                    List data = asyncSnapshot.data;
                    return ListView.builder(itemCount: data.length,itemBuilder: (context , int a){

                      return UserCard1(
                           id:data[a].id,
                           name: data[a].name,
                           username: data[a].username,
                           email: data[a].email,
                           //address: data[a].address,
                           phone: data[a].phone,
                           website: data[a].website,
                           // company: data[a].company,
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
          ),
        ],
      ),
    );
  }


}
