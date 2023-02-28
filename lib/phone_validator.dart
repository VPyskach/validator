import 'validator.dart';

class PhoneValidator extends Validator<String, PhoneValidationFailure> {
  @override
  ValidationResult<PhoneValidationFailure> validate(String data) {
    if (data.isEmpty) {
      return ValidationResult.failed(PhoneValidationFailure.emptyField);
    }

    return ValidationResult.success();
  }
}

enum PhoneValidationFailure {
  emptyField,
}
