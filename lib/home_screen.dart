import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ちんすこうクリッカー'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {},
          child: Text('Go to Second Screen'),
        ),
      ),
    );
  }
}
