import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_practice/modules/formValidationbloc/bloc/validate_bloc.dart';
import 'package:flutter_bloc_practice/modules/formValidationbloc/bloc/validate_state.dart';
import 'package:flutter_bloc_practice/services/utils/text/app_text.dart';

import 'bloc/validate_event.dart';

class ValidateFormBloc extends StatefulWidget {
  const ValidateFormBloc({super.key});

  @override
  State<ValidateFormBloc> createState() => _ValidateFormBlocState();
}

class _ValidateFormBlocState extends State<ValidateFormBloc> {

  final emailCont = TextEditingController();
  final passCont = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextFormField(
                onChanged: (value){
                  BlocProvider.of<ValidateBloc>(context).add(ValidateTextFieldEvent(emailValue: emailCont.text.toString().trim(), passValue: passCont.text.toString().trim()));
                },
                controller: emailCont,
                decoration: InputDecoration(
                  hintText: AppText.enterEmail,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.black, width: 1),
                  ),
                ),
              ),
              const SizedBox(height: 20,),
              TextFormField(
                controller: passCont,
                onChanged: (value){
                  BlocProvider.of<ValidateBloc>(context).add(ValidateTextFieldEvent(emailValue: emailCont.text.toString().trim(), passValue: passCont.text.toString().trim()));
                },
                decoration: InputDecoration(
                  hintText: AppText.enterPass,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.black, width: 1),
                  )
                ),
              ),

              const SizedBox(height: 20,),

              BlocBuilder<ValidateBloc, ValidateState>(
                builder: (context, state){
                  if (state is LoadingValidateState){
                    return const Center(child: CircularProgressIndicator());
                  }
                  return InkWell(
                    onTap: (){
                      if(state is ValidValidateState){
                        BlocProvider.of<ValidateBloc>(context).add(ValidateSubmitButton(email: emailCont.text.toString().trim(), pass: passCont.text.toString().trim()));
                      }
                    },
                    child: Container(
                      color: (state is ValidValidateState)?Colors.blue: Colors.blueGrey,
                      height: 60,
                      width: width,
                      child: const Center(child: Text(AppText.login, style: TextStyle(color: Colors.white, fontSize: 22),)),
                    ),
                  );
              }),

              BlocBuilder<ValidateBloc, ValidateState>(builder: (context,state){
                if(state is ErrorValidateState){
                  return const Text(AppText.errorOccured);
                }
                else if(state is InValidValidateState){
                  return const Text(AppText.invalidData);
                }
               else {
                  return const Text(AppText.loginSuccess);
                }
              })
            ],
          ),
        ),
      ),
    );
  }

  validateForm()
  {

  }
}
