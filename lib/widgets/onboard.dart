import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:notely/models/onboardingModels/onboardingModel.dart';
import 'package:notely/utils/colors.dart';
import 'package:notely/utils/fonts.dart';
import 'package:notely/widgets/onboarding/onboardingButton.dart';

class OnBoard extends StatefulWidget {
  const OnBoard({Key? key}) : super(key: key);

  @override
  State<OnBoard> createState() => _OnBoardState();
}

class _OnBoardState extends State<OnBoard> {
  int currentIndex = 0;
  final controller = PageController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorsConstant.backgroundColor,
        body: PageView.builder(
          onPageChanged: (int index) {
            setState(() {
              currentIndex = index;
            });
          },
          controller: controller,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Gap(40),
                  Text(
                    "Notely",
                    style: Fonts.onboardingTitle.headlineLarge,
                  ),
                  const Gap(120),
                  Image.asset(
                    "assets/images/onboarding/onboarding1.png",
                    height: 197,
                  ),
                  const Gap(20),
                  Text(
                    "World’s Safest And Largest Digital Notebook",
                    style: Fonts.onboardingTitle.bodyLarge,
                    textAlign: TextAlign.center,
                  ),
                  const Gap(12),
                  Text(
                    "Notely is the world’s safest, largest and intelligent digital notebook. Join over 10M+ users already using Notely.",
                    style: Fonts.onboardingTitle.bodyMedium,
                    textAlign: TextAlign.center,
                  ),
                  const Gap(24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      OnboardingModel.onboardingLists.length,
                      (index) => dotContainer(index, context),
                    ),
                  ),
                  const Gap(56),
                  OnboardingButton(
                      title: "GET STARTED",
                      // moveTo: "/registration",
                      onPressed: () {
                        Navigator.pushNamed(context, '/registration');
                      }),
                  const Gap(20),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/login');
                    },
                    child: Text(
                      "Already have an account?",
                      style: Fonts.onboardingLinks.bodyMedium,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget dotContainer(int index, BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        right: 5,
      ),
      height: 10,
      width: 10,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(2.0),
        color: currentIndex == index
            ? ColorsConstant.secondaryColor
            : Colors.white,
      ),
    );
  }
}
