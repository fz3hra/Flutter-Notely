import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:notely/utils/colors.dart';
import 'package:notely/utils/fonts.dart';
import 'package:notely/widgets/common/appbarsCommon.dart';
import 'package:notely/widgets/onboarding/onboardingButton.dart';

class NoContentHomePage extends StatelessWidget {
  const NoContentHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(64.0),
          child: AppBarCommon(
            // TODO change to drawer
            leadingIcon: IconButton(
              icon: Icon(
                Icons.menu,
                color: Colors.black,
              ),
              onPressed: () => Scaffold.of(context).openDrawer(),
            ),
            title: "All Notes",
            actionIcon: Icon(
              Icons.search,
              color: Colors.black,
            ),
          ),
        ),
        backgroundColor: ColorsConstant.backgroundColor,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 44.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Gap(100),
                Image.asset("assets/images/homepage/no-content-homepage.png"),
                Gap(40),
                Text(
                  "Create your first note",
                  style: Fonts.onboardingTitle.bodyLarge,
                ),
                Gap(12),
                Text(
                  "Add a note about anything (your thoughts on climate change, or your history essay) and share it witht the world.",
                  style: Fonts.onboardingTitle.bodyMedium,
                  textAlign: TextAlign.center,
                ),
                const Gap(78),
                OnboardingButton(
                  title: "Create a note",
                  moveTo: "/create-note",
                ),
                const Gap(20),
                GestureDetector(
                  onTap: () {},
                  child: Text(
                    "Import Notes",
                    style: Fonts.onboardingLinks.bodyMedium,
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
