import 'dart:async';

import 'package:hokok/core/debug_prints.dart';

abstract class IAuthInterface {
  FutureOr<dynamic> loginOpt(var data);
  FutureOr<dynamic> login(var data);
  FutureOr<dynamic> register(var data);
  bool checkUserIsLogined();
  FutureOr<bool> logOut();
}
