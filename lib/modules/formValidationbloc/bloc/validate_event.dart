abstract class ValidateEvent
{}

class ValidateTextFieldEvent extends ValidateEvent
{
  String emailValue;
  String passValue;

  ValidateTextFieldEvent({required this.emailValue, required this.passValue});

}

class ValidateSubmitButton extends ValidateEvent
{
  String email;
  String pass;

  ValidateSubmitButton({required this.pass, required this.email});
}


