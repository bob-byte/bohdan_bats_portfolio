import 'package:bohdan_bats_portfolio/app_constants.dart';
import 'package:bohdan_bats_portfolio/components/abel_custom.dart';
import 'package:bohdan_bats_portfolio/views/desktop/all_desktop_tabs.dart';
import 'package:bohdan_bats_portfolio/views/desktop/drawer_desktop.dart';
import 'package:bohdan_bats_portfolio/views/mobile/blog_post_mobile.dart';
import 'package:bohdan_bats_portfolio/view_models/blog_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BlogDesktop extends StatelessWidget {
  const BlogDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => BlogViewModel(),
      child: Scaffold(
        drawer: DrawerDesktop(),
        appBar: AppBar(
          backgroundColor: AppConstants.surfaceColor,
          elevation: 0.0,
          iconTheme: IconThemeData(
            size: 25.0,
            color: AppConstants.secondaryColor,
          ),
          title: AllDesktopTabs(),
        ),
        extendBodyBehindAppBar: true,
        backgroundColor: AppConstants.surfaceColor,
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
          body: Consumer<BlogViewModel>(
            builder: (context, vm, _) {
              if (vm.status == BlogStatus.failure) {
                return Center(
                  child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: Text(
                      vm.errorMessage ?? 'Something went wrong',
                      textAlign: TextAlign.center,
                    ),
                  ),
                );
              }
              if (vm.status == BlogStatus.loading) {
                return const Center(child: CircularProgressIndicator());
              }
              return ListView.builder(
                itemCount: vm.articles.length,
                itemBuilder: (context, index) {
                  final article = vm.articles[index];
                  return BlogPostMobile(
                    title: article.title,
                    body: article.body,
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
