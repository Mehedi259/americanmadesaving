import 'package:go_router/go_router.dart';

import '../../view/screens/auth/changed_password_success_screen.dart';
import '../../view/screens/user_flow/changed_password_screen.dart';
import '../../view/screens/auth/forget_password_screen.dart';
import '../../view/screens/auth/onboard1_screen.dart';
import '../../view/screens/auth/onboard2_screen.dart';
import '../../view/screens/auth/otp_after_forget_password_screen.dart';
import '../../view/screens/auth/otp_after_registration_screen.dart';
import '../../view/screens/auth/sign_in_screen.dart';
import '../../view/screens/auth/sign_up_screen.dart';
import '../../view/screens/user_flow/app_settings_screen.dart';
import '../../view/screens/auth/change_password_screen.dart';
import '../../view/screens/user_flow/home_all_product_screen.dart';
import '../../view/screens/user_flow/home_screen.dart';
import '../../view/screens/user_flow/product_details_screen.dart';
import '../../view/screens/user_flow/profile_screen.dart';
import '../../view/screens/user_flow/view_card_screen.dart';
import 'route_path.dart';

class AppRoutes {
  static final GoRouter router = GoRouter(
    initialLocation: RoutePath.onboard1,
    routes: [
      GoRoute(
        path: RoutePath.onboard1,
        builder: (context, state) => const Onboard1Screen(),
      ),
      GoRoute(
        path: RoutePath.onboard2,
        builder: (context, state) => const Onboard2Screen(),
      ),
      GoRoute(
        path: RoutePath.signUp,
        builder: (context, state) => const SignUpScreen(),
      ),
      GoRoute(
        path: RoutePath.otpAfterRegistration,
        builder: (context, state) => const OtpAfterRegistrationScreen(),
      ),
      GoRoute(
        path: RoutePath.signIn,
        builder: (context, state) => const SignInScreen(),
      ),
      GoRoute(
        path: RoutePath.forgetPassword,
        builder: (context, state) => const ForgetPasswordScreen(),
      ),
      GoRoute(
        path: RoutePath.otpAfterForgetPassword,
        builder: (context, state) => const OtpAfterForgetPasswordScreen(),
      ),
      GoRoute(
        path: RoutePath.changePassword,
        builder: (context, state) => const ChangedPasswordScreen(),
      ),
      GoRoute(
        path: RoutePath.changePasswordSuccess,
        builder: (context, state) => const ChangedPasswordSuccessScreen(),
      ),
      GoRoute(
        path: RoutePath.home,
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: RoutePath.allProducts,
        builder: (context, state) => const HomeAllProductScreen(),
      ),
      GoRoute(
        path: RoutePath.productDetails,
        builder: (context, state) => const ProductDetailsScreen(),
      ),
      GoRoute(
        path: RoutePath.viewCart,
        builder: (context, state) => const ViewCardScreen(),
      ),
      GoRoute(
        path: RoutePath.profile,
        builder: (context, state) => const ProfileScreen(),
      ),
      GoRoute(
        path: RoutePath.appSettings,
        builder: (context, state) => const AppSettingsScreen(),
      ),
      GoRoute(
        path: RoutePath.changePasswordSettings,
        builder: (context, state) => const ChangePasswordScreen(),
      ),
    ],
  );
}