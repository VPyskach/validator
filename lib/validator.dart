abstract class Validator<T, F> {
  ValidationResult<F> validate(T data);
}

abstract class ValidationResult<T> {
  ValidationResult._();

  factory ValidationResult.success() = Success;

  factory ValidationResult.failed(T failure) = Failed;

  R fold<R>(R Function() success, R Function(T failure) failed) {
    if (this is Failed<T>) {
      return failed((this as Failed<T>).failure);
    }

    return success();
  }
}

class Success<T> extends ValidationResult<T> {
  Success() : super._();
}

class Failed<T> extends ValidationResult<T> {
  Failed(this.failure) : super._();

  final T failure;
}
