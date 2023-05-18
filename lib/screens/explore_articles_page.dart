import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../common/constants.dart';

class ExploreArticles extends StatefulWidget {
  const ExploreArticles({Key? key}) : super(key: key);

  @override
  State<ExploreArticles> createState() => _ExploreArticlesState();
}

class _ExploreArticlesState extends State<ExploreArticles> {
  List<dynamic> articles = [];

  @override
  initState() {
    super.initState();
    apiCalling();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: const Text(
          'Explore Articles',
          style: appBarText,
        ),
        elevation: 0,
        backgroundColor: Colors.indigo,
      ),
      body: ListView.builder(
        itemCount: articles.length,
        itemBuilder: (context, index) {
          final a = articles[index];
          final imageUrl = a['urlToImage'];
          if (imageUrl != null) {
            return
              Column(
                children: [
                  Center(
                    child: Column(
                      children: [
                        InkWell(
                          child: Container(
                            height: 140,
                            margin: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: const Color(0xff7c94b6),
                              image: DecorationImage(
                                image: NetworkImage(imageUrl),
                                fit: BoxFit.cover,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ArticlesView(todo: articles[index]),
                              ),
                            );
                          },
                        )
                      ],
                    ),
                  ),
                ],
              );
          }
        },
      ),
    );
  }
  void apiCalling () async {
    const url = 'https://newsapi.org/v2/everything?q=apple&from=2023-05-09&to=2023-05-09&sortBy=popularity&apiKey=91da813482064ba89a97c1258cb20e5a';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body);
    setState(() {
      articles = json['articles'];
    });
  }
}

class ArticlesView extends StatelessWidget {

  const ArticlesView({super.key, required this.todo});

  final dynamic todo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: const Text(
          'Explore Articles',
          style: appBarText,
        ),
        elevation: 0,
        backgroundColor: Colors.indigo,
      ),
      body: Column(
        children: [
          Center(
            child: Column(
              children: [
                Center(
                  child: Container(
                    height: 180,
                    margin: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: const Color(0xff7c94b6),
                      image: DecorationImage(
                        image: NetworkImage(todo['urlToImage']),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                Center(
                  child: Container(
                    height: 180,
                    margin: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        Text(
                            todo['description'],
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.normal
                            )
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
