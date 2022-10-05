class OnboardingModel {
  final String image, title, description;

  OnboardingModel({
    required this.image,
    required this.title,
    required this.description,
  });

  static List<OnboardingModel> onboardingLists = [
    OnboardingModel(
      image: "assets/images/onboarding/onboarding1.png",
      title: "World’s Safest And Largest Digital Notebook",
      description:
          "Notely is the world’s safest, largest and intelligent digital notebook. Join over 10M+ users already using Notely.",
    ),
    OnboardingModel(
      image: "assets/images/onboarding/onboarding1.png",
      title: "World’s Safest And Largest Digital Notebook",
      description:
          "Notely is the world’s safest, largest and intelligent digital notebook. Join over 10M+ users already using Notely.",
    ),
    OnboardingModel(
      image: "assets/images/onboarding/onboarding1.png",
      title: "World’s Safest And Largest Digital Notebook",
      description:
          "Notely is the world’s safest, largest and intelligent digital notebook. Join over 10M+ users already using Notely.",
    ),
  ];
}
