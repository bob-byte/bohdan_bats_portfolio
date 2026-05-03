import 'package:flutter/foundation.dart';

/// Expand/collapse body text (e.g. blog post snippet).
class ExpandableViewModel extends ChangeNotifier {
  bool _expanded = false;

  bool get expanded => _expanded;

  void toggle() {
    _expanded = !_expanded;
    notifyListeners();
  }
}
