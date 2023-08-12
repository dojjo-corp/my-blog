import 'package:dojjoblog/authentication/repository/firestore_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepository {
  final auth = FirebaseAuth.instance;
  final store = FirestoreRepo();

  Future<UserCredential> login(
      {required String email, required String password}) async {
    return await auth.signInWithEmailAndPassword(email: email, password: password);
  }

  Future<UserCredential> register({
    required String email,
    required String password,
    required String fName,
    required String lName,
    required String username,
  }) async {

    try {
      final user = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
       await user.user?.updateDisplayName(fName);
      // create fierstore document entry for user
      store.createUserDoc(
        fName: fName,
        lName: lName,
        email: email,
        username: username,
      );

      return user;
    } on FirebaseException catch (e) {
      throw(e.code);
    }
  }
}
