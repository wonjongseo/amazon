import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class AccountScreen extends StatelessWidget {
  static const String routeName = '/account';
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('AccountScreen'),
    );
  }
}
