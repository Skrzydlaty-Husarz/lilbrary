import 'package:flutter/material.dart';
import 'package:http/http.dart';

void main() {
  runApp(
    MaterialApp(
      home: PageJeden(),
    ),
  );
}

Future<Response> fetchAlbum() {
  return get(Uri.https('api.sampleapis.com', 'futurama/info'));
}

class PageJeden extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder<Response>(
          future: fetchAlbum(),
          builder: (BuildContext context, AsyncSnapshot<Response> snapshot) {
            if (snapshot.hasData) {
              return Text(snapshot.data.toString());
            }
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
