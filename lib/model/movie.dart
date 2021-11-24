// To parse this JSON data, do
//
//     final movie = movieFromJson(jsonString);

import 'dart:convert';

List<Movie> movieFromJson(String str) => List<Movie>.from(json.decode(str).map((x) => Movie.fromJson(x)));

String movieToJson(List<Movie> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Movie {
  Movie({
    this.id,
    this.name,
    this.department,
    this.designation,
    this.shift,
    this.departmentId,
    this.designationId,
    this.shiftId,
    this.archive,
    this.email,
    this.mobile,
    this.admin,
    this.password,
    this.profile,
  });

  String id;
  String name;
  String department;
  String designation;
  String shift;
  String departmentId;
  String designationId;
  String shiftId;
  String archive;
  String email;
  String mobile;
  String admin;
  String password;
  String profile;

  factory Movie.fromJson(Map<String, dynamic> json) => Movie(
    id: json["Id"],
    name: json["name"],
    department: json["Department"],
    designation: json["Designation"],
    shift: json["Shift"],
    departmentId: json["DepartmentId"],
    designationId: json["DesignationId"],
    shiftId: json["ShiftId"],
    archive: json["archive"],
    email: json["Email"],
    mobile: json["Mobile"],
    admin: json["Admin"],
    password: json["Password"],
    profile: json["Profile"],
  );

  Map<String, dynamic> toJson() => {
    "Id": id,
    "name": name,
    "Department": department,
    "Designation": designation,
    "Shift": shift,
    "DepartmentId": departmentId,
    "DesignationId": designationId,
    "ShiftId": shiftId,
    "archive": archive,
    "Email": email,
    "Mobile": mobile,
    "Admin": admin,
    "Password": password,
    "Profile": profile,
  };
}
