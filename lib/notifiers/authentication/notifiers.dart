export 'authentication_notifier.dart';
export 'authentication_state.dart';
import 'package:flutter_riverpod/all.dart';
import 'package:flutter_start_repo/repository/UserRepository.dart';

import 'authentication_notifier.dart';

final authenticationNotifierProvider =
StateNotifierProvider<AuthenticationNotifier>((ref) {
  final userRepository = ref.watch(userRepositoryProvider);
  return AuthenticationNotifier(userRepository: userRepository);
});
