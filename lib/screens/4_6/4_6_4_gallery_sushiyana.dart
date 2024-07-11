import 'package:flutter/material.dart';

const Map<String, String> _mainItems = {
  "Suppen": 'assets/images/gallery_sushiyana/suppe.jpg',
  "Vorspeisen": 'assets/images/gallery_sushiyana/vorspeise.jpg',
  "Salate": 'assets/images/gallery_sushiyana/salat.jpg',
  "Sommerrollen": 'assets/images/gallery_sushiyana/sommerrolle.jpg',
  "Sushis": 'assets/images/gallery_sushiyana/sushi.jpg',
  "Warme Kücke": 'assets/images/gallery_sushiyana/warme.jpg',
  "Bowls": 'assets/images/gallery_sushiyana/bowl.jpg',
  "Desserts": 'assets/images/gallery_sushiyana/dessert.jpg',
  "Getränke": 'assets/images/gallery_sushiyana/getraenke.jpg',
  "Extras": 'assets/images/gallery_sushiyana/extras.jpg',
};

const Color yanaColor = Color.fromARGB(255, 106, 36, 119);

class GallerySushiyana extends StatefulWidget {
  const GallerySushiyana({super.key});

  @override
  _GallerySushiyanaState createState() => _GallerySushiyanaState();
}

class _GallerySushiyanaState extends State<GallerySushiyana>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final PageController _pageController = PageController();
  String? _selectedHeroTag;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _tabs.length, vsync: this);
    _tabController.addListener(() {
      if (_tabController.indexIsChanging) {
        _pageController.animateToPage(
          _tabController.index,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    _pageController.dispose();
    super.dispose();
  }

  void _onItemTapped(String heroTag) {
    setState(() {
      _selectedHeroTag = heroTag;
    });
    _pageController.animateToPage(1,
        duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
    _tabController.animateTo(1);
  }

  void _onBack() {
    _pageController.animateToPage(0,
        duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
    _tabController.animateTo(0);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _tabs.length,
      child: Scaffold(
        backgroundColor: Colors.black,
        bottomNavigationBar: const ImpressumBar(),
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                expandedHeight: 250.0,
                toolbarHeight: 40,
                floating: false,
                leading: IconButton(
                  icon: const Icon(
                    Icons.arrow_back_ios_new,
                    color: Colors.black,
                  ),
                  onPressed: () {},
                ),
                pinned: true,
                stretch: true,
                backgroundColor: Colors.black,
                flexibleSpace: FlexibleSpaceBar(
                  titlePadding: const EdgeInsets.all(3),
                  centerTitle: true,
                  collapseMode: CollapseMode.parallax,
                  title: const Text(
                    "Willkommen bei Sushi Yana",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 13.0,
                    ),
                  ),
                  background: Image.asset(
                    "assets/images/sushiyanalogo.png", cacheHeight: 200,
                    // fit: BoxFit.cover,
                  ),
                ),
              ),
              SliverPersistentHeader(
                delegate: _SliverAppBarDelegate(
                  TabBar(
                    controller: _tabController,
                    indicatorSize: TabBarIndicatorSize.label,
                    indicatorColor: Colors.white,
                    indicatorWeight: 6,
                    labelColor: Colors.white,
                    unselectedLabelColor: Colors.black,
                    tabs: _tabs,
                  ),
                ),
                pinned: true,
              ),
            ];
          },
          body: PageView(
            controller: _pageController,
            onPageChanged: (index) {
              _tabController.animateTo(index);
            },
            children: [
              HomeTab(onItemTapped: _onItemTapped),
              if (_selectedHeroTag != null)
                SecondTab(heroTag: _selectedHeroTag!, onBack: _onBack),
              const CartTab(),
            ],
          ),
        ),
      ),
    );
  }
}

class ImpressumBar extends StatelessWidget {
  const ImpressumBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 10),
      color: yanaColor,
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text(
              "App Schliessen",
              style: TextStyle(fontSize: 9, color: Colors.white),
            ),
          ),
          const Text(
            "-",
            style: TextStyle(fontSize: 9, color: Colors.white),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return const Impressum();
              }));
            },
            child: const Text(
              "Impressum",
              style: TextStyle(fontSize: 9, color: Colors.white),
            ),
          ),
          const Text(
            "-",
            style: TextStyle(fontSize: 9, color: Colors.white),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return const Datenschutz();
              }));
            },
            child: const Text(
              "Datenschutz",
              style: TextStyle(fontSize: 9, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}

const List<Tab> _tabs = [
  Tab(
    icon: Icon(
      Icons.home_rounded,
    ),
  ),
  Tab(
    icon: Icon(Icons.shopping_bag_rounded),
  ),
];

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this._tabBar);

  final TabBar _tabBar;

  @override
  double get minExtent => _tabBar.preferredSize.height;
  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Material(
      color: yanaColor,
      child: _tabBar,
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}

class HomeTab extends StatelessWidget {
  final Function(String) onItemTapped;

  const HomeTab({super.key, required this.onItemTapped});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(30, 30, 20, 0),
      constraints: const BoxConstraints(maxWidth: 500),
      alignment: Alignment.topCenter,
      child: GridView.builder(
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        shrinkWrap: true,
        padding: const EdgeInsets.only(bottom: 20),
        itemCount: _mainItems.length,
        itemBuilder: (BuildContext context, int index) {
          String title = _mainItems.keys.elementAt(index);
          String imagePath = _mainItems.values.elementAt(index);
          return Container(
            margin: const EdgeInsets.all(10),
            clipBehavior: Clip.hardEdge,
            width: 150,
            height: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              border: Border.all(
                color: yanaColor,
                width: 2,
              ),
            ),
            child: Stack(
              children: [
                Positioned.fill(
                  bottom: 20,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Hero(
                      tag: title,
                      child: Image.asset(
                        imagePath,
                        alignment: Alignment.center,
                      ),
                    ),
                  ),
                ),
                Positioned.fill(
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      highlightColor: yanaColor.withOpacity(.5),
                      splashColor: yanaColor,
                      onTap: () => onItemTapped(title),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: yanaColor,
                    ),
                    child: Text(
                      title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class SecondTab extends StatelessWidget {
  final String heroTag;
  final VoidCallback onBack;

  const SecondTab({
    super.key,
    required this.heroTag,
    required this.onBack,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(40),
      alignment: Alignment.center,
      child: Column(
        children: [
          Center(
            child: Hero(
              tag: heroTag,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(_mainItems[heroTag]!),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: 11,
                itemBuilder: (BuildContext context, int index) {
                  return const ListTile(
                    title: Text("Beispielartikel",
                        textAlign: TextAlign.start,
                        style: TextStyle(fontSize: 15, color: Colors.white)),
                    trailing: Text("3,99 €",
                        textAlign: TextAlign.end,
                        style: TextStyle(fontSize: 15, color: Colors.white)),
                  );
                }),
          ),
          const Divider(
            color: Colors.white,
            height: 40,
            thickness: 0.2,
          ),
          Align(
            alignment: Alignment.center,
            child: ElevatedButton(
                onPressed: onBack,
                style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(yanaColor),
                    elevation: WidgetStateProperty.all(5),
                    foregroundColor: WidgetStateProperty.all(Colors.white),
                    shadowColor: WidgetStateProperty.all(yanaColor)),
                child: const Icon(Icons.arrow_back_ios_new)),
          ),
        ],
      ),
    );
  }
}

class CartTab extends StatelessWidget {
  const CartTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "Nichts ausgewählt",
        style: TextStyle(
          color: Colors.white,
          fontSize: 24,
        ),
      ),
    );
  }
}

class Impressum extends StatelessWidget {
  const Impressum({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Row(
          children: [
            SizedBox(
              height: 150,
              child: Align(
                alignment: Alignment.center,
                child: Image.asset(
                  "assets/images/sushiyanalogo.png",
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            )
          ],
        ),
        toolbarHeight: 180,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          children: [
            Container(
              color: Colors.white,
              height: 500,
              width: 350,
              child: const SingleChildScrollView(
                child: Text(
                    "Impressum\n\nVerantwortlich für die Startseite und die weiteren Informationsseiten (ohne Onlineshops) dieser Webseite ist:\n\nSushi Yana GmbH\nFlughafenstraße 76\n12049 Berlin\nbuero@sushi-yana.de\n\nGeschäftsführer: Wesam El-Saadi\nZuständiges Gericht: Amtsgericht Charlottenburg\nHandelsregister: HRB 233774 B\nSteuernummer: 29/553/32890\nUst.: DE347204498\n\nJede Sushi Yana Filiale wird von einem selbstständig tätigen Gewerbetreibenden als Franchisenehmer bewirtschaftet. Dieser organisiert Produktion und Auslieferung seiner Produkte für seinen Betrieb in eigener Verantwortung. Wenn du Fragen oder Anliegen zu deiner Lieferung hast, wende dich bitte an den Verantwortlichen des jeweiligen Betriebes, den du in vorstehender Liste finden kannst.\n\nUnsere Franchisezentrale erreichen Sie über die Mailadresse buero@sushi-yana.de. Bitte nutzen Sie diese ausschließlich für allgemeine Anfragen."),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Datenschutz extends StatelessWidget {
  const Datenschutz({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Row(
          children: [
            SizedBox(
              height: 150,
              child: Align(
                alignment: Alignment.center,
                child: Image.asset(
                  "assets/images/sushiyanalogo.png",
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            )
          ],
        ),
        toolbarHeight: 180,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          children: [
            Container(
              color: Colors.white,
              height: 500,
              width: 350,
              child: const SingleChildScrollView(
                child: Text("Datenschutzerklärung\n\n………."),
              ),
            )
          ],
        ),
      ),
    );
  }
}
