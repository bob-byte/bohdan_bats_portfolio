import 'package:bohdan_bats_portfolio/app_constants.dart';
import 'package:bohdan_bats_portfolio/components/abel_custom.dart';
import 'package:bohdan_bats_portfolio/data/article.dart';
import 'package:bohdan_bats_portfolio/mobile/blog_post_mobile.dart';
import 'package:bohdan_bats_portfolio/mobile/drawer_mobile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class BlogMobile extends StatefulWidget {
  const BlogMobile({super.key});

  @override
  State<BlogMobile> createState() => _BlogMobileState();
}

class _BlogMobileState extends State<BlogMobile> {
  List<Article> articles = [];

  void streamArticle() async {
    await for (var snapshot
        in FirebaseFirestore.instance.collection("articles").snapshots()) {
      articles.clear();
      for (QueryDocumentSnapshot<Map<String, dynamic>> doc in snapshot.docs) {
        final String title = doc.data()["title"];
        final String body = doc.data()["body"];

        final article = Article(title: title, body: body);
        articles.add(article);
      }
      setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();
    streamArticle();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: AppConstants.surfaceColor,
        endDrawer: DrawerMobile(),
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
                  centerTitle: true,
                  title: Container(
                    decoration: BoxDecoration(
                      color: AppConstants.secondaryColor,
                      borderRadius: BorderRadius.circular(3),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 4),
                    child: AbelCustom(
                      text: "Welcome to my blog",
                      size: 24,
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
                expandedHeight: 400,
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
                    var logger = Logger();
                    logger.d(doc["title"]);
                    logger.d(doc["body"]);
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
