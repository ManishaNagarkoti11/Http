import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class TestScreen extends StatefulWidget {
  @override
  _TestScreenState createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
      body: Container(
        height: 150,
        //margin: const EdgeInsets.all(15.0),
        padding: const EdgeInsets.all(3.0),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black)
        ),
       margin: EdgeInsets.only(top:50.0),
        //padding: EdgeInsets.all(20.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          //mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: 200.0,
              height: 150.0,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQsiU_UWrgRr9Gi5d-DKsEwaTMBAwCko6qrrA&usqp=CAU"
                      ),
                      fit: BoxFit.cover
                  ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.all(8.0),
                    padding: const EdgeInsets.all(3.0),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                    ),
                    child: Column(
                      children: [
                        RichText(
                          text: TextSpan(
                            text: 'R',
                            style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 40,letterSpacing: 3.5),
                            children: <TextSpan>[
                              TextSpan(text: 'O', style: TextStyle(fontSize: 30,decoration:TextDecoration.underline,fontWeight: FontWeight.bold)),
                              TextSpan(text: 'ZES'),
                            ],
                          ),
                        ),
                        Text("hasjhskahskjahsjkahdj",style: TextStyle(fontSize: 16),),
                      ],
                    ),
                  ),
                ],
              ),

            ),
            SizedBox(
              width: 12.0,
            ),
            Container(
              //padding: EdgeInsets.all(20.0),
              margin: EdgeInsets.all(8.0),
              //alignment: Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Rozes",style: TextStyle(fontSize: 32.0,fontWeight: FontWeight.bold),),
                  SizedBox(height: 12.0,),
                  Text("Under the Grave",style: TextStyle(fontSize: 24,fontWeight: FontWeight.w400),),
                  Text("(2016)",style: TextStyle(fontSize: 24,fontWeight: FontWeight.w400),),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
