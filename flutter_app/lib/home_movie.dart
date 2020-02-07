import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as client;
import 'dart:convert';
class Movies extends StatefulWidget {
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<Movies> {
  List _bannerList = [
    "http://mobile.bwstudent.com/images/movie/stills/whwdzg/whwdzg1_h.jpg",
    "http://mobile.bwstudent.com/images/movie/stills/zgjz/zgjz1_h.jpg",
    "http://mobile.bwstudent.com/images/movie/stills/pdz/pdz1_h.jpg",
    "http://mobile.bwstudent.com/images/movie/stills/sndn/sndn1_h.jpg",
    "http://mobile.bwstudent.com/images/movie/stills/dwsj/dwsj1_h.jpg"
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1000,
      width: 1000,
      child: Column(
        children: <Widget>[
          SwiperDiy(swiperDataList: _bannerList), //页面顶部轮播组件
          _Release_Widget(),
          coming_soon_Widget(),
          _hot_movie_Widget(),
        ],
      ),
    );
  }
}
class SwiperDiy extends StatelessWidget{
  final List swiperDataList;
  SwiperDiy({Key key,this.swiperDataList}):super(key:key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: 650,
      height: 220,
      child: Swiper(
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context,int index){
          return InkWell(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: NetworkImage("${swiperDataList[index]}"),
                  fit: BoxFit.fill,
                )
              ),
            ),
          );
        },
        itemCount: swiperDataList.length,
        autoplay: true,
        viewportFraction: 0.8,
        scale: 0.8,
      ),
    );
  }
}
class _Release_Widget extends StatefulWidget{
  @override
  _DynamicPageState createState() => _DynamicPageState();
}
class _DynamicPageState extends State<_Release_Widget> {
  List list;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    get_Data();
  }

  get_Data() async {
    client
        .get(
        "http://mobile.bwstudent.com/movieApi/movie/v2/findReleaseMovieList?page=1&&count=5")
        .then((client.Response response) {
      var data = json.decode(response.body);
      data = data["result"];
      //打印请求的结果
      print(data);
      print('打印信息');
      //更新数据
      setState(() {
        list = data;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Flexible(
      fit: FlexFit.tight,
      child: ListView(
        children: _getItem(),
        scrollDirection: Axis.horizontal,
      ),
    );
  }

  List<Widget> _getItem() {
    return list.map((item) {
      return new Card(
        child: new Padding(
          padding: const EdgeInsets.all(10.0),
          child: _item(item),
        ),
        elevation: 3.0,
        margin: const EdgeInsets.all(10.0),
      );
    }).toList();
  }

  Widget _item(item) {
    return new Stack(
      children: <Widget>[
        new Center(
          child: new FadeInImage.assetNetwork(
            placeholder: "images/jc.jpg",
            image: "${item['imageUrl']}",
            width: 200.0,
            height: 200.0,
          ),
        ),
        new Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            new Text("${item["director"]}".trim(),
                style: new TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                ),
                textAlign: TextAlign.left),
            new Text(
              "${item["name"]}",
            )
          ],
        ),
      ],
    );
  }
}

//即将上映
class coming_soon_Widget extends StatefulWidget {
  @override
  _coming_State createState() => _coming_State();
}

class _coming_State extends State<coming_soon_Widget> {
  List list;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    get_Data();
  }

  get_Data() async {
    client
        .get(
        "http://mobile.bwstudent.com/movieApi/movie/v2/findComingSoonMovieList?page=1&&count=5")
        .then((client.Response response) {
      var data = json.decode(response.body);
      data = data["result"];
      //打印请求的结果
      print(data);
      print('打印信息');
      //更新数据
      setState(() {
        list = data;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Flexible(
      fit: FlexFit.tight,
      child: ListView(
        children: _getItem(),
      ),
    );
  }

  List<Widget> _getItem() {
    return list.map((item) {
      return new Card(
        child: new Padding(
          padding: const EdgeInsets.all(10.0),
          child: _item(item),
        ),
        elevation: 3.0,
        margin: const EdgeInsets.all(10.0),
      );
    }).toList();
  }

  Widget _item(item) {
    return new Row(
      children: <Widget>[
        new Center(
          child: new FadeInImage.assetNetwork(
            placeholder: "images/jc.jpg",
            image: "${item['imageUrl']}",
            width: 200.0,
            height: 200.0,
          ),
        ),
        new Column(
          children: <Widget>[
            new Text("${item["name"]}".trim(),
                style: new TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                ),
                textAlign: TextAlign.left),
            new Text(
              "${item["wantSeeNum"]}",
            )
          ],
        ),
      ],
    );
  }
}

//热门电影
class _hot_movie_Widget extends StatefulWidget {
  @override
  _hot_movie_State createState() => _hot_movie_State();
}

class _hot_movie_State extends State<_hot_movie_Widget> {
  List list;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    get_Data();
  }

  get_Data() async {
    client
        .get(
        "http://mobile.bwstudent.com/movieApi/movie/v2/findHotMovieList?page=1&&count=3")
        .then((client.Response response) {
      var data = json.decode(response.body);
      data = data["result"];
      //打印请求的结果
      print(data);
      print('打印信息');
      //更新数据
      setState(() {
        list = data;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Flexible(
      fit: FlexFit.tight,
      child: ListView(
        children: _getItem(),
        scrollDirection: Axis.horizontal,
      ),
    );
  }

  List<Widget> _getItem() {
    return list.map((item) {
      return new Card(
        child: new Padding(
          padding: const EdgeInsets.all(10.0),
          child: _item(item),
        ),
        elevation: 3.0,
        margin: const EdgeInsets.all(10.0),
      );
    }).toList();
  }

  Widget _item(item) {
    return new Stack(
      children: <Widget>[
        new Center(
          child: new FadeInImage.assetNetwork(
            placeholder: "images/jc.jpg",
            image: "${item['horizontalImage']}",
            width: 200.0,
            height: 200.0,
          ),
        ),
        new Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            new Text("${item["name"]}".trim(),
                style: new TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                ),
                textAlign: TextAlign.left),
            new Text(
              "${item["starring"]}",
            )
          ],
        ),
      ],
    );
  }
}