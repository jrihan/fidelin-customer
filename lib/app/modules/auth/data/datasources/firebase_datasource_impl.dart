import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:customer/app/modules/auth/data/dto/user_dto.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'auth_datasource.dart';

class FirebaseDataSourceImpl implements AuthDataSource {
  final FirebaseFirestore firestore;
  final FirebaseAuth auth;

  CollectionReference get userCollection => firestore.collection('customers');
  CollectionReference get costumerCardsCollection =>
      firestore.collection('customer_cards');

  FirebaseDataSourceImpl(this.firestore, this.auth);

  @override
  Future<UserDTO> signInWithEmail(
      {required String email, required String password}) async {
    try {
      final UserCredential credential = await auth.signInWithEmailAndPassword(
          email: email, password: password);

      final snapshot = await userCollection.doc(credential.user?.uid).get();

      // final snapshot2 = await costumerCardsCollection
      //     .where("user_id", isEqualTo: credential.user?.uid)
      //     .get();

      return UserDTO.fromSnapshot(snapshot);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> signUpWithEmail(UserDTO user) async {
    try {
      final UserCredential credential =
          await auth.createUserWithEmailAndPassword(
              email: user.email, password: user.password);

      await userCollection.doc(credential.user?.uid).set(user.toMap());
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> signOut() async {
    try {
      await auth.signOut();
    } catch (e) {
      rethrow;
    }
  }
}
