import 'package:flutter/material.dart';
import 'package:flutter_start_repo/models/User.dart';
import 'package:flutter_start_repo/repository/UserRepository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'mock_test.mocks.dart';

@GenerateMocks([UserRepository], customMocks: [MockSpec<UserRepository>(
    as: #UserRepositoryMock,
    returnNullOnMissingStub: true)])
void main() {
  group("testing user repository", () {
    late MockUserRepository userRepo;
    setUp(() {
      userRepo = MockUserRepository();
    });

    tearDown(() {});

    test("testing mockito", () async {
      when(userRepo.getUserInfo()).thenReturn(User(id: "123", username: "madhavth"));
      expect(userRepo.getUserInfo()?.username, "madhavth");

      when(userRepo.authenticateUser("madhavth", "pass")).thenAnswer((realInvocation) async {
        print("named arguments are -- " + realInvocation.namedArguments.toString());
        return User(id: "1",username: "madhavth",token: "ASDSADASDASDSA");
      });

      expectLater((await userRepo.authenticateUser("madhavth", "pass")).id, "1");

      verify(userRepo.authenticateUser("madhavth", "pass"));
      verify(userRepo.getUserInfo());
    });
  });
}
