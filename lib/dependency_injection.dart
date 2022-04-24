import 'package:get_it/get_it.dart';
import 'package:rnc_mobile/app/controllers/register_controller.dart';
import 'package:rnc_mobile/app/pages/login/cubit/login_cubit.dart';
import 'package:rnc_mobile/app/repositories/auth_repository.dart';
import 'package:rnc_mobile/app/repositories/ocurrence_register_repository.dart';
import 'package:rnc_mobile/app/repositories/setor_repository.dart';
import 'package:rnc_mobile/app/repositories/user_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app/controllers/ocurrence_list_controller.dart';
import 'app/controllers/profile_controller.dart';

GetIt getIt = GetIt.instance;

void setupLocator() {
  //SharedPrefs
  getIt.registerSingletonAsync<SharedPreferences>(() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs;
  });

  //Repositories
  getIt.registerSingletonWithDependencies(() => AuthRepository(),
      dependsOn: [SharedPreferences]);
  getIt.registerSingleton<UserRepository>(UserRepository());
  getIt.registerSingleton<OcurrenceRegisterRepository>(
      OcurrenceRegisterRepository());
  getIt.registerSingleton<SetorRepository>(SetorRepository());

  //Controllers
  getIt.registerFactory<OcurrenceListController>(
      () => OcurrenceListController());
  getIt.registerFactory<ProfileController>(() => ProfileController());
  getIt.registerFactory<RegisterController>(() => RegisterController());

  //Cubits
  getIt.registerFactory(() => LoginCubit(getIt.get<AuthRepository>()));
}
