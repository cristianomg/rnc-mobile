import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:rnc_mobile/app/models/login_user.dart';
import 'package:rnc_mobile/app/repositories/auth_repository.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthRepository _authRepository;

  LoginCubit(this._authRepository) : super(LoginInitial());

  void login(String email, String password) async {
    try {
      emit(LoginLoading());
      final user = LoginUser(email: email, password: password);
      await _authRepository.login(user);
      //Todo: Remover delay;
      await Future.delayed(const Duration(seconds: 2));
      emit(LoginSuccess());
    } catch (e) {
      emit(LoginErro(e.toString()));
    }
  }
}
