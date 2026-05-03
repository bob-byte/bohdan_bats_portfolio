import 'package:bohdan_bats_portfolio/data/article.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

/// Reads blog articles from Firestore (model / data layer).
class ArticleRepository {
  ArticleRepository({FirebaseFirestore? firestore})
      : _firestore = firestore ?? FirebaseFirestore.instance;

  final FirebaseFirestore _firestore;

  Stream<List<Article>> watchArticles() {
    return _firestore.collection('articles').snapshots().map((snapshot) {
      return snapshot.docs
          .map(
            (doc) => Article(
              title: doc.data()['title'] as String? ?? '',
              body: doc.data()['body'] as String? ?? '',
            ),
          )
          .toList();
    });
  }
}
