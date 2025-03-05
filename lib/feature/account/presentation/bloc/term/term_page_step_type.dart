import 'package:withu/core/utils/utils.dart';
import 'package:withu/gen/assets.gen.dart' show Assets, SvgGenImage;

enum TermPageStepType { first, second }

extension TermStateEx on TermPageStepType {
  bool get isFirst => this == TermPageStepType.first;

  String toTitle() {
    switch (this) {
      case TermPageStepType.first:
        return StringRes.connectForOpportunities.tr;
      case TermPageStepType.second:
        return StringRes.checkBeforeJoining.tr;
    }
  }

  String toDescription() {
    switch (this) {
      case TermPageStepType.first:
        return StringRes.selectRoleForCustomService.tr;
      case TermPageStepType.second:
        return StringRes.termsRequired.tr;
    }
  }

  SvgGenImage toAsset() {
    switch (this) {
      case TermPageStepType.first:
        return Assets.images.logoPuzzle;
      case TermPageStepType.second:
        return Assets.images.logoPuzzle2;
    }
  }
}
