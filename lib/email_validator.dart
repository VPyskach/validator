import 'validator.dart';

class EmailValidator extends Validator<String, EmailValidationFailure> {
  @override
  ValidationResult<EmailValidationFailure> validate(String data) {
    if (data.isEmpty) {
      return ValidationResult.failed(EmailValidationFailure.emptyField);
    }

    var isValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(data);

    if (isValid) {
      return ValidationResult.success();
    } else {
      return ValidationResult.failed(EmailValidationFailure.invalid);
    }
  }
}

enum EmailValidationFailure { emptyField, invalid }
