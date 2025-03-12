/// 홈 화면 스크린 타입
enum HomeSubPageType {
  calendar,
  search,
  job,
  profile;

  static HomeSubPageType fromIndex(int index) {
    return values.elementAtOrNull(index) ?? calendar;
  }
}
