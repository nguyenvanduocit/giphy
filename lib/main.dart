import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:http/http.dart' as http;

import 'api.dart';
import 'model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Giphy Desktop',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String searchText = '';
  int page = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            TextField(
              onSubmitted: (String value) {
                setState(() {
                  searchText = value;
                  page = 0;
                });
              },
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Search',
              ),
            ),
            Row(
              children: [
                ElevatedButton(
                    onPressed: () {
                      if (page <= 0) {
                        return;
                      }

                      setState(() {
                        page--;
                      });
                    },
                    child: Text("Previous")),
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        page++;
                      });
                    },
                    child: Text("Next"))
              ],
            ),
            const SizedBox(height: 20),
            Expanded(
              child: FutureBuilder<SearchResponse>(
                future: searchText.isEmpty ? fetchTrending(http.Client()) : fetchPhotos(http.Client(), searchText, page: page),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (snapshot.hasData && snapshot.data != null) {
                    return MasonryGridView.count(
                      itemCount: snapshot.data!.data!.length,
                      crossAxisCount: 3,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      itemBuilder: (context, index) {
                        return PhotoWidget(item: snapshot.data!.data![index]);
                      },
                    );
                  } else if (snapshot.hasError) {
                    return Center(child: Text('${snapshot.error}'));
                  }
                  return const Center(child: Text("type something"));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PhotoWidget extends StatefulWidget {
  const PhotoWidget({
    Key? key,
    required PhotoItem item,
  })  : _item = item,
        super(key: key);

  final PhotoItem _item;

  @override
  State<StatefulWidget> createState() => _PhotoWidgetState();
}

class _PhotoWidgetState extends State<PhotoWidget> {
  bool clicked = false;
  Timer? _timer;
  int _start = 0;

  void startTimer() {
    if (_start > 0) {
      return;
    }

    _start = 2;
    setState(() {
      clicked = true;
    });

    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 0) {
          setState(() {
            clicked = false;
            timer.cancel();
          });
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        startTimer();
        Clipboard.setData(ClipboardData(text: widget._item.images!.original!.url));
      },
      child: AspectRatio(
        aspectRatio: widget._item.images!.downsized!.width! / widget._item.images!.downsized!.height!,
        child: Stack(children: [
          Image(
            image: NetworkImage(widget._item.images!.downsized!.url!),
          ),
          Center(child: clicked ?  const Icon(Icons.check_circle, color: Colors.white, size: 40) : const SizedBox()),
        ]),
      ),
    );
  }
}
