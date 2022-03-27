import 'package:flutter_start_repo/features/login/data/models/user.dart';
import 'package:flutter_start_repo/features/login/domain/repositories/user_repository.dart';
import 'package:flutter_start_repo/features/login/domain/use_cases/login/login_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockUserRepository extends Mock implements UserRepository {}

void main() {
  late LoginUseCase useCase;
  late MockUserRepository mockUserRepository;

  setUp(() {
    mockUserRepository = MockUserRepository();
    useCase = LoginUseCase(mockUserRepository);
  });

  const tUser = "Madhav";
  const tPass = "Thapa";
  final tResponse = User(id: "1", token: "token", username: tUser);

  test('should login and get proper user response', () async {
    when(mockUserRepository.authenticateUser(tUser, tPass)).thenAnswer(
      (realInvocation) async => tResponse,
    );

    final result = await useCase.execute(LoginParams(tUser, tPass));
    expect(result, tResponse);
    verify(mockUserRepository.authenticateUser(tUser, tPass));
    verifyNoMoreInteractions(mockUserRepository);
  });
}
