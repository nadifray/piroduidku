import 'package:flutter/material.dart';
import 'package:piroduidku/Page/home_page.dart';
import 'package:piroduidku/Page/profile_page.dart';
import 'package:piroduidku/Page/tabungan_page.dart';
import 'package:piroduidku/config.dart';

void main() => runApp(MyApp());

final List<Widget> _children = [
  HomeScreen(),
  TabunganScreen(),
  ProfilePage(),
];

List<Color> _color = [
  color_selectedNavigation,
  Colors.grey[900],
  Colors.grey[900]
];

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PiroDuidku',
      theme: ThemeData.light(),
      home: Main(),
    );
  }
}

class Main extends StatefulWidget {
  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> {
  PageController _pageController;
  int _idx = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onTap(int index) {
    _updateColor(index);
    setState(() {
      _idx = index;
      _pageController.animateToPage(index,
          duration: Duration(milliseconds: 250), curve: Curves.easeOut);
    });
  }

  void _updateColor(int index) {
    _color = [Colors.grey[900], Colors.grey[900], Colors.grey[900]];
    setState(() {
      _color[index] = color_selectedNavigation;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        onTap: _onTap,
        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.home, color: _color[0]),
            title: new Text('Home', style: TextStyle(color: _color[0])),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.account_balance_wallet, color: _color[1]),
            title: new Text(
              'Tabunganku',
              style: TextStyle(color: _color[1]),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, color: _color[2]),
            title: Text('Profil', style: TextStyle(color: _color[2])),
          )
        ],
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() => _idx = index);
        },
        children: _children,
      ),
    );
  }
}
