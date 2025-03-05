/// 페이지네이션 추상 모델
abstract class PaginationDto<T> {

  PaginationDto({
    required this.content,
    required this.totalPages,
    required this.totalElements,
    required this.size,
    required this.number,
  });
  final List<T> content;
  final int totalPages;
  final int totalElements;
  final int size;
  final int number;
}

extension ParginationDtoUtils on PaginationDto {
  /// 마지막 여부
  bool get isLast => totalPages == (number + 1);
}
