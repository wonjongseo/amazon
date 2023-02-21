import 'package:amazon/models/order.dart';
import 'package:amazon/screen/admin/service/admin_service.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  List<Order>? orders;
  final AdminService adminService = AdminService();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  fetchOrders() {}
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
