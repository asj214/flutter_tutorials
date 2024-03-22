import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_tutorials/constants.dart';

class PhotoList extends StatefulWidget {
  const PhotoList({super.key});

  @override
  State<PhotoList> createState() => _PhotoList();
}

class _PhotoList extends State<PhotoList> {

  final double spacing = 10.0;

  Future<List<dynamic>> fetchPhotos() async {
    final response = await http.get(Uri.parse(photoApiUrl));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load photos');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Tutorial',
        ),
      ),
      body: Container(
        margin: EdgeInsets.only(top: spacing),
        child: FutureBuilder(
          future: fetchPhotos(),
          builder: (context, snapshot) {
            final data = snapshot.data;
            if (data != null) {
              return GridView.builder(
                itemCount: data.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: spacing,
                  mainAxisSpacing: spacing,
                ),
                itemBuilder: (context, index) {
                  return Image.network(data[index]['thumbnailUrl']);
                },
              );
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else {
              return Center(child: Text('Error: ${snapshot.error}'));
            }
          }
        )
      )
    );
  }
}