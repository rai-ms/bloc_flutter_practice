import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_practice/bloc/internet_bloc/internet_bloc.dart';
import 'package:flutter_bloc_practice/bloc/internet_bloc/internet_state.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    double padding =  MediaQuery.of(context).viewPadding.top;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        width: width,
        padding: EdgeInsets.only(top: padding),
        decoration:const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.greenAccent, Colors.red, Colors.greenAccent,Colors.blue,Colors.greenAccent],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight
          )
        ),
        child: BlocConsumer<InternetBloc, InternetState>(
          listener:(context,state)
            {
              if(state is InternetGainedState){
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(backgroundColor: Colors.green, content: Center(child: Text("Connected",)))
                );
              }
              else if(state is InternetLostState){
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(backgroundColor: Colors.green, content: Center(child: Text("Not Connected",)))
                );
              }
              else {
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(backgroundColor: Colors.green, content: Center(child: Text("Connecting ..",)))
                );
              }
            },
          builder: (context,state)
          {
            String sta = "";
            if(state is InternetGainedState){ sta = "Connected"; }
            else if(state is InternetLostState){ sta = "Not Connected"; }
            else { sta = "Connecting .."; }
            return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(sta),
              Text(sta),
              Text(sta),
              Text(sta),
              Text(sta),
            ]);
          },
        ),
      ),
    );
  }
}
