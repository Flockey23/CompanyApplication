class ConstantExpressions {
  static bool isValueEmpty(value) => (value == null || value.isEmpty);
  static final RegExp emailValid= RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

  Function(String) checkIsEmpty = (String value) {
    if (isValueEmpty(value)) {
      return 'Введите значение';
    }
    return null;
  };

  Function(String) checkEmail = (String value) {
    if (!emailValid.hasMatch(value)){
      return "Неверный формат! Пример: ${"example@example.com"}";
    }
    return null;
  };
}