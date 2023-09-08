import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_practice/modules/formValidationbloc/bloc/validate_event.dart';
import 'package:flutter_bloc_practice/modules/formValidationbloc/bloc/validate_state.dart';
import 'package:flutter_bloc_practice/services/utils/text/app_text.dart';

class ValidateBloc extends Bloc<ValidateEvent, ValidateState>
{
  ValidateBloc():super(InitialValidateState()){
    on<ValidateTextFieldEvent>((event, emit) {
      if(event.emailValue.isEmpty || !isValidEmail(event.emailValue)){
        emit(ErrorValidateState(errorMessage: AppText.enterValidEmail));
      }
      else if(event.passValue.length <= 6)
        {
          emit(ErrorValidateState(errorMessage: AppText.passwordMustBeGreater));
        }
      else
      {
        emit(ValidValidateState());
      }
    });
    on<ValidateSubmitButton>((event, emit) {
      emit(LoadingValidateState());
    });
  }

  bool isValidEmail(email){
    final bool emailValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
    return emailValid;
  }
}

