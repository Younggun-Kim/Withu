import 'package:easy_localization/easy_localization.dart' as easy;

enum StringRes {
  appName,
  temporarySave,
  inProgress,
  closed,
  photography,
  catering,
  foodStyling,
  florist,
  numberOfRecruits,
  enterTitle,
  workDetail,
  enterDescriptionOfJobPosting,
  selectCategory,
  periodFormat,
  shortTerm,
  longTerm,
  workContractPeriod,
  workContractStartPeriod,
  workContractEndPeriod,
  time,
  tbc,
  numberOfPeopleRecruited,
  payMethod,
  hourlyWage,
  dailyWage,
  address,
  findAddress,
  enterDetailedAddress,
  preferences,
  enterMemo,
  travelTime,
  travelTimeOrNot,
  wage,
  nonWage,
  breakTime,
  breakTimeOrNot,
  mealPaid,
  mealPaidOrNot,
  workHours,
  numberOfPeopleUnit,
  wonUnit,
  register,
}

extension StringResEx on StringRes {
  /// localization
  String get tr => easy.tr(name);
}
