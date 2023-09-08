abstract class ValidateState
{}

class InitialValidateState extends ValidateState
{}

class ValidValidateState extends ValidateState
{}

class InValidValidateState extends ValidateState
{}

class ErrorValidateState extends ValidateState
{
  final String errorMessage;
  ErrorValidateState({required this.errorMessage});
}

class LoadingValidateState extends ValidateState
{}