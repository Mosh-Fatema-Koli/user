import 'package:flutter/material.dart';
import 'package:user/http/custom_http_request.dart';
import 'package:user/model/user_model.dart';

class CategoryProvider with ChangeNotifier {
  List<CategoryModel> categoryList = [];
  late CategoryModel categoryModel;

  getCategory() async {
    categoryList = await CustomHttpRequest().getAllCategory();
    notifyListeners();
  }
}
