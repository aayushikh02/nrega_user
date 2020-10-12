class ViewAllJobUserModel {
  String tag;
  int code;
  List<Data> data;

  ViewAllJobUserModel({this.tag, this.code, this.data});

  ViewAllJobUserModel.fromJson(Map<String, dynamic> json) {
    tag = json['tag'];
    code = json['code'];
    if (json['data'] != null) {
      data = new List<Data>();
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['tag'] = this.tag;
    data['code'] = this.code;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  List<Viewonlyjob> viewonlyjob;
  List<Apply> apply;

  Data({this.viewonlyjob, this.apply});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['viewonlyjob'] != null) {
      viewonlyjob = new List<Viewonlyjob>();
      json['viewonlyjob'].forEach((v) {
        viewonlyjob.add(new Viewonlyjob.fromJson(v));
      });
    }
    if (json['apply'] != null) {
      apply = new List<Apply>();
      json['apply'].forEach((v) {
        apply.add(new Apply.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.viewonlyjob != null) {
      data['viewonlyjob'] = this.viewonlyjob.map((v) => v.toJson()).toList();
    }
    if (this.apply != null) {
      data['apply'] = this.apply.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Viewonlyjob {
  String sId;
  String jobName;
  String jobId;
  String jobLocation;
  String postedOn;
  String deadline;
  int iV;

  Viewonlyjob(
      {this.sId,
      this.jobName,
      this.jobId,
      this.jobLocation,
      this.postedOn,
      this.deadline,
      this.iV});

  Viewonlyjob.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    jobName = json['jobName'];
    jobId = json['jobId'];
    jobLocation = json['jobLocation'];
    postedOn = json['postedOn'];
    deadline = json['deadline'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['jobName'] = this.jobName;
    data['jobId'] = this.jobId;
    data['jobLocation'] = this.jobLocation;
    data['postedOn'] = this.postedOn;
    data['deadline'] = this.deadline;
    data['__v'] = this.iV;
    return data;
  }
}

class Apply {
  String sId;
  String userId;
  String jobId;
  int userResponse;
  String userType;
  int adminStatus;
  int iV;

  Apply(
      {this.sId,
      this.userId,
      this.jobId,
      this.userResponse,
      this.userType,
      this.adminStatus,
      this.iV});

  Apply.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    userId = json['userId'];
    jobId = json['jobId'];
    userResponse = json['userResponse'];
    userType = json['userType'];
    adminStatus = json['adminStatus'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['userId'] = this.userId;
    data['jobId'] = this.jobId;
    data['userResponse'] = this.userResponse;
    data['userType'] = this.userType;
    data['adminStatus'] = this.adminStatus;
    data['__v'] = this.iV;
    return data;
  }
}
