// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i18;
import 'package:flutter/cupertino.dart' as _i19;
import 'package:flutter/material.dart' as _i21;
import 'package:withu/feature/account/presentation/page/change_pw/change_pw_page.dart'
    as _i1;
import 'package:withu/feature/account/presentation/page/change_pw/change_pw_page_args.dart'
    as _i20;
import 'package:withu/feature/account/presentation/page/email_login/email_login_page.dart'
    as _i2;
import 'package:withu/feature/account/presentation/page/find_account/find_account_page.dart'
    as _i3;
import 'package:withu/feature/account/presentation/page/find_account/find_account_page_args.dart'
    as _i22;
import 'package:withu/feature/account/presentation/page/find_id_result/find_id_result_page.dart'
    as _i4;
import 'package:withu/feature/account/presentation/page/find_id_result/find_id_result_page_args.dart'
    as _i23;
import 'package:withu/feature/account/presentation/page/guide/guide_page.dart'
    as _i5;
import 'package:withu/feature/account/presentation/page/login/login_page.dart'
    as _i11;
import 'package:withu/feature/account/presentation/page/profile_registration/profile_registration_page.dart'
    as _i12;
import 'package:withu/feature/account/presentation/page/sign_up/sign_up_page.dart'
    as _i13;
import 'package:withu/feature/account/presentation/page/sign_up/sign_up_page_args.dart'
    as _i24;
import 'package:withu/feature/account/presentation/page/term/term_page.dart'
    as _i16;
import 'package:withu/feature/common/common.dart' as _i25;
import 'package:withu/feature/common/presentation/page/validate_business/validate_business_page.dart'
    as _i17;
import 'package:withu/feature/home/presentation/page/home/home_page.dart'
    as _i6;
import 'package:withu/feature/job_posting/presentation/pages/job_posting_detail_page.dart'
    as _i7;
import 'package:withu/feature/job_posting/presentation/pages/job_posting_form_page.dart'
    as _i8;
import 'package:withu/feature/job_posting/presentation/pages/job_posting_workers_page.dart'
    as _i9;
import 'package:withu/feature/job_posting/presentation/pages/job_postings_page.dart'
    as _i10;
import 'package:withu/feature/splash/presentation/pages/splash_page.dart'
    as _i14;
import 'package:withu/feature/test/presentatin/temp_page.dart' as _i15;

/// generated route for
/// [_i1.ChangePwPage]
class ChangePwRoute extends _i18.PageRouteInfo<ChangePwRouteArgs> {
  ChangePwRoute({
    _i19.Key? key,
    required _i20.ChangePwPageArgs args,
    List<_i18.PageRouteInfo>? children,
  }) : super(
          ChangePwRoute.name,
          args: ChangePwRouteArgs(
            key: key,
            args: args,
          ),
          initialChildren: children,
        );

  static const String name = 'ChangePwRoute';

  static _i18.PageInfo page = _i18.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ChangePwRouteArgs>();
      return _i1.ChangePwPage(
        key: args.key,
        args: args.args,
      );
    },
  );
}

class ChangePwRouteArgs {
  const ChangePwRouteArgs({
    this.key,
    required this.args,
  });

  final _i19.Key? key;

  final _i20.ChangePwPageArgs args;

  @override
  String toString() {
    return 'ChangePwRouteArgs{key: $key, args: $args}';
  }
}

/// generated route for
/// [_i2.EmailLoginPage]
class EmailLoginRoute extends _i18.PageRouteInfo<void> {
  const EmailLoginRoute({List<_i18.PageRouteInfo>? children})
      : super(
          EmailLoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'EmailLoginRoute';

  static _i18.PageInfo page = _i18.PageInfo(
    name,
    builder: (data) {
      return const _i2.EmailLoginPage();
    },
  );
}

/// generated route for
/// [_i3.FindAccountPage]
class FindAccountRoute extends _i18.PageRouteInfo<FindAccountRouteArgs> {
  FindAccountRoute({
    _i21.Key? key,
    required _i22.FindAccountPageArgs args,
    List<_i18.PageRouteInfo>? children,
  }) : super(
          FindAccountRoute.name,
          args: FindAccountRouteArgs(
            key: key,
            args: args,
          ),
          initialChildren: children,
        );

  static const String name = 'FindAccountRoute';

  static _i18.PageInfo page = _i18.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<FindAccountRouteArgs>();
      return _i3.FindAccountPage(
        key: args.key,
        args: args.args,
      );
    },
  );
}

class FindAccountRouteArgs {
  const FindAccountRouteArgs({
    this.key,
    required this.args,
  });

  final _i21.Key? key;

  final _i22.FindAccountPageArgs args;

  @override
  String toString() {
    return 'FindAccountRouteArgs{key: $key, args: $args}';
  }
}

/// generated route for
/// [_i4.FindIdResultPage]
class FindIdResultRoute extends _i18.PageRouteInfo<FindIdResultRouteArgs> {
  FindIdResultRoute({
    _i21.Key? key,
    required _i23.FindIdResultPageArgs args,
    List<_i18.PageRouteInfo>? children,
  }) : super(
          FindIdResultRoute.name,
          args: FindIdResultRouteArgs(
            key: key,
            args: args,
          ),
          initialChildren: children,
        );

  static const String name = 'FindIdResultRoute';

  static _i18.PageInfo page = _i18.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<FindIdResultRouteArgs>();
      return _i4.FindIdResultPage(
        key: args.key,
        args: args.args,
      );
    },
  );
}

class FindIdResultRouteArgs {
  const FindIdResultRouteArgs({
    this.key,
    required this.args,
  });

  final _i21.Key? key;

  final _i23.FindIdResultPageArgs args;

  @override
  String toString() {
    return 'FindIdResultRouteArgs{key: $key, args: $args}';
  }
}

/// generated route for
/// [_i5.GuidePage]
class GuideRoute extends _i18.PageRouteInfo<void> {
  const GuideRoute({List<_i18.PageRouteInfo>? children})
      : super(
          GuideRoute.name,
          initialChildren: children,
        );

  static const String name = 'GuideRoute';

  static _i18.PageInfo page = _i18.PageInfo(
    name,
    builder: (data) {
      return const _i5.GuidePage();
    },
  );
}

/// generated route for
/// [_i6.HomePage]
class HomeRoute extends _i18.PageRouteInfo<void> {
  const HomeRoute({List<_i18.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static _i18.PageInfo page = _i18.PageInfo(
    name,
    builder: (data) {
      return const _i6.HomePage();
    },
  );
}

/// generated route for
/// [_i7.JobPostingDetailPage]
class JobPostingDetailRoute
    extends _i18.PageRouteInfo<JobPostingDetailRouteArgs> {
  JobPostingDetailRoute({
    _i21.Key? key,
    required String jobPostingId,
    List<_i18.PageRouteInfo>? children,
  }) : super(
          JobPostingDetailRoute.name,
          args: JobPostingDetailRouteArgs(
            key: key,
            jobPostingId: jobPostingId,
          ),
          initialChildren: children,
        );

  static const String name = 'JobPostingDetailRoute';

  static _i18.PageInfo page = _i18.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<JobPostingDetailRouteArgs>();
      return _i7.JobPostingDetailPage(
        key: args.key,
        jobPostingId: args.jobPostingId,
      );
    },
  );
}

class JobPostingDetailRouteArgs {
  const JobPostingDetailRouteArgs({
    this.key,
    required this.jobPostingId,
  });

  final _i21.Key? key;

  final String jobPostingId;

  @override
  String toString() {
    return 'JobPostingDetailRouteArgs{key: $key, jobPostingId: $jobPostingId}';
  }
}

/// generated route for
/// [_i8.JobPostingFormPage]
class JobPostingFormRoute extends _i18.PageRouteInfo<JobPostingFormRouteArgs> {
  JobPostingFormRoute({
    _i21.Key? key,
    String? jobPostingId,
    List<_i18.PageRouteInfo>? children,
  }) : super(
          JobPostingFormRoute.name,
          args: JobPostingFormRouteArgs(
            key: key,
            jobPostingId: jobPostingId,
          ),
          initialChildren: children,
        );

  static const String name = 'JobPostingFormRoute';

  static _i18.PageInfo page = _i18.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<JobPostingFormRouteArgs>(
          orElse: () => const JobPostingFormRouteArgs());
      return _i8.JobPostingFormPage(
        key: args.key,
        jobPostingId: args.jobPostingId,
      );
    },
  );
}

class JobPostingFormRouteArgs {
  const JobPostingFormRouteArgs({
    this.key,
    this.jobPostingId,
  });

  final _i21.Key? key;

  final String? jobPostingId;

  @override
  String toString() {
    return 'JobPostingFormRouteArgs{key: $key, jobPostingId: $jobPostingId}';
  }
}

/// generated route for
/// [_i9.JobPostingWorkersPage]
class JobPostingWorkersRoute
    extends _i18.PageRouteInfo<JobPostingWorkersRouteArgs> {
  JobPostingWorkersRoute({
    _i21.Key? key,
    required String jobPostingId,
    List<_i18.PageRouteInfo>? children,
  }) : super(
          JobPostingWorkersRoute.name,
          args: JobPostingWorkersRouteArgs(
            key: key,
            jobPostingId: jobPostingId,
          ),
          initialChildren: children,
        );

  static const String name = 'JobPostingWorkersRoute';

  static _i18.PageInfo page = _i18.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<JobPostingWorkersRouteArgs>();
      return _i9.JobPostingWorkersPage(
        key: args.key,
        jobPostingId: args.jobPostingId,
      );
    },
  );
}

class JobPostingWorkersRouteArgs {
  const JobPostingWorkersRouteArgs({
    this.key,
    required this.jobPostingId,
  });

  final _i21.Key? key;

  final String jobPostingId;

  @override
  String toString() {
    return 'JobPostingWorkersRouteArgs{key: $key, jobPostingId: $jobPostingId}';
  }
}

/// generated route for
/// [_i10.JobPostingsPage]
class JobPostingsRoute extends _i18.PageRouteInfo<void> {
  const JobPostingsRoute({List<_i18.PageRouteInfo>? children})
      : super(
          JobPostingsRoute.name,
          initialChildren: children,
        );

  static const String name = 'JobPostingsRoute';

  static _i18.PageInfo page = _i18.PageInfo(
    name,
    builder: (data) {
      return const _i10.JobPostingsPage();
    },
  );
}

/// generated route for
/// [_i11.LoginPage]
class LoginRoute extends _i18.PageRouteInfo<void> {
  const LoginRoute({List<_i18.PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static _i18.PageInfo page = _i18.PageInfo(
    name,
    builder: (data) {
      return const _i11.LoginPage();
    },
  );
}

/// generated route for
/// [_i12.ProfileRegistrationPage]
class ProfileRegistrationRoute extends _i18.PageRouteInfo<void> {
  const ProfileRegistrationRoute({List<_i18.PageRouteInfo>? children})
      : super(
          ProfileRegistrationRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileRegistrationRoute';

  static _i18.PageInfo page = _i18.PageInfo(
    name,
    builder: (data) {
      return const _i12.ProfileRegistrationPage();
    },
  );
}

/// generated route for
/// [_i13.SignUpPage]
class SignUpRoute extends _i18.PageRouteInfo<SignUpRouteArgs> {
  SignUpRoute({
    _i21.Key? key,
    required _i24.SignUpPageArgs args,
    List<_i18.PageRouteInfo>? children,
  }) : super(
          SignUpRoute.name,
          args: SignUpRouteArgs(
            key: key,
            args: args,
          ),
          initialChildren: children,
        );

  static const String name = 'SignUpRoute';

  static _i18.PageInfo page = _i18.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<SignUpRouteArgs>();
      return _i13.SignUpPage(
        key: args.key,
        args: args.args,
      );
    },
  );
}

class SignUpRouteArgs {
  const SignUpRouteArgs({
    this.key,
    required this.args,
  });

  final _i21.Key? key;

  final _i24.SignUpPageArgs args;

  @override
  String toString() {
    return 'SignUpRouteArgs{key: $key, args: $args}';
  }
}

/// generated route for
/// [_i14.SplashPage]
class SplashRoute extends _i18.PageRouteInfo<void> {
  const SplashRoute({List<_i18.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static _i18.PageInfo page = _i18.PageInfo(
    name,
    builder: (data) {
      return const _i14.SplashPage();
    },
  );
}

/// generated route for
/// [_i15.TempPage]
class TempRoute extends _i18.PageRouteInfo<void> {
  const TempRoute({List<_i18.PageRouteInfo>? children})
      : super(
          TempRoute.name,
          initialChildren: children,
        );

  static const String name = 'TempRoute';

  static _i18.PageInfo page = _i18.PageInfo(
    name,
    builder: (data) {
      return const _i15.TempPage();
    },
  );
}

/// generated route for
/// [_i16.TermPage]
class TermRoute extends _i18.PageRouteInfo<void> {
  const TermRoute({List<_i18.PageRouteInfo>? children})
      : super(
          TermRoute.name,
          initialChildren: children,
        );

  static const String name = 'TermRoute';

  static _i18.PageInfo page = _i18.PageInfo(
    name,
    builder: (data) {
      return const _i16.TermPage();
    },
  );
}

/// generated route for
/// [_i17.ValidateBusinessPage]
class ValidateBusinessRoute
    extends _i18.PageRouteInfo<ValidateBusinessRouteArgs> {
  ValidateBusinessRoute({
    _i21.Key? key,
    required _i25.ValidateBusinessPageArgs args,
    List<_i18.PageRouteInfo>? children,
  }) : super(
          ValidateBusinessRoute.name,
          args: ValidateBusinessRouteArgs(
            key: key,
            args: args,
          ),
          initialChildren: children,
        );

  static const String name = 'ValidateBusinessRoute';

  static _i18.PageInfo page = _i18.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ValidateBusinessRouteArgs>();
      return _i17.ValidateBusinessPage(
        key: args.key,
        args: args.args,
      );
    },
  );
}

class ValidateBusinessRouteArgs {
  const ValidateBusinessRouteArgs({
    this.key,
    required this.args,
  });

  final _i21.Key? key;

  final _i25.ValidateBusinessPageArgs args;

  @override
  String toString() {
    return 'ValidateBusinessRouteArgs{key: $key, args: $args}';
  }
}
