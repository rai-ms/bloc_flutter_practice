import 'package:flutter/material.dart';
import 'package:flutter_bloc_practice/modules/formValidationbloc/validate_form.dart';
import 'package:flutter_bloc_practice/modules/homepage/pages/homepage.dart';
import 'package:flutter_bloc_practice/modules/homepage/pages/homepage_cubit.dart';
import 'package:flutter_bloc_practice/services/utils/route_name.dart';

class NavigateRoute
{
  static Route<dynamic> onGenerate(RouteSettings settings)
  {
    switch (settings.name){
      case RouteName.homePage:
        return MaterialPageRoute(builder: (context)=> const MyHomePage());
      case RouteName.homePageCubit:
        return MaterialPageRoute(builder: (context)=> const MyHomePageCubit());
      case RouteName.validateFormPage:
        return MaterialPageRoute(builder: (context)=> const ValidateFormBloc());
      default:
        return  MaterialPageRoute(builder: (context)=>const Scaffold(
          body: Center(
            child: Text("Error 404"),
          ),
        ));
    }
  }
}