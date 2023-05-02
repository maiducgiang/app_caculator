import 'package:get_it/get_it.dart';
import 'package:mubaha/data/firebase/firebase_manager.dart';
import 'package:mubaha/ui/app_cubit.dart';
import 'package:mubaha/ui/theme/theme_cubit.dart';

final getIt = GetIt.instance;
void configureDependencies() {
  getIt.registerLazySingleton<AppCubit>(() => AppCubit());
  getIt.registerLazySingleton<ThemeCubit>(() => ThemeCubit());
  getIt.registerLazySingleton<FirebaseManager>(() => FirebaseManager());
}
