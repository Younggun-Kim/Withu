class RegExUtil {
  /// 이름 패턴
  static RegExp namePattern = RegExp(r'^\D{2,}$');

  /// 이메일 패턴
  static RegExp emailPattern = RegExp(
    r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$",
  );

  /// 패스워드
  static RegExp passwordPattern = RegExp(
    r'^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,20}$',
  );

  /// 휴대폰번호 11자리
  static RegExp phonePattern = RegExp(
    r'^(010|011|016|017|018|019)\d{3,4}\d{4}$',
  );

  /// 사업자등록번호 10자리
  static RegExp businessNumPattern = RegExp(r'^\d{10}$');

  /// 생년월일 yyyyMMdd형태
  static RegExp birthDatePattern = RegExp(
    r'^(19|20)\d{2}(0[1-9]|1[0-2])(0[1-9]|[12][0-9]|3[01])$',
  );
  static RegExp ymdSlashPattern = RegExp(
    r'^(19|20)\d{2}/(0[1-9]|1[0-2])/(0[1-9]|[12][0-9]|3[01])$',
  );
  static RegExp ymdDashPattern = RegExp(
    r'^(19|20)\d{2}-(0[1-9]|1[0-2])-(0[1-9]|[12][0-9]|3[01])$',
  );
}
