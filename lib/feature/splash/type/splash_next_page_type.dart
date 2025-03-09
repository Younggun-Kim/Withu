import 'package:auto_route/auto_route.dart';
import 'package:withu/core/router/router.gr.dart';

enum SplashNextPageType {
  none(SplashRoute()),
  login(LoginRoute2()),
  jobPostings(JobPostingsRoute()),
  test(GuideRoute());

  final PageRouteInfo route;

  const SplashNextPageType(this.route);

  PageRouteInfo get getRoute => route;

  bool get isNone => this == none;
}

extension SplashNextPageTypeExt on SplashNextPageType {
  static SplashNextPageType getNextPage(bool isLoggedIn) {
    return isLoggedIn
        ? SplashNextPageType.jobPostings
        : SplashNextPageType.test;
  }
}
