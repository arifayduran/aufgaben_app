/*
Baue zunächst die drei Screens unten nach.
News
Profil
Likes
assets/images/navigationbar.png
--
Erstelle nun ein StatefulWidget names “AppHome”. Das Widget soll zunächst nur ein Scaffold mit AppBar und Titel beinhalten. 
Erstelle zur Vorbereitung für eine NavigationBar eine variable currentIndex und eine Liste “screens” aus den
drei Screen Widgets aus Aufgabe 1 in deinem StatefulWidget-State.
(Im Folgenden sollst du damit über die onDestinationSelected Funktion auf den richtigen Screen verweisen.)
--
Füge eine NavigationBar zu deinem AppHome Widget hinzu. 
Die “Destinations” der NavigationBar sollen dabei auf die drei Screens aus Aufgabe 1 führen. 


*/

import 'package:flutter/material.dart';

class NavigationBarWithLike extends StatefulWidget {
  const NavigationBarWithLike({super.key});

  @override
  State<NavigationBarWithLike> createState() => _NavigationBarWithLikeState();
}

class _NavigationBarWithLikeState extends State<NavigationBarWithLike> {
  Map<String, Widget> screens = {
    "News": const NewsScreen(),
    "Likes": const LikesScreen(),
    "Profile": const ProfileScreen(),
  };
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(screens.keys.toList()[currentIndex]),
          centerTitle: true,
          backgroundColor: Colors.lightGreen,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        body: screens.values.toList()[currentIndex],
        bottomNavigationBar: NavigationBarTheme(
          data: NavigationBarThemeData(
            labelTextStyle: WidgetStateProperty.resolveWith<TextStyle>(
              (Set<WidgetState> states) => states.contains(WidgetState.selected)
                  ? const TextStyle(color: Colors.white)
                  : const TextStyle(color: Color.fromARGB(255, 200, 255, 132)),
            ),
            iconTheme: WidgetStateProperty.resolveWith<IconThemeData>(
              (Set<WidgetState> states) => states.contains(WidgetState.selected)
                  ? const IconThemeData(color: Colors.white)
                  : const IconThemeData(
                      color: Color.fromARGB(255, 200, 255, 132)),
            ),
          ),
          child: NavigationBar(
            destinations: const [
              NavigationDestination(
                icon: Icon(
                  Icons.newspaper,
                ),
                label: "News",
              ),
              NavigationDestination(
                icon: Icon(
                  Icons.favorite,
                ),
                label: "Likes",
              ),
              NavigationDestination(
                icon: Icon(
                  Icons.person,
                ),
                label: "Profile",
              )
            ],
            selectedIndex: currentIndex,
            onDestinationSelected: (index) {
              setState(() {
                currentIndex = index;
              });
            },
            backgroundColor: Colors.lightGreen,
            elevation: 3,
            indicatorColor: const Color.fromARGB(255, 64, 152, 67),
          ),
        ));
  }
}

class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "News  ",
                style: TextStyle(fontSize: 29),
              ),
              Icon(
                Icons.newspaper,
                size: 50,
              ),
            ],
          ),
          SizedBox(
            height: 400,
            child: ListView.builder(
              itemCount: news.length,
              itemBuilder: (context, index) {
                final News newsItem = news.keys.toList()[index];
                final bool isLiked = news[newsItem]!;
                return ListTile(
                    leading: Image.asset("assets/images/noimage.jpg"),
                    title: Text(news.keys.toList()[index].title),
                    subtitle: Text(news.keys.toList()[index].description),
                    horizontalTitleGap: 30,
                    dense: true,
                    trailing: GestureDetector(
                      onTap: () {
                        setState(() {
                          news[newsItem] = !isLiked;
                          if (isLiked) {
                            favoriteNews.remove(newsItem);
                          } else {
                            favoriteNews.add(newsItem);
                          }
                        });
                      },
                      child: Icon(
                        Icons.favorite,
                        color: isLiked ? Colors.red : Colors.grey,
                      ),
                    ));
              },
            ),
          ),
        ],
      ),
    );
  }
}

class LikesScreen extends StatefulWidget {
  const LikesScreen({super.key});

  @override
  State<LikesScreen> createState() => _LikesScreenState();
}

class _LikesScreenState extends State<LikesScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(27.0),
        child: Column(
          children: [
            const Text(
              "Likes",
              style: TextStyle(fontSize: 25),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Hier findest du deine geliketen Nachrichten.",
              style: TextStyle(fontSize: 20),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              height: 400,
              child: ListView.builder(
                itemCount: favoriteNews.length,
                itemBuilder: (context, index) {
                  final News newsItem = favoriteNews[index];
                  return ListTile(
                    leading: Image.asset("assets/images/noimage.jpg"),
                    title: Text(favoriteNews[index].title),
                    subtitle: Text(favoriteNews[index].description),
                    dense: true,
                    horizontalTitleGap: 30,
                    trailing: GestureDetector(
                      onTap: () {
                        setState(() {
                          news[newsItem] = false;
                          favoriteNews.remove(newsItem);
                        });
                      },
                      child: const Icon(
                        Icons.favorite,
                        color: Colors.red,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Padding(
        padding: EdgeInsets.all(27.0),
        child: Column(
          children: [
            Text(
              "Profile",
              style: TextStyle(fontSize: 25),
            ),
            SizedBox(
              height: 20,
            ),
            Icon(
              Icons.person,
              size: 50,
            ),
            Text(
              "Max Mustermann",
              style: TextStyle(fontSize: 20),
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}

/////////////////////////////////////

Map<News, bool> news = {
  News("News 1", "Description 1"): false,
  News("News 2", "Description 2"): false,
  News("News 3", "Description 3"): false,
  News("News 4", "Description 4"): false,
  News("News 5", "Description 5"): false,
  News("News 6", "Description 6"): false,
  News("News 7", "Description 7"): false,
  News("News 8", "Description 8"): false,
  News("News 9", "Description 9"): false,
};

List<News> favoriteNews = [];

class News {
  String title;
  String description;

  News(this.title, this.description);
}

Icon isLikedTrue() {
  return const Icon(
    Icons.favorite,
    color: Colors.red,
  );
}

Icon isLikedFalse() {
  return const Icon(
    Icons.favorite,
  );
}
