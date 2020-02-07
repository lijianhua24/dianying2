class RegionBean {
  List<Result> result;
  String message;
  String status;

  RegionBean({this.result, this.message, this.status});

  RegionBean.fromJson(Map<String, dynamic> json) {
    if (json['result'] != null) {
      result = new List<Result>();
      json['result'].forEach((v) {
        result.add(new Result.fromJson(v));
      });
    }
    message = json['message'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.result != null) {
      data['result'] = this.result.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    data['status'] = this.status;
    return data;
  }
}

class Result {
  int regionId;
  String regionName;

  Result({this.regionId, this.regionName});

  Result.fromJson(Map<String, dynamic> json) {
    regionId = json['regionId'];
    regionName = json['regionName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['regionId'] = this.regionId;
    data['regionName'] = this.regionName;
    return data;
  }
}
