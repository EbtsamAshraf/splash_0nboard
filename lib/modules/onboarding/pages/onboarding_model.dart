class OnboardingModel {
  final String title;
  final String body;
  final String image;

  const OnboardingModel({
    required this.title,
    required this.body,
    required this.image,
  });

  static const List<OnboardingModel> pages = [
    OnboardingModel(
      title: "Welcome To StepAgain",
      body: "Helping You Get The Perfect Prosthetic Experience",
      image: "assets/image/onboarding1.png",
    ),
    OnboardingModel(
      title: "Smart Medical Matching",
      body: "Your Doctors Select The Best Prosthetic Design For You",
      image: "assets/image/onboarding2.png",
    ),
    OnboardingModel(
      title: "From Factory To Your Home",
      body: "A Technician Will Visit You For Fitting And Follow-Up",
      image: "assets/image/onboarding3.png",
    ),
  ];
}