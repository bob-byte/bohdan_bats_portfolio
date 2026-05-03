import 'dart:async';

import 'package:bohdan_bats_portfolio/data/article.dart';
import 'package:bohdan_bats_portfolio/data/repositories/article_repository.dart';
import 'package:flutter/foundation.dart';

enum BlogStatus { loading, loaded, failure }

/// Presentation logic for the blog article list (MVVM ViewModel).
class BlogViewModel extends ChangeNotifier {
  BlogViewModel({ArticleRepository? repository})
      : _repository = repository ?? ArticleRepository() {
    _subscription = _repository.watchArticles().listen(
          _onArticles,
          onError: (Object error, StackTrace stackTrace) {
            _status = BlogStatus.failure;
            _errorMessage = error.toString();
            notifyListeners();
          },
        );
  }

  final ArticleRepository _repository;
  StreamSubscription<List<Article>>? _subscription;

  BlogStatus _status = BlogStatus.loading;
  List<Article> _articles = [];
  String? _errorMessage;

  BlogStatus get status => _status;
  List<Article> get articles => List.unmodifiable(_articles);
  String? get errorMessage => _errorMessage;

  void _onArticles(List<Article> articles) {
    _articles = articles;
    _status = BlogStatus.loaded;
    _errorMessage = null;
    notifyListeners();
  }

  @override
  void dispose() {
    unawaited(_subscription?.cancel());
    super.dispose();
  }
}
