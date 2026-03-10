import 'package:get/get.dart';
import 'package:splash_0nboard/modules/auth/pages/login_page.dart';
import '../../modules/auth/pages/VerificationPage.dart';
import '../../modules/auth/pages/forget_password_page.dart';
import '../../modules/create_new_password/controllar/CreatePasswordBinding.dart';
import '../../modules/create_new_password/view/CreatePasswordView.dart';
import '../../modules/create_new_password/view/SuccessPasswordView.dart';
import '../../modules/register/controllar/RegisterBinding.dart';
import '../../modules/register/controllar/complete_profile_binding.dart';
import '../../modules/register/view/CompleteProfileView.dart';
import '../../modules/register/view/LoadingDashboardView.dart';
import '../../modules/register/view/ProfessionalDetailsView.dart';
import '../../modules/register/view/register_view.dart';
import '../../modules/splash/pages/splash_screen.dart';
import '../../modules/onboarding/pages/onboarding_screen.dart';
import '../../modules/auth/pages/roleselectionscreen.dart';

class AppRoutes {
  static const splash = "/splash";
  static const onboarding = "/onboarding";
  static const roleSelection = "/roleSelection";
  static const login = "/login";
  static const forgetPassword = "/forgetPassword";
  static const verificationCode = "/verificationCode";
  static const createNewPassword = "/createNewPassword";
  static const successPassword = "/successPassword";
  static const register = "/register";
  static const completeProfile = "/completeProfile";
  static const professionalDetails = "/professionalDetails";
  static const loadingDashboard = "/loadingDashboard";









  static final routes = [
    GetPage(name: splash, page: () => const SplashScreen()),

    GetPage(name: onboarding, page: () => OnboardingScreen()),

    GetPage(name: roleSelection, page: () => const RoleSelectionScreen()),

    GetPage(name: login, page: () => LoginPage()),

    GetPage(name: forgetPassword, page: () => ForgetPasswordPage()),

    GetPage(name: AppRoutes.verificationCode, page: () => VerificationPage()),

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

    GetPage(
      name: AppRoutes.completeProfile,
      page: () =>  CompleteProfileView(),
    ),


      GetPage(
        name: AppRoutes.professionalDetails,
        page: () =>  ProfessionalDetailsView(),
      // binding: CompleteProfileBinding(),
      ),

    GetPage(
      name: AppRoutes.loadingDashboard,
      page: () =>  const LoadingDashboardView(),
    ),


  ];
}
