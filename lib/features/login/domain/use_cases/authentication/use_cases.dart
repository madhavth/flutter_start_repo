import 'package:injectable/injectable.dart';

import 'fetch_user_info_use_case.dart';
import 'logout_use_case.dart';
import 'persist_user_use_case.dart';

@Injectable()
class AuthenticationUseCases {
  final LogoutUseCase logoutUseCase;
  final PersistUserInfoUseCase persistUserInfoUseCase;
  final FetchUserInfoUseCase fetchUserInfoUseCase;

  AuthenticationUseCases(
    this.logoutUseCase,
    this.persistUserInfoUseCase,
    this.fetchUserInfoUseCase,
  );
}
