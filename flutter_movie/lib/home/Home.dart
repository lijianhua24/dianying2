import 'package:flutter/material.dart';
import 'home_cinema.dart';
import 'home_home.dart';
import 'home_my.dart';

void main() => runApp(Home_Widget());

class Home_Widget extends StatefulWidget {
  @override
  _Home_WidgetState createState() => _Home_WidgetState();
}

class _Home_WidgetState extends State<Home_Widget>
    with AutomaticKeepAliveClientMixin {
  var _currentIndex = 0;
  List<Widget> BottomBarIndex = [HomePage(), Cinema(), My_Setting()];

  @override
  Widget build(BuildContext context) {
    return new Center(
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: this._currentIndex,
          onTap: (int index) {
            setState(() {
              this._currentIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
                icon: const Icon(Icons.home), title: const Text("电影")),
            BottomNavigationBarItem(
                icon: const Icon(Icons.wb_cloudy), title: const Text("影院")),
            BottomNavigationBarItem(
                icon: const Icon(Icons.settings), title: const Text("我的")),
          ],
        ),
        body: IndexedStack(
          index: this._currentIndex,
          children: this.BottomBarIndex,
        ),
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
