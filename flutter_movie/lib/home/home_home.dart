import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_movie/home/service.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:http/http.dart' as client;
import 'dart:convert'; //使用 json 解析
import 'info/Cinema_info.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: _HomePageState(),
    );
  }
}

class _HomePageState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('百姓生活+'),
      ),
      body: Column(
        children: <Widget>[
          FutureBuilder(
            future: getBanner(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                var data = json.decode(snapshot.data.toString());
                List<Map> swiperDataList =
                    (data['result'] as List).cast(); // 顶部轮播组件数
                return Column(
                  children: <Widget>[
                    SwiperDiy(swiperDataList: swiperDataList), //页面顶部轮播组件
                  ],
                );
              } else {
                return Center(
                  child: Text('加载中'),
                );
              }
            },
          ),
          FutureBuilder(
            future: get_findReleaseMovieList(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                var data = json.decode(snapshot.data.toString());
                List<Map> findReleaseMovieList =
                    (data['result'] as List).cast(); // 顶部轮播组件数
                return Column(
                  children: <Widget>[
                    _Release_Widget(
                      findReleaseMovieList: findReleaseMovieList,
                    ),
                  ],
                );
              } else {
                return Center(
                  child: Text('加载中'),
                );
              }
            },
          ),
          FutureBuilder(
            future: get_findComingSoonMovieList(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                var data = json.decode(snapshot.data.toString());
                List<Map> findHotMovieList =
                    (data['result'] as List).cast(); // 顶部轮播组件数
                return Column(
                  children: <Widget>[
                    coming_soon_Widget(findHotMovieList: findHotMovieList),
                  ],
                );
              } else {
                return Center(
                  child: Text('加载中'),
                );
              }
            },
          ),
          FutureBuilder(
            future: get_findHotMovieList(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                var data = json.decode(snapshot.data.toString());
                List<Map> findHotMovieList =
                    (data['result'] as List).cast(); // 顶部轮播组件数
                return Column(
                  children: <Widget>[
                    _hot_movie_Widget(findHotMovieList: findHotMovieList),
                  ],
                );
              } else {
                return Center(
                  child: Text('加载中'),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}

// 首页轮播组件编写
class SwiperDiy extends StatelessWidget {
  final List swiperDataList;

  SwiperDiy({Key key, this.swiperDataList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.0,
      child: Swiper(
        itemBuilder: (BuildContext context, int index) {
          return Image.network("${swiperDataList[index]['imageUrl']}",
              fit: BoxFit.fill);
        },
        itemCount: swiperDataList.length,
        pagination: new SwiperPagination(),
        autoplay: true,
      ),
    );
  }
}

//正在上映
class _Release_Widget extends StatelessWidget {
  final List findReleaseMovieList;

  const _Release_Widget({Key key, this.findReleaseMovieList}) : super(key: key);

  Widget _gridViewItemUI(BuildContext context, index) {
    return InkWell(
      onTap: () {
        print('点击了导航');
        Navigator.push(context,
            new MaterialPageRoute(builder: (BuildContext context) {
          return Cinema_info(findReleaseMovieList[index]['movieId']); //带传值的跳转
        }));
      },
      child: Stack(
        children: <Widget>[
          new Center(
            child: new FadeInImage.assetNetwork(
              placeholder: "images/jc.jpg",
              image: '${findReleaseMovieList[index]['imageUrl']}',
              width: 200.0,
              height: 200.0,
            ),
          ),
          new Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              new Text('${findReleaseMovieList[index]['director']}',
                  style: new TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                  ),
                  textAlign: TextAlign.left),
              new Text(
                '${findReleaseMovieList[index]['name']}',
              )
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return _gridViewItemUI(context, index);
        },
      ),
    );
  }
}

//即将上映
class coming_soon_Widget extends StatelessWidget {
  final List findHotMovieList;

  const coming_soon_Widget({Key key, this.findHotMovieList}) : super(key: key);

  Widget _get(BuildContext context, index) {
    return InkWell(
      child: Row(
        children: <Widget>[
          new Center(
            child: new FadeInImage.assetNetwork(
              placeholder: "images/jc.jpg",
              image: "${findHotMovieList[index]['imageUrl']}",
              width: 200.0,
              height: 200.0,
            ),
          ),
          new Column(
            children: <Widget>[
              new Text("${findHotMovieList[index]["name"]}".trim(),
                  style: new TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                  ),
                  textAlign: TextAlign.left),
              new Text(
                "${findHotMovieList[index]["wantSeeNum"]}",
              )
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: 280,
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          return _get(context, index);
        },
      ),
    );
  }
}

//热门电影
class _hot_movie_Widget extends StatelessWidget {
  final List findHotMovieList;

  const _hot_movie_Widget({Key key, this.findHotMovieList}) : super(key: key);

  Widget _hot_movie(BuildContext context, index) {
    return InkWell(
      child: Stack(
        children: <Widget>[
          new Center(
            child: new FadeInImage.assetNetwork(
              placeholder: "images/jc.jpg",
              image: "${findHotMovieList[index]['horizontalImage']}",
              width: 200.0,
              height: 200.0,
            ),
          ),
          new Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              new Text("${findHotMovieList[index]["name"]}".trim(),
                  style: new TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                  ),
                  textAlign: TextAlign.left),
              new Text(
                "${findHotMovieList[index]["starring"]}",
              )
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: 230,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return _hot_movie(context, index);
        },
      ),
    );
  }
}
