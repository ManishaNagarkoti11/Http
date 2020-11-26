
import 'package:flutter/foundation.dart';

class Post{
  final int userID;
  final  int id;
  final String title;
  final String body;

  Post({this.userID, this.id, this.title, this.body});
  factory Post.fromJsonToInstance(Map<String,dynamic>data){
    return Post(
          userID: data['userId'],
          id: data['id'],
          title: data['title'],
          body: data['body'],

    );
  }
}
