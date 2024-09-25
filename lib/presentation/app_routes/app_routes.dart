import 'package:digital_wallet/export.dart';

class AppRoutes {
  static const initializer = '/';
  static const signInScreen = '/signInScreen';
  static const signupScreen = '/signUpScreen';
  static const dashboardScreen = '/dashboardScreen';
  static const hostPage = '/hostPage';
  static const sendMoney = '/sendMoney';
  static const allDoneScreen = '/allDoneScreen';
  static const verificationScreen = '/verificationScreen';
  static const paymentDetailScreen = '/paymentDetailScreen';
  static const onboardingScreen = '/onboardingScreen';
  static const forgetPasswordScreen = '/forgetPasswordScreen';
  static const verifyAccountScreen = '/verifyAccountScreen';
  static const createNewPasswordScreen = '/createNewPasswordScreen';
  static const requestMoneyScreen = '/requestMoney';
  static const requestDetailsScreen = '/requestDetailsScreen';
  static const profileScreen = '/profileScreen';
  static const welcomeScreen = '/welcomeScreen';
  static const pendingPaymentRequestsScreen = '/pendingPaymentRequestsScreen';
  static const transactionDetailScreen = '/transactionDetailScreen';
  static const electricityScreen = '/electricityScreen';
  static const historyScreen = '/historyScreen';
  static const statisticsScreen = '/statisticsScreen';
  static const welcomeToMerchantScreen = '/welcomeMerchantScreen';
  static const becomeMerchantScreen = '/becomeMerchantScreen';
  static const notificationScreen = '/notificationScreen';
  static const merchantQRScreen = '/merchantQRScreen';
  static const merchantDashboardScreen = '/merchantDashboardScreen';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    _currentRoute = settings.name;
    Map<String, dynamic>? args = settings.arguments as Map<String, dynamic>?;

    switch (settings.name) {
      case signInScreen:
        return MaterialPageRoute(
          builder: (_) => SignInScreen(),
        );
      case onboardingScreen:
        return MaterialPageRoute(
          builder: (_) => OnboardingScreen(),
        );
      case notificationScreen:
        return MaterialPageRoute(
          builder: (_) => const NotificationScreen(),
        );
      case allDoneScreen:
        return MaterialPageRoute(
          builder: (_) => const AllDoneScreen(),
        );
      case welcomeScreen:
        return MaterialPageRoute(
          builder: (_) => const WelcomeScreen(),
        );
      case welcomeToMerchantScreen:
        return MaterialPageRoute(
          builder: (_) => const WelcomeToMerchantScreen(),
        );
      case merchantQRScreen:
        return MaterialPageRoute(
          builder: (_) => const MerchantQrScreen(),
        );
      case merchantDashboardScreen:
        return MaterialPageRoute(
          builder: (_) => const MerchantDashboardScreen(),
        );
      case becomeMerchantScreen:
        return MaterialPageRoute(
          builder: (_) => BecomeMerchantScreen(),
        );
      case pendingPaymentRequestsScreen:
        return MaterialPageRoute(
          builder: (_) => const PendingPaymentRequestsScreen(),
        );
      case statisticsScreen:
        return MaterialPageRoute(
          builder: (_) => StatisticsScreen(),
        );
      case electricityScreen:
        return MaterialPageRoute(
          builder: (_) => ElectricityScreen(),
        );
      case historyScreen:
        return MaterialPageRoute(
          builder: (_) => const HistoryScreen(),
        );
      case signupScreen:
        return MaterialPageRoute(
          builder: (_) => SignUpScreen(),
        );
      case profileScreen:
        return MaterialPageRoute(
          builder: (_) => const ProfileScreen(),
        );
      case verifyAccountScreen:
        return MaterialPageRoute(
          builder: (_) => VerifyAccountScreen(),
        );
      case transactionDetailScreen:
        return MaterialPageRoute(
          builder: (_) => TransactionDetailScreen(
            data: args?['data'] as MoneyRequest,
            receivedRequest: args?['receivedRequest'] ?? true,
          ),
        );
      case requestDetailsScreen:
        return MaterialPageRoute(
          builder: (_) => RequestMoneyDetailsScreen(
            amount: args?["Amount"],
            email: args?["Email"],
          ),
        );
      case sendMoney:
        return MaterialPageRoute(
          builder: (_) => SendMoneyScreen(),
        );
      case requestMoneyScreen:
        return MaterialPageRoute(
          builder: (_) => RequestMoneyScreen(),
        );
      case createNewPasswordScreen:
        return MaterialPageRoute(
          builder: (_) => CreateNewPasswordScreen(
            otp: args?["otp"],
          ),
        );
      case paymentDetailScreen:
        return MaterialPageRoute(
          builder: (_) => PaymentDetailScreen(
            amount: args?["Amount"],
            email: args?["Email"],
          ),
        );
      case forgetPasswordScreen:
        return MaterialPageRoute(
          builder: (_) => ForgotPasswordScreen(),
        );
      case verificationScreen:
        return MaterialPageRoute(
          builder: (_) => OtpVerificationScreen(
            email: args?['Email'],
            dashboardRoute: args?['Route'],
          ),
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
