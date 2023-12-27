class UserResponse {
  final bool status;
  final dynamic message;
  final UserData? data;

  UserResponse(
      {required this.data, required this.message, required this.status});
  factory UserResponse.fromJson(Map<String, dynamic> json) {
    return UserResponse(
      data: json['data'] == null ? null : UserData.fromJson(json['data']),
      message: json['message'],
      status: json['status'],
    );
  }
}

class UserData {
  final int id;
  final String name;
  final String email;
  final String image;
  final String phone;
  final String token;
  final int points;
  final int credit;

  UserData({
    required this.id,
    required this.name,
    required this.email,
    required this.image,
    required this.phone,
    required this.token,
    required this.credit,
    required this.points,
  });
  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      image: json['image'],
      phone: json['phone'],
      token: json['token'],
      credit: json['credit'],
      points: json['points'],
    );
  }
}

/* 
// Example Usage
Map<String, dynamic> map = jsonDecode(<myJSONString>);
var myRootNode = Root.fromJson(map);
*/
// class UserData {
//   int? id;
//   String? name;
//   String? email;
//   String? phone;
//   String? image;
//   int? points;
//   int? credit;
//   String? token;

//   UserData(
//       {this.id,
//       this.name,
//       this.email,
//       this.phone,
//       this.image,
//       this.points,
//       this.credit,
//       this.token});

//   UserData.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//     email = json['email'];
//     phone = json['phone'];
//     image = json['image'];
//     points = json['points'];
//     credit = json['credit'];
//     token = json['token'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = Map<String, dynamic>();
//     data['id'] = id;
//     data['name'] = name;
//     data['email'] = email;
//     data['phone'] = phone;
//     data['image'] = image;
//     data['points'] = points;
//     data['credit'] = credit;
//     data['token'] = token;
//     return data;
//   }
// }

// class UserResponse {
//   bool? status;
//   String? message;
//   UserData? data;

//   UserResponse({this.status, this.message, this.data});

//   UserResponse.fromJson(Map<String, dynamic> json) {
//     status = json['status'];
//     message = json['message'];
//     data = json['data'] != null ? UserData?.fromJson(json['data']) : null;
//   }
// }
