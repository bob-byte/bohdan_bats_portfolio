import 'package:flutter/foundation.dart';

/// Which experience card is expanded on mobile (single selection).
class ExperienceExpansionViewModel extends ChangeNotifier {
  int? _expandedIndex;

  int? get expandedIndex => _expandedIndex;

  void toggle(int index) {
    _expandedIndex = _expandedIndex == index ? null : index;
    notifyListeners();
  }
}
