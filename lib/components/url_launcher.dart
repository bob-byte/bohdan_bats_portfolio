import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

class UrlLauncher extends StatelessWidget {
  final String _imgPath;
  final String _urlPath;

  const UrlLauncher({
    super.key,
    required String imgPath,
    required String urlPath,
  }) : _urlPath = urlPath,
       _imgPath = imgPath;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () async {
          final Uri uri = Uri.parse(_urlPath);
          await launchUrl(uri);
        },
        child: SvgPicture.asset(_imgPath, width: 45),
      ),
    );
  }
}
