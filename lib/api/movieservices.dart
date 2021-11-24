import 'dart:async';
import 'package:flutter_app_bloc/model/movie.dart';
import 'package:http/http.dart' as http;

class Services {

  Future<List<Movie>> getMovies() async {

    final response = await http.get(Uri.parse('https://ubiattendance.ubihrm.com/index.php/Att_services/getUsersmobile?refno=10&empid=4253'));

    var movies = movieFromJson(response.body.toString());

    return movies;

  }

  void deleteEmployee(empid) async {
    final response = await http.get(Uri.parse('https://ubiattendance.ubihrm.com/index.php/Att_services/deleteEmployee?OrganizationId=10&EmployeeId=$empid'));
  }

}