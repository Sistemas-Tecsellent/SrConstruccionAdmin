import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class PortalAdminFirebaseUser {
  PortalAdminFirebaseUser(this.user);
  User user;
  bool get loggedIn => user != null;
}

PortalAdminFirebaseUser currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<PortalAdminFirebaseUser> portalAdminFirebaseUserStream() => FirebaseAuth
    .instance
    .authStateChanges()
    .debounce((user) => user == null && !loggedIn
        ? TimerStream(true, const Duration(seconds: 1))
        : Stream.value(user))
    .map<PortalAdminFirebaseUser>(
        (user) => currentUser = PortalAdminFirebaseUser(user));
