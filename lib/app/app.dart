import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile_guys_run/localizations/app_localization.dart';
import 'package:mobile_guys_run/modules/maps/google_map.dart';
import 'package:mobile_guys_run/modules/splash_screen/splash_screen.dart';
import 'package:mobile_guys_run/repository/authentication_repository.dart';
import 'package:mobile_guys_run/modules/authenticate/find/find_code_screen.dart';
import 'package:mobile_guys_run/modules/authenticate/find/find_next_screen.dart';
import 'package:mobile_guys_run/modules/authenticate/find/find_screen.dart';
import 'package:mobile_guys_run/modules/authenticate/signup/sign_up_screen.dart';
import '../modules/authenticate/changeemail/change_email_screen.dart';
import '../modules/authenticate/changepass/change_password_screen.dart';
import '../modules/authenticate/signin/sign_in_screen.dart';
import 'package:mobile_guys_run/modules/authenticate/signin/sign_in_screen.dart';

import '../modules/authenticate/signup/sign_up_code_screen.dart';
import 'cubit/app_cubit.dart';
import 'cubit/app_state.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

// ignore: prefer_mixin
class _AppState extends State<App> with WidgetsBindingObserver {
  late AuthenticationRepository authenticationRepository;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    // whenever your initialization is completed, remove the splash screen:
    FlutterNativeSplash.remove();
    debugPrint('Remove Native Splash');
    authenticationRepository = AuthenticationRepository();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(428, 926),
      builder: (context, child) {
        return RepositoryProvider(
          create: (context) => authenticationRepository,
          child: MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) =>
                    AppCubit(AppInitial(), authenticationRepository)
                      ..fetchLocale(),
              ),
            ],
            child: GestureDetector(
              onTap: () {
                //Hide keyboard when tap outside
                WidgetsBinding.instance.focusManager.primaryFocus?.unfocus();
              },
              child: BlocBuilder<AppCubit, AppState>(
                builder: (context, state) {
                  return MaterialApp(
                      debugShowCheckedModeBanner: false,
                      locale: (state is AppLanguageFetchLocaleCompleted)
                          ? state.locale
                          : const Locale('vi'),
                      supportedLocales: AppLocalizations.supportedLocales,
                      localizationsDelegates: const [
                        AppLocalizations.delegate,
                        GlobalMaterialLocalizations.delegate,
                        GlobalWidgetsLocalizations.delegate,
                        GlobalCupertinoLocalizations.delegate
                      ],
                      theme: context.read<AppCubit>().styles.themeData,
                      routes: {
                        ChangePassScreen.route: (context) =>
                            const ChangePassScreen(),
                        ChangeEmailScreen.route: (context) =>
                            const ChangeEmailScreen(),
                        SignInScreen.route: (context) => const SignInScreen(),
                        SignUpScreen.route: (context) => const SignUpScreen(),
                        SignUpCodeScreen.route: (context) =>
                            const SignUpCodeScreen(),
                        FindScreen.route: (context) => const FindScreen(),
                        FindCodeScreen.route: (context) =>
                            const FindCodeScreen(),
                        FindNextScreen.route: (context) =>
                            const FindNextScreen()
                      },
                      home: const SignInScreen());
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
