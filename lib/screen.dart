import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Screen extends StatelessWidget {
  const Screen({
    super.key,
    required this.count,
    required this.sharedPreferences,
  });

  // The count to display
  final int count;

  // The shared preferences object to use
  final SharedPreferences sharedPreferences;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Text(count.toString()),
            // Button that clears the shared preferences and preserves the current theme setting
            ElevatedButton(
              onPressed: () {
                bool theme = sharedPreferences.getBool("theme") ?? false;
                sharedPreferences.clear();
                sharedPreferences.setBool("theme", theme);
              },
              child: const Text("Clear"),
            ),
          ],
        ),
      ),
    );
  }
}