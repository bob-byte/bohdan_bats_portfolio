import 'package:bohdan_bats_portfolio/app_constants.dart';
import 'package:bohdan_bats_portfolio/components/abel_custom.dart';
import 'package:bohdan_bats_portfolio/view_models/expandable_view_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class BlogPostDesktop extends StatelessWidget {
  final String title;
  final String body;
  const BlogPostDesktop({super.key, required this.title, required this.body});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ExpandableViewModel(),
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 70, top: 40),
        child: Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: AppConstants.surfaceColor,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: AppConstants.secondaryColor,
              style: .solid,
              width: 1,
            ),
          ),
          child: Column(
            crossAxisAlignment: .start,
            children: [
              Row(
                mainAxisAlignment: .spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    decoration: BoxDecoration(
                      color: AppConstants.secondaryColor,
                      borderRadius: BorderRadius.circular(3),
                    ),
                    child: AbelCustom(
                      text: title,
                      size: 25,
                      color: AppConstants.surfaceColor,
                    ),
                  ),
                  Consumer<ExpandableViewModel>(
                    builder: (context, expandable, _) {
                      return IconButton(
                        onPressed: expandable.toggle,
                        icon: Icon(Icons.arrow_drop_down_circle_outlined),
                        color: AppConstants.secondaryColor,
                      );
                    },
                  ),
                ],
              ),
              SizedBox(height: 7),
              Consumer<ExpandableViewModel>(
                builder: (context, expandable, _) {
                  final expand = expandable.expanded;
                  return Text(
                    body,
                    style: GoogleFonts.openSans(fontSize: 15),
                    maxLines: expand ? null : 3,
                    overflow:
                        expand ? TextOverflow.visible : TextOverflow.ellipsis,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
