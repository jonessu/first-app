import 'package:flutter/material.dart';
import 'list.dart';

class homescreen extends StatelessWidget {
  String value1, value2;
  homescreen({this.value1, this.value2});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Email : " + value1),
            Text("Password : " + value2),
            SizedBox(
              height: 40,
            ),
            RaisedButton(
              textColor: Colors.white,
              color: Colors.blue,
              child: Text('List View Screen'),
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => listviewname()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
