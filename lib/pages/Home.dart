import 'package:flutter/material.dart';
import 'BottomNavBar.dart';
import 'AppHome.dart';

class Home extends StatefulWidget {
   final String name;
  Home({Key key, @required this.name}) : super(key: key);

  @override
  HomeState createState() => HomeState();
}
class HomeState extends State<Home>{
//  int bottomSelectedIndex = 0;
//  List<BottomNavigationBarItem> buildBottomNavBarItems(){
//    return [
//      BottomNavigationBarItem(
//        icon: Icon(Icons.home,), title: Text('Home'),
//      ),
//      BottomNavigationBarItem(
//        icon: Icon(Icons.favorite_border,), title: Text('Favorites'),
//      ),
//      BottomNavigationBarItem(
//          icon: Icon(Icons.search,), title: Text('Search')
//      ),
//      BottomNavigationBarItem(
//        icon: Icon(Icons.shopping_cart,), title: Text('Cart'),
//      ),
//      BottomNavigationBarItem(
//        icon: Icon(Icons.person_outline,), title: Text('You'),
//      ),
//    ];
//  }
//  PageController pageController = PageController(
//      initialPage: 0,
//      keepPage: true,
//  );
//
//  Widget buildPageView(){
//    return PageView(
//      controller: pageController,
//      onPageChanged: (index) {
//        pageChanged(index);
//      },
//      children: <Widget>[
//        AppHome(),
//        Favorites(),
//        Search(),
//        Cart(),
//        Profile(),
//      ],
//    );
//  }
//
//  @override
//  void initState(){
//    super.initState();
//  }
//
//  void pageChanged(int index){
//    setState(() {
//      bottomSelectedIndex = index;
//    });
//  }
//  void bottomTapped(int index){
//    setState(() {
//      bottomSelectedIndex = index;
//      pageController.animateToPage(index, duration: Duration(milliseconds: 200), curve: Curves.ease);
//    });
//  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
//    return Scaffold(
//      appBar: AppBar(
//        title: Text('Home'),
//        actions: <Widget>[
//          IconButton(
//            icon: Icon(Icons.exit_to_app),
//            onPressed: (){
//              BlocProvider.of<AuthenticationBloc>(context).add(
//                LoggedOut(),
//              );
//            },
//          )
//        ],
//      ),
//
//      body: Column(
//        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//        children: <Widget>[
//          Center(
//            child: Text('Welcome back, ${widget.name}'),
//          )
//        ],
//      ),
//    );
//    return Scaffold(
//    body: buildPageView(),
//      bottomNavigationBar: BottomNavigationBar(
//        currentIndex: bottomSelectedIndex,
//        onTap: (index) {
//          bottomTapped(index);
//        },
//        items: buildBottomNavBarItems(),
//      ),
//    );:
  return MaterialApp(
    debugShowCheckedModeBanner: false,
    home: BottomNavBar(),
  );
  }

}