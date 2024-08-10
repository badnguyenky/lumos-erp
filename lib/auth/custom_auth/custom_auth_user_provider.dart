import 'package:rxdart/rxdart.dart';

import 'custom_auth_manager.dart';

class LumosAuthUser {
  LumosAuthUser({required this.loggedIn, this.uid});

  bool loggedIn;
  String? uid;
}

/// Generates a stream of the authenticated user.
BehaviorSubject<LumosAuthUser> lumosAuthUserSubject =
    BehaviorSubject.seeded(LumosAuthUser(loggedIn: false));
Stream<LumosAuthUser> lumosAuthUserStream() =>
    lumosAuthUserSubject.asBroadcastStream().map((user) => currentUser = user);
