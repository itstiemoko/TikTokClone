import 'package:flutter/material.dart';
import 'package:tiktok/HomePageContent.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const TikTokHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class TikTokHomePage extends StatefulWidget {
  const TikTokHomePage({Key? key}) : super(key: key);

  @override
  _TikTokHomePageState createState() => _TikTokHomePageState();
}

class _TikTokHomePageState extends State<TikTokHomePage> {

  ///Init default select page to 0
  int _selectedPageIndex = 0;

  ///All pages widgets
  static const List<Widget> _widgetPageOptions = <Widget>[
    HomePageContent(),
    Text("Two"),
    Text("Three"),
    Text("Four"),
    Text("Five")
  ];

  ///Update variable "_selectedPageIndex" on bottom navigation item tapped
  void _onItemTapped(int index)
  {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetPageOptions.elementAt(_selectedPageIndex)
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          const BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Accueil'),
          const BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Découvrir'),
          BottomNavigationBarItem(icon: Image.asset("assets/images/tiktok_add.png", height: 25), label: 'ajouter'),
          const BottomNavigationBarItem(icon: Icon(Icons.message), label: 'Boîte de réception'),
          const BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile')
        ],
        backgroundColor: Colors.black,
        currentIndex: _selectedPageIndex,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        onTap: _onItemTapped,
      ),
    );
  }
}

