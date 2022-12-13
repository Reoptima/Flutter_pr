import 'package:five_project/screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'cubit/theme_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      // provide a `ThemeCubit` for the widget tree
      create: (context) => ThemeCubit(),
      child: BlocBuilder<ThemeCubit, ThemeMode>(
        // rebuild the widget tree when `ThemeCubit` emits a new state
        builder: (context, state) {
          return MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData.light(),
            darkTheme: ThemeData.dark(),
            themeMode: state, // current theme mode, determined by `ThemeCubit`
            home: const MyHomePage(title: 'Flutter Demo Home Page'),
          );
        },
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage(
      {super.key, required this.title}); // constructor for the home page widget

  final String title; // title for the home page

  @override
  State<MyHomePage> createState() =>
      _MyHomePageState(); // create a state for the home page widget
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  SharedPreferences? sharedPreferences; // instance of shared preferences

  Future<void> initShared() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  @override
  void initState() {
    // Call the superclass method
    super.initState();

    // Initialize shared preferences and then set the theme
    initShared().then((value) {
      var themeData = sharedPreferences?.getBool("theme") ?? false;
      context.read<ThemeCubit>().setTheme(themeData);

      // Get the counter value from shared preferences
      var data = sharedPreferences?.getInt("counter");

      // If the counter value exists, push a new screen onto the navigator
      if (data != null) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                Screen(count: data, sharedPreferences: sharedPreferences!),
          ),
        );
      }
    });
  }

  Future<void> _incrementCounter() async {
    // Increment the counter
    setState(() {
      _counter++;
    });

    // Save the new counter value to shared preferences
    await sharedPreferences?.setInt('counter', _counter);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Вы нажали на кнопку столько раз',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Screen(
                                count: _counter,
                                sharedPreferences: sharedPreferences!,
                              ),
                            ),
                          );
                        },
                        child: const Text("Click")),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: FloatingActionButton(
                      onPressed: () {
                        context.read<ThemeCubit>().changeTheme();
                        sharedPreferences?.setBool(
                            'theme', context.read<ThemeCubit>().getTheme());
                      },
                      tooltip: 'Theme',
                      child: const Icon(Icons.sunny),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
