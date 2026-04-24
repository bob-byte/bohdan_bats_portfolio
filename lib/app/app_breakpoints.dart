/// Layout breakpoints shared by [ResponsiveLayout] and route builders.
abstract final class AppBreakpoints {
  AppBreakpoints._();

  /// Viewports wider than this use desktop layouts (see [routes.dart]).
  static const double desktopLayoutMinWidth = 800;
}
