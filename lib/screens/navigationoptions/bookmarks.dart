import 'package:flutter/material.dart';

class Bookmark {
  final String eventName;
  final String eventDescription;
  final String eventUrl;

  Bookmark({
    required this.eventName,
    required this.eventDescription,
    required this.eventUrl,
  });
}

class BookmarksPage extends StatefulWidget {
  const BookmarksPage({super.key});

  @override
  _BookmarksPageState createState() => _BookmarksPageState();
}

class _BookmarksPageState extends State<BookmarksPage> {
  final List<Bookmark> _bookmarks = [
    Bookmark(
      eventName: 'Event 1',
      eventDescription: 'Description for Event 1',
      eventUrl: 'https://example.com/event1',
    ),
    Bookmark(
      eventName: 'Event 2',
      eventDescription: 'Description for Event 2',
      eventUrl: 'https://example.com/event2',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bookmarks', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue,
      ),
      body: ListView.builder(
        itemCount: _bookmarks.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(_bookmarks[index].eventName),
            subtitle: Text(_bookmarks[index].eventDescription),
            onTap: () {
              // Navigate to event description page (URL)
              // Assuming the eventUrl leads to the event's site
              // You can use webview_flutter or launch URLs in browser
              // For demonstration purposes, let's print the URL
              print(_bookmarks[index].eventUrl);
            },
            trailing: IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () {
                setState(() {
                  _bookmarks.removeAt(index);
                });
              },
            ),
          );
        },
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: BookmarksPage(),
  ));
}
