import 'package:digital_wallet/export.dart';
import 'package:digital_wallet/presentation/screens/host_page/export.dart';

class AppRoutes {
  static const initializer = '/';
  static const signIn = '/signInScreen';
  static const signupScreen = '/signUpScreen';
  static const dashboardScreen = '/dashboardScreen';
  static const hostPage = '/hostPage';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    _currentRoute = settings.name;
    Map<String, dynamic>? args = settings.arguments as Map<String, dynamic>?;

    switch (settings.name) {
      case initializer:
        return MaterialPageRoute(
          builder: (_) => SignInScreen(),
        );
      case signupScreen:
        return MaterialPageRoute(
          builder: (_) => SignUpScreen(),
        );
      case dashboardScreen:
        return MaterialPageRoute(
          builder: (_) => const DashboardScreen(),
        );
      case hostPage:
        return MaterialPageRoute(
          builder: (_) => HostPage(),
        );
      default:
        return _errorRoute();
    }
  }

  static bool isCurrent(String newRoute) {
    return newRoute == _currentRoute;
  }

  static String? _currentRoute;

  static void setCurrent(String route) {
    _currentRoute = route;
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Error'),
          ),
          body: const Center(
            child: Text('Error'),
          ),
        );
      },
    );
  }
}
