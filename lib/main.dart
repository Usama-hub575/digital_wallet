import 'package:digital_wallet/export.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider.value(
          value: it<DashboardBloc>(),
        ),
        BlocProvider.value(
          value: it<AuthBloc>(),
        ),
        BlocProvider.value(
          value: it<HostBloc>(),
        ),
        BlocProvider.value(
          value: it<BecomeMerchantBloc>(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    initializeResources(context: context);
    return ScreenUtilInit(
      designSize: const Size(375, 800),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, _) {
        return MaterialApp(
          theme: appTheme,
          title: AppConstants.digitalWallet,
          debugShowCheckedModeBanner: false,
          onGenerateRoute: AppRoutes.generateRoute,
          initialRoute: AppRoutes.initializer,
        );
      },
    );
  }
}
