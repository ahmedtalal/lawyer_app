/*
this class generate only one instance from any class using dependency injection
and singleton and by using this instance you can access any method from this class.
*/

class UseCaseProvider {
  static UseCaseProvider? _useCaseProvider;
  UseCaseProvider._internal();
  static UseCaseProvider instance() {
    if (_useCaseProvider == null) {
      return _useCaseProvider = UseCaseProvider._internal();
    }
    return _useCaseProvider!;
  }

  T creator<T>(T t) {
    return t;
  }
}
