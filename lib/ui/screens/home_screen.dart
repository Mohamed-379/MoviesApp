import 'package:flutter/material.dart';
import 'package:movieapp/ui/screens/tabs/browser/browser_screen.dart';
import 'package:movieapp/ui/screens/tabs/home/home.dart';
import 'package:movieapp/ui/screens/tabs/search/search_screen.dart';
import 'package:movieapp/ui/screens/tabs/watchlist/watch_list_screen.dart';
class HomeScreen extends StatefulWidget {
  static const routeName = "Home Screen";

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List<Widget> tabs = [Home(), const SearchScreen(), const BrowserScreen(), const WatchListScreen()];
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 18, 19, 18),
      bottomNavigationBar:buildBottomNavBar(),
      body: tabs[currentIndex],
    );
  }

  Widget buildBottomNavBar()
  {
    return Theme(
      data: Theme.of(context).copyWith(canvasColor: const Color.fromARGB(255, 26, 26, 26)),
      child: BottomNavigationBar(
          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
          },
          currentIndex: currentIndex,
          selectedItemColor: const Color.fromRGBO(253, 174, 26, 1.0),
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
            BottomNavigationBarItem(icon: Icon(Icons.movie), label: "Browser"),
            BottomNavigationBarItem(icon: Icon(Icons.video_library_sharp), label: "WatchList"),
          ]),
    );
  }
}