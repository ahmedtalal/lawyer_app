import 'dart:async';

abstract class IAuthInterface {
  FutureOr<dynamic> loginOpt(var data);
  FutureOr<dynamic> login(var data);
  FutureOr<dynamic> register(var data);
}
