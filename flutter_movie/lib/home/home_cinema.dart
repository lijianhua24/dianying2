import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_movie/home/service.dart';
import 'package:http/http.dart' as client;
import 'dart:convert';

import 'bean/RegionBean.dart'; //使用 json 解析

class Cinema extends StatefulWidget {
  @override
  _CinemaState createState() => _CinemaState();
}

class _CinemaState extends State<Cinema> {
  @override
  Widget build(BuildContext context) {
    return new DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Row(
            children: <Widget>[
              Expanded(
                child: TabBar(
                  ///TabBar布局
                  tabs: <Widget>[
                    Tab(text: "推荐影院"),
                    Tab(text: "附近影院"),
                    Tab(text: "查询区域地址"),
                  ],
                ),
              )
            ],
          ),

          ///设置标题居中
          centerTitle: true,
        ),
        body: Tabs(),
      ),
    );
    return Column(
      children: <Widget>[],
    );
  }
}

class Tabs extends StatefulWidget {
  @override
  TabsWidget createState() => TabsWidget();
}

class TabsWidget extends State<Tabs> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new TabBarView(
      children: <Widget>[
        Column(
          children: <Widget>[
            FutureBuilder(
                future: get_commend(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    var data = json.decode(snapshot.data.toString());
                    List<Map> swiperDataList =
                        (data['result'] as List).cast(); // 顶部轮播组件数
                    return Column(
                      children: <Widget>[
                        _movie_Cinema(cinemaList: swiperDataList), //页面顶部轮播组件
                      ],
                    );
                  } else {
                    return Center(
                      child: Text('加载中'),
                    );
                  }
                }),
          ],
        ),
        Column(
          children: <Widget>[
            FutureBuilder(
                future: get_nearby(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    var data = json.decode(snapshot.data.toString());
                    List<Map> swiperDataList =
                        (data['result'] as List).cast(); // 顶部轮播组件数
                    return Column(
                      children: <Widget>[
                        _nearby_cinema(nearbt_List: swiperDataList), //页面顶部轮播组件
                      ],
                    );
                  } else {
                    return Center(
                      child: Text('加载中'),
                    );
                  }
                }),
          ],
        ),
        Container(
          child: Row(
            children: <Widget>[
              _region_cinema(), //页面顶部轮播组件
            ],
          ),
        )
      ],
    );
  }
}

//热门影院
class _movie_Cinema extends StatelessWidget {
  final List cinemaList;

  const _movie_Cinema({Key key, this.cinemaList}) : super(key: key);

  Widget _movie_cinema(BuildContext context, index) {
    return InkWell(
      child: new Stack(
        children: <Widget>[
          new Center(
            child: new FadeInImage.assetNetwork(
              placeholder: "images/jc.jpg",
              image: "${cinemaList[index]['logo']}",
              width: 200.0,
              height: 200.0,
            ),
          ),
          new Center(
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                new Text("${cinemaList[index]["name"]}".trim(),
                    style: new TextStyle(
                      color: Colors.black,
                      fontSize: 20.0,
                    ),
                    textAlign: TextAlign.left),
                new Text(
                  "${cinemaList[index]["address"]}",
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: 900,
      child: ListView.builder(
        itemBuilder: (context, index) {
          return _movie_cinema(context, index);
        },
      ),
    );
  }
}

//附近影院
class _nearby_cinema extends StatelessWidget {
  final List nearbt_List;

  const _nearby_cinema({Key key, this.nearbt_List}) : super(key: key);

  Widget _nearby(BuildContext context, index) {
    return Stack(
      children: <Widget>[
        new Center(
          child: new FadeInImage.assetNetwork(
            placeholder: "images/jc.jpg",
            image: "${nearbt_List[index]['logo']}",
            width: 200.0,
            height: 200.0,
          ),
        ),
        new Center(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              new Text("${nearbt_List[index]["name"]}".trim(),
                  style: new TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                  ),
                  textAlign: TextAlign.left),
              new Text(
                "${nearbt_List[index]["address"]}",
              )
            ],
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 900,
      child: ListView.builder(itemBuilder: (context, index) {
        return _nearby(context, index);
      }),
    );
  }
}

//区域ID
class _region_cinema extends StatefulWidget {
  @override
  _region_WidgetState createState() => _region_WidgetState();
}

class _region_WidgetState extends State<_region_cinema> {
  List list = [];

  @override
  void initState() {
    _get();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      decoration: BoxDecoration(
          border: Border(right: BorderSide(width: 1, color: Colors.black12))),
      child: ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index) {
          return _left_InkWell(index);
        },
      ),
    );
  }

  Widget _left_InkWell(int index) {
    return InkWell(
      onTap: () {

      },
      child: Container(
        width: 100,
        height: 100,
        padding: EdgeInsets.only(left: 20, top: 30,bottom: 30),
        decoration: BoxDecoration(
            color: Colors.white,
            border:
                Border(bottom: BorderSide(width: 1, color: Colors.black12))),
        child: new Text(
          list[index].regionName,
          style: new TextStyle(
            color: Colors.black,
            fontSize: 20.0,
          ),
        ),
      ),
    );
  }

  void _get() async {
    await get_region('REGION').then((val) {
      var data = json.decode(val.toString());
      RegionBean regionBean = RegionBean.fromJson(data);
      setState(() {
        list = regionBean.result;
      });
    });
  }
}
