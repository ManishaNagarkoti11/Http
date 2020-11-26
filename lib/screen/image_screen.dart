import 'dart:convert';
import 'package:fhttp/widgets/card1.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import 'package:fhttp/widgets/card1.dart';
import 'package:fhttp/models/Ablum.dart';
class ImageScreen extends StatefulWidget {
  @override
  _ImageScreenState createState() => _ImageScreenState();
}

class _ImageScreenState extends State<ImageScreen> {
  List albums = [];
  Future<List> getImagesFromServer() async {
    try {
      http.Response response =
      await http.get("https://jsonplaceholder.typicode.com/photos");
      if (response.statusCode == 200) {
        final List jsonDecodeData = json.decode(response.body);
        jsonDecodeData.forEach((element) {
          Album album = Album.fromJsonToInstance(element);
          albums.add(album);
        });
        return albums;
      } else {
        return [];
      }
    } catch (e) {
      throw e;
    }
  }

  @override
  void initState() {
    // this.getImagesFromServer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: FutureBuilder(
            future: this.getImagesFromServer(),
            builder: (BuildContext context, AsyncSnapshot asyncSnapshot) {
              print(asyncSnapshot.hasError);
              if (asyncSnapshot.hasData) {
                List<Album> data = asyncSnapshot.data;
                // print(data.length);
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: data.length,
                  itemBuilder: (BuildContext context, int i) {
                    // return Text("$i");
                    // return Container();
                    return Card1(
                      image: data[i].thumnailUrl,
                      title: data[i].title,
                      id: data[i].id,
                    );
                  },
                );
              } else if (asyncSnapshot.hasError) {
                return Container(
                  alignment: Alignment.center,
                  child: Text("Error"),
                );
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          )),
    );
  }
}
