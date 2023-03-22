import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/category.dart';
import '../models/company.dart';

class HomeScreenProvider with ChangeNotifier {
  List<Category> _allCategories = [];
  List<Category> get allCategories {
    return _allCategories;
  }

  List<Company> _allCompany = [];
  List<Company> get allCompany {
    return [..._allCompany];
  }

  Future<void> getHomeScreenData() async {
    await _getAllCategory();
    await _getAllCompany();
  }

  Future<void> _getAllCategory() async {
    Uri url =
        Uri.parse('https://catalog.pythonanywhere.com/api/get-all-category/');
    // print('object');
    try {
      final response = await http.get(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
      );
      List data = jsonDecode(response.body);
      _allCategories = data.map((e) => Category.getCategory(e)).toList();
      notifyListeners();
    } catch (error) {
      print(error);
    }
  }

  Future<void> _getAllCompany() async {
    Uri url =
        Uri.parse('https://catalog.pythonanywhere.com/api/get-all-company/');
    http.Response response = await http.get(url);
    List data = jsonDecode(response.body);
    _allCompany = data
        .map(
          (e) => Company.getCompany(e),
        )
        .toList();
    // print(_allCompany);
    notifyListeners();
  }
}
