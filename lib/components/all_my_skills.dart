import 'package:bohdan_bats_portfolio/components/my_skill.dart';
import 'package:flutter/material.dart';

class AllMySkills extends StatelessWidget {
  const AllMySkills({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 7,
      runSpacing: 7,
      children: [
        MySkill(skill: "Flutter"),
        MySkill(skill: "Firebase"),
        MySkill(skill: ".NET MAUI"),
        MySkill(skill: ".NET"),
        MySkill(skill: "Clean Architecture"),
        MySkill(skill: "UI/UX"),
        MySkill(skill: "Databases"),
        MySkill(skill: "TestFlight"),
        MySkill(skill: "Testing"),
        MySkill(skill: "REST API"),
        MySkill(skill: "Backend"),
        MySkill(skill: "AI Tools"),
        MySkill(skill: "Security"),
      ],
    );
  }
}
