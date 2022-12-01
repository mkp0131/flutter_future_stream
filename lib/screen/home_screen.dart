import 'package:flutter/material.dart';
import 'package:future_and_stream_builder/screen/future_screen.dart';
import 'package:future_and_stream_builder/screen/stream_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => FutureScreen(),
                  ));
                },
                child: Text('FuturBuilder'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => StreamScreen(),
                  ));
                },
                child: Text('StreamBuilder'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
