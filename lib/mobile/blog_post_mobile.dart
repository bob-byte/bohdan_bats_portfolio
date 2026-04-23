import 'package:bohdan_bats_portfolio/app_constants.dart';
import 'package:bohdan_bats_portfolio/components/abel_custom.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BlogPostMobile extends StatefulWidget {
  final String title;
  final String body;

  const BlogPostMobile({super.key, required this.title, required this.body});

  @override
  State<BlogPostMobile> createState() => _BlogPostMobileState();
}

class _BlogPostMobileState extends State<BlogPostMobile> {
  bool expand = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
      child: Container(
        padding: EdgeInsets.all(10),
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
                    text: widget.title,
                    size: 25,
                    color: AppConstants.surfaceColor,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      expand = !expand;
                    });
                  },
                  icon: Icon(Icons.arrow_drop_down_circle_outlined),
                  color: AppConstants.secondaryColor,
                ),
              ],
            ),
            SizedBox(height: 7),
            Text(
              widget.body,
              style: GoogleFonts.openSans(fontSize: 15),
              maxLines: expand ? null : 3,
              overflow: expand ? TextOverflow.visible : TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
