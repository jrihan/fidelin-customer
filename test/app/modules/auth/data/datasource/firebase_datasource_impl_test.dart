import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:customer/app/modules/auth/data/datasources/auth_datasource.dart';
import 'package:customer/app/modules/auth/data/datasources/firebase_datasource_impl.dart';
import 'package:customer/app/modules/auth/data/dto/user_dto.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:firebase_auth_mocks/firebase_auth_mocks.dart'
    as FirebaseAuthMocks;

import 'firebase_datasource_impl_test.mocks.dart';

@GenerateMocks([FirebaseFirestore, FirebaseAuth])
main() {
  group("Using FakeFirebase", () {
    FirebaseAuthMocks.MockUser user = FirebaseAuthMocks.MockUser(
      isAnonymous: false,
      uid: 'someuid',
      email: 'bob@somedomain.com',
      displayName: 'Bob',
    );

    final FakeFirebaseFirestore store = FakeFirebaseFirestore();
    final FirebaseAuth auth =
        FirebaseAuthMocks.MockFirebaseAuth(mockUser: user);

    AuthDataSource datasource = FirebaseDataSourceImpl(store, auth);

    test("Should return a UserDTO when signInWithEmail is called", () async {
      await store.collection('users').add(const UserDTO(
            id: 'someuid',
            firstName: 'firstName',
            lastName: 'lastName',
            email: 'email',
            phone: 'phone',
            gender: 'gender',
            avatarUrl: 'avatar_url',
          ).toMap());

      final result = await datasource.signInWithEmail(
          email: 'test@mail.com', password: '12345678');

      expect(result, isA<UserDTO>());
    });
  });

  group("Using Mocks", () {
    final FirebaseFirestore store = MockFirebaseFirestore();
    final FirebaseAuth auth = MockFirebaseAuth();

    AuthDataSource datasource = FirebaseDataSourceImpl(store, auth);
    test("Should return a FirebaseAuthException when signInWithEmail is called",
        () async {
      when(auth.signInWithEmailAndPassword(
              email: 'test@mail.com', password: '87654321'))
          .thenThrow(FirebaseAuthException(code: 'wrong-password'));

      expect(
          () => datasource.signInWithEmail(
              email: 'test@mail.com', password: '87654321'),
          throwsA(isA<FirebaseAuthException>()));
    });
  });
}
