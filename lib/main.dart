import 'dart:async';
import 'dart:developer';
import 'package:freeclimbers_employee/repositories/app/app_repository.dart';
import 'package:freeclimbers_employee/repositories/branches/branches_repository.dart';
import 'package:freeclimbers_employee/repositories/language/language_repository.dart';
import 'package:freeclimbers_employee/repositories/member/member_repository.dart';
import 'package:freeclimbers_employee/repositories/membercard/membercard_repository.dart';
import 'package:freeclimbers_employee/repositories/qr_code/qr_code_repository.dart';
import 'package:freeclimbers_employee/repositories/security/security_repository.dart';
import 'package:freeclimbers_employee/repositories/theme_repository/theme_repository.dart';
import 'package:freeclimbers_employee/repositories/tutorial/tutorial_repository.dart';
import 'package:freeclimbers_employee/services/app/app_service.dart';
import 'package:freeclimbers_employee/services/branches/branches_service.dart';
import 'package:freeclimbers_employee/services/member/member_service.dart';
import 'package:freeclimbers_employee/services/membercard/membercard_service.dart';
import 'package:freeclimbers_employee/services/qr_code/qr_code_service.dart';
import 'package:freeclimbers_employee/simple_bloc_observer.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/services.dart';
import 'package:app_links/app_links.dart';

import 'package:freeclimbers_employee/blocs/app_cubit/app_cubit.dart';
import 'package:freeclimbers_employee/blocs/connectivity_bloc/connectivity_bloc.dart';
import 'package:freeclimbers_employee/blocs/locale_cubit/locale_cubit.dart';
import 'package:freeclimbers_employee/blocs/security_bloc/security_bloc.dart';
import 'package:freeclimbers_employee/blocs/theme_bloc/theme_bloc.dart';
import 'package:freeclimbers_employee/consts/k_colors.dart';
import 'package:freeclimbers_employee/consts/no_internet_theme_colors.dart';
import 'package:freeclimbers_employee/extensions/brightness.dart';
import 'package:freeclimbers_employee/router.dart';
import 'package:freeclimbers_employee/ui/screens/auth/sign_in.dart';
import 'package:freeclimbers_employee/ui/screens/splash/splash_screen.dart';
import 'package:freeclimbers_employee/utils/dio.dart';
import 'package:freeclimbers_employee/ui/widgets/loading/overlay_loading.dart';
import 'package:freeclimbers_employee/utils/toasts.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:local_auth/local_auth.dart';
import 'package:oktoast/oktoast.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'data/shared_prefs/app_shared_prefs.dart';
import 'l10n/l10n.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  
  final sharedPrefs = await SharedPreferences.getInstance();
  await sharedPrefs.reload();
  final appSharedPrefs = AppSharedPrefs(sharedPreferences: sharedPrefs);

  OneSignal.shared.setLogLevel(OSLogLevel.verbose, OSLogLevel.none);
  OneSignal.shared.setAppId('77d0c650-b9e8-4563-acec-5488ac8f30cf');
  
  Bloc.observer = SimpleBlocObserver();

  final languageRepository = LanguageRepository(appSharedPrefs: appSharedPrefs);
  final localeCubit = LocaleCubit(languageRepository: languageRepository);
  final dio = Dio(BaseOptions(headers: {"Content-Type": "application/x-www-form-urlencoded"}))
    ..interceptors.add(JwtInterceptor())
    ..interceptors.add(LanguageInterceptor(localeCubit: localeCubit));


  final defaultBranch = (await AppLinks().getInitialAppLink())?.queryParameters["bid"];

  final memberRepository = MemberRepository(memberService: MemberService(dio: dio), appSharedPrefs: appSharedPrefs);
  final memberCardRepository = MemberCardRepository(memberCardService: MemberCardService());
  final rootLocalization = await AppLocalizations.delegate.load(Locale(localeCubit.state));
  final branchesRepository = BranchRepository(appService: AppService(dio: dio), branchService: BranchesService(dio: dio));
  final appRepository = AppRepository(appService: AppService(dio: dio), branchService: BranchesService(dio: dio), sharedPrefs: appSharedPrefs);
  final connectivityBloc = ConnectivityBloc(connectionChecker: Connectivity());
  final appCubit = AppCubit(appRepository: appRepository, defaultBranch: defaultBranch == null ? null : int.tryParse(defaultBranch), connectivityBloc: connectivityBloc);
  final themeRepository = ThemeRepository(appSharedPrefs: appSharedPrefs);
  final themeBloc = ThemeBloc(themeRepository: themeRepository);
  final securityRepository = SecurityRepository(auth: LocalAuthentication(), localization: rootLocalization, appSharedPrefs: appSharedPrefs);
  
  runApp(MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (_) => appRepository),
        RepositoryProvider(create: (_) => memberCardRepository),
        RepositoryProvider(create: (_) => branchesRepository),
        RepositoryProvider(create: (_) => languageRepository),
        RepositoryProvider(create: (_) => memberRepository),
        RepositoryProvider(create: (_) => QrCodeRepository(qrCodeService: QrCodeService(dio: dio))),
        RepositoryProvider(create: (_) => securityRepository),
        RepositoryProvider(create: (_) => TutorialRepository(appSharedPrefs: appSharedPrefs)),
        RepositoryProvider(create: (_) => ThemeRepository(appSharedPrefs: appSharedPrefs)),
        RepositoryProvider(create: (_) => dio)
      ],
      child: MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => appCubit, lazy: false,),
            BlocProvider(create: (context) => localeCubit),
            BlocProvider(create: (context) => themeBloc),
            BlocProvider(create: (context) => connectivityBloc)
          ],
          child: App(localeCubit: localeCubit, themeBloc: themeBloc, dio: dio, rootConnectivityBloc: connectivityBloc, rootLocalization: rootLocalization, rootAppCubit: appCubit,))));
}

class App extends StatefulWidget{
  final LocaleCubit localeCubit;
  final AppLocalizations rootLocalization;
  final AppCubit rootAppCubit;
  final ThemeBloc themeBloc;
  final ConnectivityBloc rootConnectivityBloc;
  final Dio dio;
  const App({super.key, required this.dio, required this.localeCubit, required this.rootLocalization, required this.rootAppCubit, required this.rootConnectivityBloc, required this.themeBloc});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App>{

  late final StreamSubscription _routerSubscription;
  late final StreamSubscription _themeSubscription;

  @override
  void initState() {
    super.initState();
    router.addListener(_setStatusBarColor);
    _themeSubscription = widget.themeBloc.stream.listen((_) {
      _setStatusBarColor();
    });
    WidgetsBinding.instance.window.onPlatformBrightnessChanged = (){
      _setStatusBarColor();
    };
    widget.dio.interceptors..add(TimeoutInterceptor(
    onTimeoutError: (){
      widget.rootConnectivityBloc.add(const ConnectivityEvent.showTimeout());
    }
    ))..add(NoInternetInterceptor(
      connectivityBloc: widget.rootConnectivityBloc
    ));

  }

  @override
  void dispose() {
    _routerSubscription.cancel();
    _themeSubscription.cancel();
    super.dispose();
  }

  bool get isRouteWithoutNavbar => router.location == '/' || router.location == RouteNames.signIn || router.location == RouteNames.resetPassword;

  void _setStatusBarColor(){
    Future.delayed(const Duration(milliseconds: 300)).then((value){
      if(isRouteWithoutNavbar){
        SystemChrome.setSystemUIOverlayStyle(
            _styleWithoutNavbar()
        );
      }else{
        SystemChrome.setSystemUIOverlayStyle(
          _styleWithNavbar(),
        );
      }
    });
  }

  SystemUiOverlayStyle _styleWithNavbar(){
    return SystemUiOverlayStyle(
      statusBarColor: widget.themeBloc.state.brightness == Brightness.dark ? (widget.rootAppCubit.state.settings?.colors.dark ?? noInternetThemeColorsBlack).mainPrimaryBack : (widget.rootAppCubit.state.settings?.colors.light ?? noInternetThemeColorsWhite).mainPrimaryBack,
      statusBarBrightness: widget.themeBloc.state.brightness == Brightness.dark ? (widget.rootAppCubit.state.settings?.colors.dark ?? noInternetThemeColorsBlack).statusBarText.inverse : (widget.rootAppCubit.state.settings?.colors.light ?? noInternetThemeColorsWhite).statusBarText.inverse,
      statusBarIconBrightness: widget.themeBloc.state.brightness == Brightness.dark ? (widget.rootAppCubit.state.settings?.colors.dark ?? noInternetThemeColorsBlack).statusBarText : (widget.rootAppCubit.state.settings?.colors.light ?? noInternetThemeColorsWhite).statusBarText,
    );
  }

  SystemUiOverlayStyle _styleWithoutNavbar(){
    return SystemUiOverlayStyle(
      statusBarColor: KColors.transparent,
      statusBarBrightness: widget.themeBloc.state.brightness,
      statusBarIconBrightness: widget.themeBloc.state.brightness.inverse,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AppCubit, AppState>(
        bloc: widget.rootAppCubit,
    listener: (context, state) {
      if(state.status == AppStateStatus.loaded){
        _setStatusBarColor();
      }
    },
    child: BlocBuilder<LocaleCubit,String>(
      bloc: widget.localeCubit,
      builder: (context,state) {
        return CupertinoApp.router(
            restorationScopeId: 'app',
            routerConfig: router,
            localizationsDelegates: const [
              DefaultMaterialLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              AppLocalizations.delegate,
            ],
          theme: const CupertinoThemeData(
            brightness: Brightness.dark,
            primaryColor: Colors.white,
            textTheme: CupertinoTextThemeData(
                textStyle: TextStyle(fontFamily: 'OpenSans')),
          ),
            locale: Locale(state),
            supportedLocales: L10n.all,
            title: 'Freeclimber',
            debugShowCheckedModeBanner: false,
            builder: (context,w){
              return Theme(
                data: ThemeData(
                  fontFamily: 'OpenSans'
                ),
                child: OKToast(
                  animationBuilder: const OffsetAnimationBuilder(maxOffsetY: -100),
                    position: ToastPosition.top,
                    child: Overlay(
                      initialEntries:
                      [
                        OverlayEntry(builder: (context) => LoaderOverlay(
                            overlayOpacity: 0,
                            overlayColor: KColors.transparent,
                            useDefaultLoading: false,
                            overlayWidget: const OverlayLoadingWidget(),
                            child: w!)),],
                    )),
              );
            },
          );
      },
    ),
);
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final bool _loaded = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, (){
      if(context.read<AppCubit>().defaultBranch != null){
        router.push(RouteNames.signUp);
      }
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return _loaded ? const SignInScreen() : const SplashScreen();
  }
}