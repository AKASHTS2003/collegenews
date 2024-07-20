import 'package:collegenews/screens/navigationoptions/bookmarks.dart';
import 'package:collegenews/screens/navigationoptions/mypost/addphoto.dart';
import 'package:collegenews/screens/navigationoptions/mypost/myposts.dart';
import 'package:collegenews/screens/navigationoptions/remainder/remainder.dart';
import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Stack(
        children: [
          ListView(
            padding: EdgeInsets.zero,
            children: [
              const UserAccountsDrawerHeader(
                accountName: Text('Group9'),
                accountEmail: Text('example1@email.com'),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: AssetImage('assets/images/girl-profile.png'),
                  radius: 50, // Set the radius according to your preference
                ),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  image: DecorationImage(
                    image: AssetImage('assets/images/profile-bg3.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.add_alert_outlined),
                title: const Text('Reminders'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const RemainderPage(),
                    ),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.bookmark_outline),
                title: const Text('Bookmarks'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const BookmarksPage()),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.art_track_outlined),
                title: const Text('My Post'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const MyPostPage(
                              posts: [],
                            )), // Pass posts here
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.add_a_photo_outlined),
                title: const Text('Add Photos'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AddPhotosPage()),
                  );
                },
              ),
            ],
          ),
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: IconButton(
                icon: const Icon(Icons.close),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
