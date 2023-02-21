import 'package:amazon/constants/global_variables.dart';
import 'package:amazon/models/product.dart';
import 'package:amazon/screen/home/services/home_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class CategoryDeailScren extends StatefulWidget {
  static const String routeName = '/category-deals';
  final String category;
  const CategoryDeailScren({super.key, required this.category});

  @override
  State<CategoryDeailScren> createState() => _CategoryDeailScrenState();
}

class _CategoryDeailScrenState extends State<CategoryDeailScren> {
  List<Product>? product;
  final HomeService homeService = HomeService();

  @override
  void initState() {
    super.initState();
    fetchCategoryProducts();
  }

  fetchCategoryProducts() async {
    product = await homeService.fetchCategoryProducts(
        context: context, category: widget.category);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          flexibleSpace: Container(
            decoration:
                const BoxDecoration(gradient: GlobalVariables.appBarGradient),
          ),
          title: Text(widget.category,
              style: const TextStyle(color: Colors.black)),
        ),
      ),
    );
  }
}
