import 'package:flutter/material.dart';
import 'package:flutter_application_4/cubit/click_cubit.dart';
import 'package:flutter_application_4/cubit/theme_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ClickCubit>(
          create: (BuildContext context) => ClickCubit(),
        ),
        BlocProvider<ThemeCubit>(
          create: (BuildContext context) => ThemeCubit(),
        ),
      ],
      child: BlocBuilder<ThemeCubit, ThemeMode>(
        builder: (context, state) {
          return MaterialApp(
            theme: ThemeData.light(),
            darkTheme: ThemeData.dark(),
            themeMode: state,
            home: const MyHomePage(),
          );
        },
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<ThemeCubit>().onThemeChange();
          context.read<ClickCubit>().changeTheme();
        },
        child: const Icon(Icons.add),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            BlocBuilder<ClickCubit, ClickState>(
              builder: (context, state) {
                if (state is ClickError) {
                  return Text(
                    state.message,
                    style: Theme.of(context).textTheme.headline4,
                  );
                }
                if (state is Click) {
                  return Text(
                    state.count.toString(),
                    style: Theme.of(context).textTheme.headline4,
                  );
                }
                return Container();
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                    child: const Icon(Icons.remove),
                    onPressed: () => context.read<ClickCubit>().onClickRemove()),
                FloatingActionButton(
                    child: const Icon(Icons.add),
                    onPressed: () => context.read<ClickCubit>().onClickPlus()),
              ],
            ),
            BlocBuilder<ClickCubit, ClickState>(
              builder: (context, state) {
                List<Text> elements = [];
                if (state is Click) {
                  for (var log in state.logs) {
                    elements.add(Text(
                      log,
                    ));
                  }
                }

                return ListView(
                  shrinkWrap: true,
                  children: elements,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
