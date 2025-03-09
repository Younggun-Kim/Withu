// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i13;
import 'package:flutter/material.dart' as _i14;
import 'package:withu/feature/account/presentation/page/guide/guide_page.dart'
    as _i1;
import 'package:withu/feature/account/presentation/page/login/login_page.dart'
    as _i6;
import 'package:withu/feature/account/presentation/page/login/login_page2.dart'
    as _i7;
import 'package:withu/feature/account/presentation/page/sign_up/sign_up_page.dart'
    as _i8;
import 'package:withu/feature/account/presentation/page/sign_up/sign_up_page_args.dart'
    as _i15;
import 'package:withu/feature/account/presentation/page/term/term_page.dart'
    as _i11;
import 'package:withu/feature/common/common.dart' as _i16;
import 'package:withu/feature/common/presentation/page/validate_business/validate_business_page.dart'
    as _i12;
import 'package:withu/feature/job_posting/presentation/pages/job_posting_detail_page.dart'
    as _i2;
import 'package:withu/feature/job_posting/presentation/pages/job_posting_form_page.dart'
    as _i3;
import 'package:withu/feature/job_posting/presentation/pages/job_posting_workers_page.dart'
    as _i4;
import 'package:withu/feature/job_posting/presentation/pages/job_postings_page.dart'
    as _i5;
import 'package:withu/feature/splash/presentation/pages/splash_page.dart'
    as _i9;
import 'package:withu/feature/test/presentatin/temp_page.dart' as _i10;

/// generated route for
/// [_i1.GuidePage]
class GuideRoute extends _i13.PageRouteInfo<void> {
  const GuideRoute({List<_i13.PageRouteInfo>? children})
      : super(
          GuideRoute.name,
          initialChildren: children,
        );

  static const String name = 'GuideRoute';

  static _i13.PageInfo page = _i13.PageInfo(
    name,
    builder: (data) {
      return const _i1.GuidePage();
    },
  );
}

/// generated route for
/// [_i2.JobPostingDetailPage]
class JobPostingDetailRoute
    extends _i13.PageRouteInfo<JobPostingDetailRouteArgs> {
  JobPostingDetailRoute({
    _i14.Key? key,
    required String jobPostingId,
    List<_i13.PageRouteInfo>? children,
  }) : super(
          JobPostingDetailRoute.name,
          args: JobPostingDetailRouteArgs(
            key: key,
            jobPostingId: jobPostingId,
          ),
          initialChildren: children,
        );

  static const String name = 'JobPostingDetailRoute';

  static _i13.PageInfo page = _i13.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<JobPostingDetailRouteArgs>();
      return _i2.JobPostingDetailPage(
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

  final _i14.Key? key;

  final String jobPostingId;

  @override
  String toString() {
    return 'JobPostingDetailRouteArgs{key: $key, jobPostingId: $jobPostingId}';
  }
}

/// generated route for
/// [_i3.JobPostingFormPage]
class JobPostingFormRoute extends _i13.PageRouteInfo<JobPostingFormRouteArgs> {
  JobPostingFormRoute({
    _i14.Key? key,
    String? jobPostingId,
    List<_i13.PageRouteInfo>? children,
  }) : super(
          JobPostingFormRoute.name,
          args: JobPostingFormRouteArgs(
            key: key,
            jobPostingId: jobPostingId,
          ),
          initialChildren: children,
        );

  static const String name = 'JobPostingFormRoute';

  static _i13.PageInfo page = _i13.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<JobPostingFormRouteArgs>(
          orElse: () => const JobPostingFormRouteArgs());
      return _i3.JobPostingFormPage(
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

  final _i14.Key? key;

  final String? jobPostingId;

  @override
  String toString() {
    return 'JobPostingFormRouteArgs{key: $key, jobPostingId: $jobPostingId}';
  }
}

/// generated route for
/// [_i4.JobPostingWorkersPage]
class JobPostingWorkersRoute
    extends _i13.PageRouteInfo<JobPostingWorkersRouteArgs> {
  JobPostingWorkersRoute({
    _i14.Key? key,
    required String jobPostingId,
    List<_i13.PageRouteInfo>? children,
  }) : super(
          JobPostingWorkersRoute.name,
          args: JobPostingWorkersRouteArgs(
            key: key,
            jobPostingId: jobPostingId,
          ),
          initialChildren: children,
        );

  static const String name = 'JobPostingWorkersRoute';

  static _i13.PageInfo page = _i13.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<JobPostingWorkersRouteArgs>();
      return _i4.JobPostingWorkersPage(
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

  final _i14.Key? key;

  final String jobPostingId;

  @override
  String toString() {
    return 'JobPostingWorkersRouteArgs{key: $key, jobPostingId: $jobPostingId}';
  }
}

/// generated route for
/// [_i5.JobPostingsPage]
class JobPostingsRoute extends _i13.PageRouteInfo<void> {
  const JobPostingsRoute({List<_i13.PageRouteInfo>? children})
      : super(
          JobPostingsRoute.name,
          initialChildren: children,
        );

  static const String name = 'JobPostingsRoute';

  static _i13.PageInfo page = _i13.PageInfo(
    name,
    builder: (data) {
      return const _i5.JobPostingsPage();
    },
  );
}

/// generated route for
/// [_i6.LoginPage]
class LoginRoute extends _i13.PageRouteInfo<void> {
  const LoginRoute({List<_i13.PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static _i13.PageInfo page = _i13.PageInfo(
    name,
    builder: (data) {
      return const _i6.LoginPage();
    },
  );
}

/// generated route for
/// [_i7.LoginPage2]
class LoginRoute2 extends _i13.PageRouteInfo<void> {
  const LoginRoute2({List<_i13.PageRouteInfo>? children})
      : super(
          LoginRoute2.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute2';

  static _i13.PageInfo page = _i13.PageInfo(
    name,
    builder: (data) {
      return const _i7.LoginPage2();
    },
  );
}

/// generated route for
/// [_i8.SignUpPage]
class SignUpRoute extends _i13.PageRouteInfo<SignUpRouteArgs> {
  SignUpRoute({
    _i14.Key? key,
    required _i15.SignUpPageArgs args,
    List<_i13.PageRouteInfo>? children,
  }) : super(
          SignUpRoute.name,
          args: SignUpRouteArgs(
            key: key,
            args: args,
          ),
          initialChildren: children,
        );

  static const String name = 'SignUpRoute';

  static _i13.PageInfo page = _i13.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<SignUpRouteArgs>();
      return _i8.SignUpPage(
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

  final _i14.Key? key;

  final _i15.SignUpPageArgs args;

  @override
  String toString() {
    return 'SignUpRouteArgs{key: $key, args: $args}';
  }
}

/// generated route for
/// [_i9.SplashPage]
class SplashRoute extends _i13.PageRouteInfo<void> {
  const SplashRoute({List<_i13.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static _i13.PageInfo page = _i13.PageInfo(
    name,
    builder: (data) {
      return const _i9.SplashPage();
    },
  );
}

/// generated route for
/// [_i10.TempPage]
class TempRoute extends _i13.PageRouteInfo<void> {
  const TempRoute({List<_i13.PageRouteInfo>? children})
      : super(
          TempRoute.name,
          initialChildren: children,
        );

  static const String name = 'TempRoute';

  static _i13.PageInfo page = _i13.PageInfo(
    name,
    builder: (data) {
      return const _i10.TempPage();
    },
  );
}

/// generated route for
/// [_i11.TermPage]
class TermRoute extends _i13.PageRouteInfo<void> {
  const TermRoute({List<_i13.PageRouteInfo>? children})
      : super(
          TermRoute.name,
          initialChildren: children,
        );

  static const String name = 'TermRoute';

  static _i13.PageInfo page = _i13.PageInfo(
    name,
    builder: (data) {
      return const _i11.TermPage();
    },
  );
}

/// generated route for
/// [_i12.ValidateBusinessPage]
class ValidateBusinessRoute
    extends _i13.PageRouteInfo<ValidateBusinessRouteArgs> {
  ValidateBusinessRoute({
    _i14.Key? key,
    required _i16.ValidateBusinessPageArgs args,
    List<_i13.PageRouteInfo>? children,
  }) : super(
          ValidateBusinessRoute.name,
          args: ValidateBusinessRouteArgs(
            key: key,
            args: args,
          ),
          initialChildren: children,
        );

  static const String name = 'ValidateBusinessRoute';

  static _i13.PageInfo page = _i13.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ValidateBusinessRouteArgs>();
      return _i12.ValidateBusinessPage(
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

  final _i14.Key? key;

  final _i16.ValidateBusinessPageArgs args;

  @override
  String toString() {
    return 'ValidateBusinessRouteArgs{key: $key, args: $args}';
  }
}
