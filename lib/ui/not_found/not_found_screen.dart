import 'package:flutter/material.dart';

class NotFoundScreen extends StatelessWidget {
  final String route;
  const NotFoundScreen({super.key, required this.route});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('Page on route: ${route} not found')),
    );
  }
}
