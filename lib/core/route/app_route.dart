import 'package:get/get.dart';
import 'package:splash_0nboard/modules/auth/pages/login_page.dart';
import 'package:splash_0nboard/modules/sing_up/view/role_view.dart';
import '../../modules/auth/pages/VerificationPage.dart';
import '../../modules/create_new_password/forget_password_page.dart';
import '../../modules/create_new_password/controllar/CreatePasswordController.dart';
import '../../modules/create_new_password/view/CreatePasswordView.dart';
import '../../modules/create_new_password/view/SuccessPasswordView.dart';
import '../../modules/onboarding/onboarding_controller.dart';
import '../../modules/register/controllar/RegisterController.dart';
import '../../modules/register/view/register_view.dart';
import '../../modules/sing_up/view/CompleteProfileView.dart';
import '../../modules/sing_up/view/ProfessionalDetailsView.dart';
import '../../modules/splash/pages/splash_screen.dart';
import '../../modules/onboarding/pages/onboarding_screen.dart';

class AppRoutes {
  static const splash = "/splash";
  static const onboarding = "/onboarding";
  static const completeProfile = "/completeProfile";

  static const login = "/login";
  static const forgetPassword = "/forgetPassword";
  static const verificationCode = "/verificationCode";
  static const createNewPassword = "/createNewPassword";
  static const successPassword = "/successPassword";
  static const register = "/register";
  static const professionalDetails = "/professionalDetails";
  static const loadingDashboard = "/loadingDashboard";
  static const signUpChoice = "/sign_up_choice";

  static final routes = [
    GetPage(name: splash, page: () => const SplashScreen()),

    GetPage(
      name: onboarding,
      page: () => OnboardingScreen(),
      binding: BindingsBuilder(() {
        Get.lazyPut<OnboardingController>(() => OnboardingController());
      }),
    ),
    GetPage(
      name: "/professionalDetails",
      page: () => const ProfessionalDetailsView(),
    ),
    GetPage(name: login, page: () => LoginPage()),

    GetPage(name: forgetPassword, page: () => ForgetPasswordPage()),

    GetPage(name: AppRoutes.verificationCode, page: () => VerificationPage()),
    GetPage(
      name: completeProfile,
      page: () => const CompleteProfileView(),
      binding: CompleteProfileBinding(),
    ),

    GetPage(
      name: AppRoutes.createNewPassword,
      page: () => CreatePasswordView(),
      binding: CreatePasswordBinding(),
    ),

    GetPage(
      name: AppRoutes.successPassword,
      page: () => const SuccessPasswordView(),
    ),

    GetPage(
      name: AppRoutes.register,
      page: () => const RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(name: AppRoutes.signUpChoice, page: () => RoleView()),

    //GetPage(name: AppRoutes.completeProfile, page: () => CompleteProfileView()),
    //GetPage(
    //  name: AppRoutes.professionalDetails,
    // page: () => ProfessionalDetailsView(),
    // binding: CompleteProfileBinding(),
    //  ),

    // GetPage(
    //  name: AppRoutes.loadingDashboard,
    //  page: () => const LoadingDashboardView(),
    //   ),
  ];
}
