class Constants {
  static bool isValueEmpty(value) => (value == null || value.isEmpty);

  Function(String) checkIsEmpty = (String value) {
    if (isValueEmpty(value)) {
      return 'Введите значение';
    }
    return null;
  };
}