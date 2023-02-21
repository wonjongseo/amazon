import 'package:amazon/common/widget/loader.dart';
import 'package:amazon/models/product.dart';
import 'package:amazon/screen/admin/service/admin_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class PostsScreen extends StatefulWidget {
  const PostsScreen({super.key});

  @override
  State<PostsScreen> createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PostsScreen> {
  List<Product>? products;
  final AdminService adminService = AdminService();

  fetchAllProducts() async {
    products = await adminService.fetchAllProducts(context);
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    fetchAllProducts();
  }

  @override
  Widget build(BuildContext context) {
    return products == null
        ? Loader()
        : Scaffold(
            body: Container(child: Text('asd')),
          );
  }
}
