import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get_x/Models/posts_models.dart';
import 'package:http/http.dart' as http;

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<PostsModel> postlist = [];
    Future<List<PostsModel>> getPostApi() async {
      final response = await http
          .get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
      var Data = jsonDecode(response.body.toString());
      if (response.statusCode == 200) {
        for (Map i in Data) {
          postlist.add(PostsModel.fromJson(i));
        }
        return postlist;
      } else {
        throw Exception('Failed to load post');
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
          child: Column(
        children: [
          Expanded(
            child: FutureBuilder(
                future: getPostApi(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Text("loading");
                  } else {
                    return ListView.builder(
                        itemCount: postlist.length,
                        itemBuilder: ((context, index) {
                          return Card(
                            child: Column(
                              children: [
                                Text(postlist[index].title.toString()),
                                Text(postlist[index].body.toString()),
                              ],
                            ),
                          );
                        }));
                  }
                }),
          ),
        ],
      )),
    );
  }
}
