import 'package:get_it/get_it.dart';

import 'application/email/email_bloc.dart';

final sl = GetIt.instance;

void setupLocator() {
    sl.registerLazySingleton(() => EmailBloc(EmailInitial()));
}
