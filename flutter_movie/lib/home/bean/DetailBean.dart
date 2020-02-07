class DetailBean {
  ResultBean result;
  String message;
  String status;

  DetailBean({this.result, this.message, this.status});

  DetailBean.fromJson(Map<String, dynamic> json) {
    result =
        json['result'] != null ? new ResultBean.fromJson(json['result']) : null;
    message = json['message'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.result != null) {
      data['result'] = this.result.toJson();
    }
    data['message'] = this.message;
    data['status'] = this.status;
    return data;
  }
}

class ResultBean {
  int commentNum;
  String duration;
  String imageUrl;
  List<MovieActor> movieActor;
  List<MovieDirector> movieDirector;
  int movieId;
  String movieType;
  String name;
  String placeOrigin;
  List<String> posterList;
  int releaseTime;
  double score;
  List<ShortFilmList> shortFilmList;
  String summary;
  int whetherFollow;

  ResultBean(
      {this.commentNum,
      this.duration,
      this.imageUrl,
      this.movieActor,
      this.movieDirector,
      this.movieId,
      this.movieType,
      this.name,
      this.placeOrigin,
      this.posterList,
      this.releaseTime,
      this.score,
      this.shortFilmList,
      this.summary,
      this.whetherFollow});

  ResultBean.fromJson(Map<String, dynamic> json) {
    commentNum = json['commentNum'];
    duration = json['duration'];
    imageUrl = json['imageUrl'];
    if (json['movieActor'] != null) {
      movieActor = new List<MovieActor>();
      json['movieActor'].forEach((v) {
        movieActor.add(new MovieActor.fromJson(v));
      });
    }
    if (json['movieDirector'] != null) {
      movieDirector = new List<MovieDirector>();
      json['movieDirector'].forEach((v) {
        movieDirector.add(new MovieDirector.fromJson(v));
      });
    }
    movieId = json['movieId'];
    movieType = json['movieType'];
    name = json['name'];
    placeOrigin = json['placeOrigin'];
    posterList = json['posterList'].cast<String>();
    releaseTime = json['releaseTime'];
    score = json['score'];
    if (json['shortFilmList'] != null) {
      shortFilmList = new List<ShortFilmList>();
      json['shortFilmList'].forEach((v) {
        shortFilmList.add(new ShortFilmList.fromJson(v));
      });
    }
    summary = json['summary'];
    whetherFollow = json['whetherFollow'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['commentNum'] = this.commentNum;
    data['duration'] = this.duration;
    data['imageUrl'] = this.imageUrl;
    if (this.movieActor != null) {
      data['movieActor'] = this.movieActor.map((v) => v.toJson()).toList();
    }
    if (this.movieDirector != null) {
      data['movieDirector'] =
          this.movieDirector.map((v) => v.toJson()).toList();
    }
    data['movieId'] = this.movieId;
    data['movieType'] = this.movieType;
    data['name'] = this.name;
    data['placeOrigin'] = this.placeOrigin;
    data['posterList'] = this.posterList;
    data['releaseTime'] = this.releaseTime;
    data['score'] = this.score;
    if (this.shortFilmList != null) {
      data['shortFilmList'] =
          this.shortFilmList.map((v) => v.toJson()).toList();
    }
    data['summary'] = this.summary;
    data['whetherFollow'] = this.whetherFollow;
    return data;
  }
}

class MovieActor {
  String name;
  String photo;
  String role;

  MovieActor({this.name, this.photo, this.role});

  MovieActor.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    photo = json['photo'];
    role = json['role'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['photo'] = this.photo;
    data['role'] = this.role;
    return data;
  }
}

class MovieDirector {
  String name;
  String photo;

  MovieDirector({this.name, this.photo});

  MovieDirector.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    photo = json['photo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['photo'] = this.photo;
    return data;
  }
}

class ShortFilmList {
  String imageUrl;
  String videoUrl;

  ShortFilmList({this.imageUrl, this.videoUrl});

  ShortFilmList.fromJson(Map<String, dynamic> json) {
    imageUrl = json['imageUrl'];
    videoUrl = json['videoUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['imageUrl'] = this.imageUrl;
    data['videoUrl'] = this.videoUrl;
    return data;
  }
}
