import 'package:collegenews/screens/NavBar.dart';
import 'package:flutter/material.dart';
import '../models/article_model.dart';
import '../screens/article_screen.dart';
import '../widgets/bottom_nav_bar.dart';

class DiscoverScreen extends StatefulWidget {
  const DiscoverScreen({super.key});

  static const routeName = '/discover';

  @override
  _DiscoverScreenState createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> {
  late List<Article> displayedArticles;
  late List<Article> allArticles;

  @override
  void initState() {
    super.initState();
    allArticles = Article.articles;
    displayedArticles = allArticles;
  }

  void searchArticles(String query) {
    setState(() {
      // Filter the articles based on the search query
      displayedArticles = allArticles
          .where((article) =>
              article.title.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    List<String> tabs = ['Workshops', 'Competitions', 'Art', 'Examinations'];

    return DefaultTabController(
      initialIndex: 0,
      length: tabs.length,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const NavBar()),
              );
            },
            icon: const Icon(
              Icons.menu,
              color: Colors.black,
            ),
          ),
          title: const Text(
            'Discover',
            style: TextStyle(color: Colors.black),
          ),
        ),
        bottomNavigationBar: const BottomNavBar(index: 1),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _DiscoverNews(searchArticles: searchArticles),
            const SizedBox(height: 20),
            Expanded(
              child: TabBarView(
                children: tabs.map((tab) {
                  return ListView.builder(
                    itemCount: displayedArticles.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            ArticleScreen.routeName,
                            arguments: displayedArticles[index],
                          );
                        },
                        child: Card(
                          margin: const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 16),
                          child: ListTile(
                            contentPadding: const EdgeInsets.all(16),
                            leading: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.asset(
                                displayedArticles[index].imageUrl,
                                width: 80,
                                height: 80,
                                fit: BoxFit.cover,
                              ),
                            ),
                            title: Text(
                              displayedArticles[index].title,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            subtitle: Row(
                              children: [
                                const Icon(
                                  Icons.schedule,
                                  size: 18,
                                ),
                                const SizedBox(width: 5),
                                Text(
                                  '${DateTime.now().difference(displayedArticles[index].createdAt).inHours} hours ago',
                                  style: const TextStyle(fontSize: 12),
                                ),
                                const SizedBox(width: 20),
                                const Icon(
                                  Icons.visibility,
                                  size: 18,
                                ),
                                Text(
                                  '${displayedArticles[index].views} views',
                                  style: const TextStyle(fontSize: 12),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _DiscoverNews extends StatelessWidget {
  final Function(String) searchArticles;

  const _DiscoverNews({required this.searchArticles});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.15,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 5),
            Text(
              'Recent News',
              style: Theme.of(context).textTheme.bodyLarge,
              textAlign: TextAlign.left,
            ),
            const SizedBox(height: 10),
            const SizedBox(height: 10),
            TextFormField(
              onChanged: searchArticles,
              decoration: InputDecoration(
                hintText: 'Search',
                fillColor: Colors.grey.shade200,
                filled: true,
                prefixIcon: const Icon(
                  Icons.search,
                  color: Colors.grey,
                ),
                suffixIcon: const RotatedBox(
                  quarterTurns: 1,
                  child: Icon(
                    Icons.tune,
                    color: Colors.grey,
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
