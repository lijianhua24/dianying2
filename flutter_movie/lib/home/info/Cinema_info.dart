import 'package:flutter/material.dart';
import 'package:flutter_movie/home/bean/DetailBean.dart';
import 'package:http/http.dart' as client;
import 'dart:convert';

import '../service.dart'; //使用 json 解析

class Cinema_info extends StatefulWidget {
  var movieId;

  //接收上一个页面传递的数据
  Cinema_info(this.movieId, {Key key}) : super(key: key);

  @override
  _Cinema_InfoState createState() => _Cinema_InfoState(movieId);
}

class _Cinema_InfoState extends State<Cinema_info> {
  ResultBean list;

  var movieId;

  _Cinema_InfoState(this.movieId);

  @override
  void initState() {
    _get();
    super.initState();
  }

  void _get() async {
    await get_detail(movieId).then((val) {
      var data = json.decode(val.toString());
      ResultBean detailBean = ResultBean.fromJson(data);
      print("111111111111111111111111111111111111111111111");
      print(data);
      print("111111111111111111111111111111111111111111111");
      setState(() {
        list = detailBean;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: <Widget>[
        new Text("${movieId}"),
        new Text("${list}"),
      ],
    );
  }
}
