import 'dart:convert';

import 'package:amazon/constants/error_handling.dart';
import 'package:amazon/constants/utils.dart';
import 'package:http/http.dart' as http;
import 'package:amazon/models/product.dart';
import 'package:amazon/provider/user_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

String uri = 'http://localhost:4000';

class HomeService {
  Future<List<Product>> fetchCategoryProducts(
      {required BuildContext context, required String category}) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);

    List<Product> products = [];

    try {
      http.Response res = await http
          .get(Uri.parse('$uri/api/products?category=$category'), headers: {
        'Content-type': 'application/json; charset=UTF-8',
        'x-auth-token': userProvider.user.token,
      });

      httpErrorHandle(
          response: res,
          context: context,
          onSuccess: () {
            for (int i = 0; i < jsonDecode(res.body).length; i++) {
              products
                  .add(Product.fromJson(jsonEncode(jsonDecode(res.body)[i])));
            }
          });
    } catch (e) {
      showSnackBar(context, e.toString());
    }

    return products;
  }
}
