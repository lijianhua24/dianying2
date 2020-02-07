import "package:dio/dio.dart";
import 'dart:async';
import 'dart:io';
import 'api.dart';

Future getBanner() async {
  try {
    Response response;
    Dio dio = new Dio();
    response = await dio.get(servicePath['banner']);
    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception('后端接口出现异常，请检测代码和服务器情况.........');
    }
  } catch (e) {
    return print('ERROR:======>${e}');
  }
}

//正在上映
Future get_findReleaseMovieList() async {
  try {
    Response response;
    Dio dio = new Dio();
    response = await dio.get(servicePath['findReleaseMovieList']);
    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception('后端接口出现异常，请检测代码和服务器情况.........');
    }
  } catch (e) {
    return print('ERROR:======>${e}');
  }
}

//正在热映
Future get_findComingSoonMovieList() async {
  try {
    Response response;
    Dio dio = new Dio();
    response = await dio.get(servicePath['findComingSoonMovieList']);
    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception('后端接口出现异常，请检测代码和服务器情况.........');
    }
  } catch (e) {
    return print('ERROR:======>${e}');
  }
}

//即将上映
Future get_findHotMovieList() async {
  try {
    Response response;
    Dio dio = new Dio();
    response = await dio.get(servicePath['findHotMovieList']);
    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception('后端接口出现异常，请检测代码和服务器情况.........');
    }
  } catch (e) {
    return print('ERROR:======>${e}');
  }
}

//推荐影院
Future get_commend() async {
  try {
    Response response;
    Dio dio = new Dio();
    response = await dio.get(servicePath['COMMEND']);
    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception('后端接口出现异常，请检测代码和服务器情况.........');
    }
  } catch (e) {
    return print('ERROR:======>${e}');
  }
}

//附近影院
Future get_nearby() async {
  try {
    Response response;
    Dio dio = new Dio();
    response = await dio.get(servicePath['NEARBY']);
    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception('后端接口出现异常，请检测代码和服务器情况.........');
    }
  } catch (e) {
    return print('ERROR:======>${e}');
  }
}

//REGION
Future get_region(url, {formData}) async {
  try {
    Response response;
    Dio dio = new Dio();
    if (formData == null) {
      response = await dio.get(servicePath[url]);
    } else {
      response = await dio.get(servicePath[url]);
    }
    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception('后端接口出现异常，请检测代码和服务器情况.........');
    }
  } catch (e) {
    return print('ERROR:======>${e}');
  }
}

//REGION
Future get_detail(url, {formData}) async {
  try {
    Response response;
    Dio dio = new Dio();
    if (formData == null) {
      response = await dio.get(servicePath['DETAIL'] + url);
    } else {
      response = await dio.get(servicePath['DETAIL'] + url);
    }
    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception('后端接口出现异常，请检测代码和服务器情况.........');
    }
  } catch (e) {
    return print('ERROR:======>${e}');
  }
}
