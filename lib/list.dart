import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class listviewname extends StatefulWidget {
  @override
  _listviewnameState createState() => _listviewnameState();
}

class _listviewnameState extends State<listviewname> {
  final url = "https://restcountries.eu/rest/v2/name/india";
  var _postJson = [];
  void fetchPosts() async {
    try {
      final response = await get(Uri.parse(url));
      final jsondata = jsonDecode(response.body) as List;
      setState(() {
        _postJson = jsondata;
      });
    } catch (err) {}
  }

  @override
  void initState() {
    super.initState();
    fetchPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List View"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 240,
              child: ListView.builder(
                  itemCount: _postJson.length,
                  itemBuilder: (context, index) {
                    final post = _postJson[index];
                    return ListTile(
                      title: Text("${post["name"]}"),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
