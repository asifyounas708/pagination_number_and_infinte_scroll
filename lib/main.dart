import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:riverpod_lifecycle/observer/logger.dart';
import 'package:riverpod_lifecycle/number_pagination/products/product_page.dart';
import 'package:riverpod_lifecycle/pages/products/product_page.dart';
import 'package:riverpod_lifecycle/widget/custom_button.dart';

void main() {
  runApp(
    const ProviderScope(
      // observers: [Logger()],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Proucts',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          shrinkWrap: true,
          children: const [
            CustomButton(
              title: "Product Page",
              child: InfiniteProductScroll(),
            ),
          ],
        ),
      ),
    );
  }
}
