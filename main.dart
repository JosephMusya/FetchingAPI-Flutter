import '../views/video_cell.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var _isLoading = false;
  var video_length;
  var videos;
  Future _fetchData() async {
    setState(() {
      _isLoading = true;
    });
    print('Fetching...');
    //const url = 'http://api.letsbuildthatapp.com/youtube/home_feed';
    // var url =
    //     Uri.https('www.googleapis.com', '/books/v1/volumes', {'q': '{http}'});
    //final response = await http.get(Uri.https(url));

    var url = Uri.parse('http://api.letsbuildthatapp.com/youtube/home_feed');
    var response = await http.get(url);
    print("STATUS CODE ${response.statusCode}");
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final List video = data["videos"];
      this.videos = video;
      video_length = video.length;
      print(video_length);

      //print(video['name']);
      //final img = data['pic'];
      setState(() {
        _isLoading = false;
      });
    } else {
      throw Exception('Failed');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {
                  setState(() {
                    print("Pressed");
                  });
                  _fetchData();
                },
                icon: const Icon(Icons.refresh))
          ],
          title: const Text('Videos'),
        ),
        body: Center(
          child: _isLoading
              ? const CircularProgressIndicator()
              : ListView.builder(
                  itemCount: video_length,
                  itemBuilder: (context, i) {
                    final video_to_disp = videos[i];
                    return FlatButton(
                      child: VideoCell(video_to_disp),
                      onPressed: () {},
                    );
                  },
                ),
        ),
      ),
    );
  }
}
