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
  flower,
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
  registration,
  serverError,
  travelTimeGuideDescription,
  breakTimeGuideDescription,
  mealGuideDescription,
  update,
  delete,
  close,
  cancel,
  isNotDeadlineYetConfirmClose,
  isUpdateContentCorrect,
  canRevertFromPostingManagement,
  yearsOld,
  showJobPosting,
  workStatus,
  attendance,
  leaveWork,
  attendanceScheduled,
  attendanceCompleted,
  noApplicants,
  closingRecruitment,
  noSavedJobPosting,
  findingGeekWorker,
  findingNewJob,
  pleaseEnterEmail,
  pleaseEnterPassword,
  login,
  emailLogin,
  findIdPw,
  signUp,
  pleaseEnterValidEmail,
  pleaseEnterValidPassword,
  enterOnlyNumber,
  enterVerificationCode,
  verification,
  invalidVerificationCode,
  logoDescription,
  connectForOpportunities,
  checkBeforeJoining,
  termsAgreementRequired,
  protectYourValuableInfo,
  selectRoleForCustomService,
  termsRequired,
  dataProtection,
  workerSignup,
  employerSignup,
  next,
  prev,
  confirm,
  skipping,
  selfIntroRegister,
  selfIntroHint,
  selfIntroInputHint,
  selfFieldSelect,
  selfFieldDescription,
  selfCareerInput,
  selfAchievementInfo,
  selfPortfolioAdd,
  selfPortfolioPhotoGuide,
  selfInterestAreaAdd,
  selfInterestAreaInfo,
  selfProfileRegister,
  selfProfilePhotoUpload,
  findId,
  name,
  content,
  companyName,
  startDate,
  endDate,
  inputCareerName,
  inputMax20Chars,
  inputCompanyName,
  yyyyMMddSlash,
  addCareer,
  selectHopeArea,
}

extension StringResEx on StringRes {
  /// localization
  String get tr => easy.tr(name);
}
