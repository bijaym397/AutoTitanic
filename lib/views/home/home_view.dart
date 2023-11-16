import 'package:auto_titanic/views/home/widgets/widgets.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  static const String route = '/home';

  @override
  Widget build(BuildContext context) => const Scaffold(
        appBar: DashboardHeader(),
        body: Center(
          child: Text('Home View'),
        ),
      );
}
