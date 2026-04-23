import 'package:bohdan_bats_portfolio/app_constants.dart';
import 'package:bohdan_bats_portfolio/components/abel_custom.dart';
import 'package:bohdan_bats_portfolio/desktop/blog_post_desktop.dart';
import 'package:bohdan_bats_portfolio/mobile/blog_post_mobile.dart';
import 'package:bohdan_bats_portfolio/desktop/drawer_desktop.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class BlogDesktop extends StatefulWidget {
  const BlogDesktop({super.key});

  @override
  State<BlogDesktop> createState() => _BlogDesktopState();
}

class _BlogDesktopState extends State<BlogDesktop> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.white,
        drawer: DrawerDesktop(),
        body: NestedScrollView(
          headerSliverBuilder: (context, builder) {
            return <Widget>[
              SliverAppBar(
                backgroundColor: AppConstants.surfaceColor,
                iconTheme: IconThemeData(
                  size: 35,
                  color: AppConstants.secondaryColor,
                ),
                flexibleSpace: FlexibleSpaceBar(
                  title: Container(
                    decoration: BoxDecoration(
                      color: AppConstants.secondaryColor,
                      borderRadius: BorderRadius.circular(3),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 7),
                    child: AbelCustom(
                      text: "Welcome to my blog",
                      size: 30,
                      color: AppConstants.surfaceColor,
                      fontWeight: .bold,
                    ),
                  ),
                  background: Image.asset(
                    "assets/blog.jpg",
                    filterQuality: .high,
                    fit: .cover,
                  ),
                ),
                expandedHeight: 500,
              ),
            ];
          },
          body: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection("articles")
                .snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    DocumentSnapshot doc = snapshot.data!.docs[index];
                    return BlogPostMobile(
                      title: doc["title"],
                      body: doc["body"],
                    );
                  },
                );
              }
              return Center(child: CircularProgressIndicator());
            },
          ),
        ),
      ),
    );
  }
}
