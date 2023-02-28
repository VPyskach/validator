import 'validator.dart';

class PasswordValidator extends Validator<String, PasswordValidationFailure> {
  @override
  ValidationResult<PasswordValidationFailure> validate(String data) {
    if (data.isEmpty) {
      return ValidationResult.failed(PasswordValidationFailure.emptyField);
    }

    if (data.length < 6) {
      return ValidationResult.failed(
          PasswordValidationFailure.notEnoughSymbols);
    }

    return ValidationResult.success();
  }
}

enum PasswordValidationFailure { emptyField, notEnoughSymbols }
