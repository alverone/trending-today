import 'package:flutter/material.dart';

import './screens/home_screen.dart';
import './theme/theme.dart';

void main() => runApp(const App());

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Trending today',
      theme: theme,
      home: const HomeScreen(),
    );
  }
}
