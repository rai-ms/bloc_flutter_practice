import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_practice/bloc/internet_bloc/internet_bloc.dart';
import 'package:flutter_bloc_practice/bloc/internet_bloc/internet_state.dart';
import 'package:flutter_bloc_practice/services/utils/colors/app_colors.dart';
import 'package:flutter_bloc_practice/services/utils/text/app_text.dart';

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
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: AppColors.gradientBackground,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight
          )
        ),
        child: BlocConsumer<InternetBloc, InternetState>(
          listener:(context,state)
            {
              if(state is InternetGainedState){
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(backgroundColor: AppColors.greenColor, content: const Center(child: Text(AppText.connected,)))
                );
              }
              else if(state is InternetLostState){
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(backgroundColor: AppColors.greenColor, content: const Center(child: Text(AppText.notConnected,)))
                );
              }
              else {
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(backgroundColor: AppColors.greenColor, content: const Center(child: Text(AppText.connecting,)))
                );
              }
            },
          builder: (context,state)
          {
            String sta = AppText.empty;
            if(state is InternetGainedState){ sta = AppText.connected; }
            else if(state is InternetLostState){ sta = AppText.notConnected; }
            else { sta = AppText.connecting; }
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
