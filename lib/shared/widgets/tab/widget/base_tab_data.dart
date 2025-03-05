import 'package:equatable/equatable.dart';

/// BaseTab 에서 사용될 Data
class BaseTabData<T> extends Equatable {

  const BaseTabData({required this.text, required this.value});
  final String text;

  final T value;

  @override
  List<Object?> get props => [text, value];
}
