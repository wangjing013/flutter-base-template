abstract class Routes {
  Routes._();
  static const guide = _Paths.guide;
  static const root = _Paths.root;
  static const home = _Paths.home;
  static const animate = _Paths.root + _Paths.animate;
}

abstract class _Paths {
  _Paths._();
  static const guide = '/guide';
  static const root = '/';
  static const home = '/home';
  static const animate = 'animate';
}
