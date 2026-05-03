import 'package:bohdan_bats_portfolio/imports.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class ExperienceCompanyInlineLink extends StatelessWidget {
  final String name;
  final String url;

  const ExperienceCompanyInlineLink({
    super.key,
    required this.name,
    required this.url,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final uri = Uri.parse(url);
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      },
      child: Row(
        children: [
          Flexible(
            child: Text(
              name,
              style: GoogleFonts.openSans(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: AppConstants.secondaryColor,
              ),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(width: 4),
          Icon(
            Icons.open_in_new_rounded,
            size: 16,
            color: AppConstants.linkColor,
          ),
        ],
      ),
    );
  }
}
