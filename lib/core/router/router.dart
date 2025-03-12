import 'package:auto_route/auto_route.dart';
import 'package:withu/core/core.dart';
import 'package:withu/core/router/router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => const RouteType.material();

  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: SplashRoute.page, path: '/', initial: true),
    AutoRoute(page: TempRoute.page, path: '/test'),
    AutoRoute(page: LoginRoute.page, path: '/login'),
    AutoRoute(page: TermRoute.page, path: '/term'),
    AutoRoute(page: ValidateBusinessRoute.page, path: '/validate-business'),
    AutoRoute(page: SignUpRoute.page, path: '/sign-up'),
    AutoRoute(page: EmailLoginRoute.page, path: '/email-login'),
    AutoRoute(page: FindAccountRoute.page, path: '/find/account'),
    AutoRoute(page: FindIdResultRoute.page, path: '/find/id/result'),
    AutoRoute(page: ChangePwRoute.page, path: '/change/pw'),
    AutoRoute(page: GuideRoute.page, path: '/guide'),
    AutoRoute(page: JobPostingsRoute.page, path: '/job-postings'),
    AutoRoute(page: JobPostingFormRoute.page, path: '/job-posting-form'),
    AutoRoute(page: JobPostingDetailRoute.page, path: '/job-posting-detail'),
    AutoRoute(page: JobPostingWorkersRoute.page, path: '/job-posting-workers'),

    AutoRoute(page: HomeRoute.page, path: '/home'),
  ];
}

extension AppRouterEx on AppRouter {
  static void moveHome() {
    getItAppRouter.replaceAll([HomeRoute()]);
  }
}
