import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:rnc_mobile/dependency_injection.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/constants.dart';
import '../../home/home_page.dart';
import '../../login/login_page.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashInitial());

  void onLoadingApp() async {
    emit(SplashLoading());
    await getIt.allReady();

    final prefs = getIt.get<SharedPreferences>();

    await Future.delayed(const Duration(seconds: 2));

    if (prefs.getBool(klogged_in) ?? false) {
      emit(SplashSuccess(HomePage.routeName));
    } else {
      emit(SplashSuccess(LoginPage.routeName));
    }
  }
}
