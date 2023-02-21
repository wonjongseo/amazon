import 'package:amazon/constants/global_variables.dart';
import 'package:amazon/provider/user_provider.dart';
import 'package:amazon/routes.dart';
import 'package:amazon/screen/admin/add_product_screen.dart';
import 'package:amazon/screen/admin/admin_screen.dart';
import 'package:amazon/screen/admin/posts_screen.dart';
import 'package:amazon/screen/aush/aush_screen.dart';
import 'package:amazon/screen/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => UserProvider(),
      )
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Amazon',
        theme: ThemeData(
          scaffoldBackgroundColor: GlobalVariables.backgroundColor,
          colorScheme:
              const ColorScheme.light(primary: GlobalVariables.secondaryColor),
          appBarTheme: const AppBarTheme(
              elevation: 0,
              iconTheme: IconThemeData(
                color: Colors.black,
              )),
        ),
        onGenerateRoute: (settings) => generateRoute(settings),
        home: const HomeScreen());
  }
}
