import 'package:flutter/material.dart';

import 'package:sticky/services/lens_client.dart';

import 'utils/utils.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sticky',
      theme: stickyTheme,
      home: const LensClient(),
    );
  }
}
