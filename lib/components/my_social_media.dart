import 'package:bohdan_bats_portfolio/components/url_launcher.dart';
import 'package:flutter/material.dart';

class MySocialMedia extends StatelessWidget {
  const MySocialMedia({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: .center,
      children: [
        UrlLauncher(
          imgPath: "assets/instagram_3.svg",
          urlPath: "https://www.instagram.com/bohdanbats/",
        ),
        SizedBox(width: 15),
        UrlLauncher(
          imgPath: "assets/github.svg",
          urlPath: "https://github.com/bob-byte/",
        ),
        SizedBox(width: 15),
        UrlLauncher(
          imgPath: "assets/telegram_second.svg",
          urlPath: "https://t.me/bats_bohdan/",
        ),
      ],
    );
  }
}
