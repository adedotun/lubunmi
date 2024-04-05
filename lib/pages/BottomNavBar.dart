import 'package:com.lubumi.sellers/pages/Cart.dart';
import 'package:com.lubumi.sellers/pages/Favorites.dart';
import 'package:com.lubumi.sellers/pages/Home.dart';
import 'package:com.lubumi.sellers/pages/Search.dart';
import 'package:flutter/material.dart';
import 'AppHome.dart';
import 'Profile.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';

class BottomNavBar extends StatefulWidget{
  @override
  BottomNavBarState createState() => BottomNavBarState();

}

class BottomNavBarState extends State<BottomNavBar>{

  @override
  void initState(){
    super.initState();
    pages =[
      AppHome(
        key: PageStorageKey('Page1'),
      ),
      Favorites(
        key: PageStorageKey('Page2'),
      ),
      Search(
        key: PageStorageKey('Page3'),
      ),
      Cart(
        key: PageStorageKey('Page4'),
      ),
      Profile(
        key: PageStorageKey('Page5'),
      ),
    ];
  }
  List<Widget> pages;

  PageStorageBucket bucket = PageStorageBucket();
  int _selectedIndex = 0;

  Widget _bottomNavBar(int selectedIndex) => BottomNavyBar(
    iconSize: 25.0,
    itemCornerRadius: 20.0,
    showElevation: true,
    onItemSelected: (int index) => setState(() => _selectedIndex = index),
    selectedIndex: selectedIndex,
    items: <BottomNavyBarItem>[
      BottomNavyBarItem(
        icon: Icon(Icons.home,), title: Text('Home'), activeColor: Color(0xFFFD6a02),inactiveColor: Colors.black
      ),
      BottomNavyBarItem(
        icon: Icon(Icons.favorite_border,), title: Text('Favorites'),activeColor: Color(0xFFFD6a02),inactiveColor: Colors.black
      ),
      BottomNavyBarItem(
        icon: Icon(Icons.search,), title: Text('Search'),activeColor: Color(0xFFFD6a02),inactiveColor: Colors.black
      ),
      BottomNavyBarItem(
        icon: Icon(Icons.shopping_cart,), title: Text('Cart'),activeColor: Color(0xFFFD6a02),inactiveColor: Colors.black
      ),
      BottomNavyBarItem(
        icon: Icon(Icons.person_outline,), title: Text('You'),activeColor: Color(0xFFFD6a02),inactiveColor: Colors.black
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      bottomNavigationBar: _bottomNavBar(_selectedIndex),
      body: PageStorage(
        child: pages[_selectedIndex],
        bucket: bucket,
      ),
    );
  }

}