import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final PageController _pageController = PageController();
  int _currentPage = 0;
  bool startAnimation = false;
  final List<Map<String, dynamic>> menuItems = [
    {'title': 'Home', 'icon': Icons.home},
    {'title': 'Profile', 'icon': Icons.person},
    {'title': 'Settings', 'icon': Icons.settings},
    {'title': 'Logout', 'icon': Icons.logout},
  ];
  final List<Map<String, String>> items = [
    {
      "title": "Saarthi GPS",
      "desc":
          "Saarthi GPS is a real-time CNG Locator App offering live location monitoring, route playback and centralized fleet management through a modern dashboard.",
    },
    {
      "title": "Fleet Tracker",
      "desc":
          "Track and manage your vehicles with advanced tracking features and analytics.",
    },
    {
      "title": "Route Monitor",
      "desc":
          "Monitor route history and optimize your fleet performance easily.",
    },
  ];

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 200), () {
      setState(() {
        startAnimation = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      endDrawer: Drawer(
        backgroundColor: Colors.black,
        child: Column(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.grey[900]),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  "Ayush Sharma",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: menuItems.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Icon(
                      menuItems[index]['icon'],
                      color: Colors.white,
                    ),
                    title: Text(
                      menuItems[index]['title'],
                      style: TextStyle(color: Colors.white),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          SizedBox.expand(
            child: Image.asset(
              'assets/images/backgroundbanner.webp',
              fit: BoxFit.cover,
            ),
          ),
          SafeArea(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(16),
              child: Column(
                spacing: 16,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Ayush Sharma',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          _scaffoldKey.currentState?.openEndDrawer();
                        },
                        icon: Icon(Icons.menu, color: Colors.white),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TweenAnimationBuilder(
                        tween: Tween<double>(
                          begin: startAnimation ? -200 : -200,
                          end: startAnimation ? 0 : -200,
                        ),
                        duration: Duration(milliseconds: 800),
                        curve: Curves.easeOut,
                        builder: (context, value, child) {
                          return Transform.translate(
                            offset: Offset(value, 0),
                            child: child,
                          );
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Ayush',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 34,
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 60.0),
                              child: Text(
                                'Sharma',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 34,
                                  fontStyle: FontStyle.italic,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      TweenAnimationBuilder(
                        tween: Tween<double>(
                          begin: startAnimation ? 200 : 200,
                          end: startAnimation ? 0 : 200,
                        ),
                        duration: Duration(milliseconds: 800),
                        curve: Curves.easeOut,
                        builder: (context, value, child) {
                          return Transform.translate(
                            offset: Offset(value, 0),
                            child: child,
                          );
                        },
                        child: CircleAvatar(
                          radius: 40,
                          backgroundColor: Colors.white,
                          backgroundImage: AssetImage(
                            'assets/images/profile_photo.jpg',
                          ),
                        ),
                      ),
                    ],
                  ),
                  Text(
                    'My goal is to write maintainable, clean, and understandable code so that the development process is enjoyable',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                      fontStyle: FontStyle.italic,
                    ),
                  ),

                  Row(
                    spacing: 16,
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          maximumSize: Size(250, 50),
                          minimumSize: Size(150, 40),
                        ),
                        child: Text(
                          'Projects',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          maximumSize: Size(60, 50),
                          minimumSize: Size(40, 40),
                        ),
                        child: Icon(Icons.arrow_forward, color: Colors.black),
                      ),
                    ],
                  ),
                  Row(
                    spacing: 16,
                    children: [
                      OutlinedButton.icon(
                        onPressed: () {},
                        icon: Icon(Icons.link, color: Colors.white),
                        style: ElevatedButton.styleFrom(
                          maximumSize: Size(250, 50),
                          minimumSize: Size(150, 40),
                        ),
                        label: Text(
                          'LinkedIn',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ),
                      OutlinedButton.icon(
                        onPressed: () {},
                        icon: Icon(Icons.code, color: Colors.white),
                        style: ElevatedButton.styleFrom(
                          maximumSize: Size(250, 50),
                          minimumSize: Size(150, 40),
                        ),
                        label: Text(
                          'GitHub',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(
                    height: 320,
                    child: PageView.builder(
                      controller: _pageController,
                      itemCount: items.length,
                      onPageChanged: (index) {
                        setState(() {
                          _currentPage = index;
                        });
                      },
                      itemBuilder: (context, index) {
                        return Stack(
                          alignment: Alignment.bottomCenter,
                          children: [
                            // Base Container
                            Container(
                              height: 300,
                              width: 300,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(34),
                              ),
                            ),

                            // Overlay Container
                            Container(
                              padding: EdgeInsets.all(10),
                              height: 200,
                              width: 300,
                              decoration: BoxDecoration(
                                color: Colors.black.withValues(alpha: 0.3),
                              ),
                              alignment: Alignment.topCenter,
                              child: Column(
                                children: [
                                  Text(
                                    items[index]["title"]!,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FontStyle.italic,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 8,
                                    ),
                                    child: Text(
                                      items[index]["desc"]!,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontStyle: FontStyle.italic,
                                      ),
                                    ),
                                  ),
                                  Row(
                                    spacing: 16,
                                    children: [
                                      ElevatedButton(
                                        onPressed: () {},
                                        style: ElevatedButton.styleFrom(
                                          maximumSize: Size(150, 40),
                                          minimumSize: Size(60, 30),
                                        ),
                                        child: Text(
                                          'Read More',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w400,
                                            fontSize: 16,
                                            fontStyle: FontStyle.italic,
                                          ),
                                        ),
                                      ),
                                      ElevatedButton(
                                        onPressed: () {},
                                        style: ElevatedButton.styleFrom(
                                          maximumSize: Size(60, 40),
                                          minimumSize: Size(40, 30),
                                        ),
                                        child: Icon(
                                          Icons.arrow_forward,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      // LEFT BUTTON
                      OutlinedButton(
                        onPressed: () {
                          int newIndex =
                              (_currentPage - 1 + items.length) % items.length;
                          _pageController.animateToPage(
                            newIndex,
                            duration: Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                        },
                        child: Icon(Icons.arrow_back, color: Colors.white),
                      ),

                      // INDICATOR
                      Row(
                        children: List.generate(
                          items.length,
                          (index) => Container(
                            margin: EdgeInsets.symmetric(horizontal: 4),
                            width: _currentPage == index ? 12 : 8,
                            height: _currentPage == index ? 12 : 8,
                            decoration: BoxDecoration(
                              color:
                                  _currentPage == index
                                      ? Colors.white
                                      : Colors.grey,
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                      ),

                      // RIGHT BUTTON
                      OutlinedButton(
                        onPressed: () {
                          int newIndex = (_currentPage + 1) % items.length;
                          _pageController.animateToPage(
                            newIndex,
                            duration: Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                        },
                        child: Icon(Icons.arrow_forward, color: Colors.white),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
