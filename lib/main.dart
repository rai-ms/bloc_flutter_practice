import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_practice/bloc/internet_bloc/internet_bloc.dart';
import 'package:flutter_bloc_practice/services/utils/navigate_route.dart';
import 'package:flutter_bloc_practice/services/utils/route_name.dart';

void main()
{
  runApp(const MyApp());
}

class MyApp extends StatelessWidget
{
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => InternetBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        initialRoute: RouteName.homePage,
        onGenerateRoute: NavigateRoute.onGenerate,
      ),
    );
  }

}