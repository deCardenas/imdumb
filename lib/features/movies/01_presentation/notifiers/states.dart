import 'package:imdumb/core/errors/failures.dart';

sealed class AbstractState<T> {
  const AbstractState();
}

final class InitialState<T> extends AbstractState<T> {
  final T? data;
  const InitialState({this.data});
}

final class LoadingState<T> extends AbstractState<T> {
  const LoadingState();
}

final class FailureState<T> extends AbstractState<T> {
  final AppFailure failure;
  final String? optionalMessage;

  String get message => optionalMessage ?? failure.message;

  const FailureState(this.failure, {this.optionalMessage});

  List<Object?> get props => [failure];
}

final class PaginatedListState<T> extends AbstractState<T> {
  final int totalResultado;
  final List<T> items;
  final bool isLast;
  final bool isLoadingMore;

  const PaginatedListState(
    this.totalResultado,
    this.items, {
    required this.isLast,
    this.isLoadingMore = false,
  });

  List<Object?> get props => [
    totalResultado,
    items.length,
    items.hashCode,
    isLast,
    isLoadingMore,
  ];

  PaginatedListState<T> isLoading() => PaginatedListState(
    totalResultado,
    items,
    isLast: isLast,
    isLoadingMore: true,
  );
}

final class SuccessState<T> extends AbstractState<T> {
  final T data;

  const SuccessState(this.data);

  List<Object?> get props => [data];
}

final class SuccessStateWithoutData<T> extends AbstractState<T> {
  const SuccessStateWithoutData();
}

final class MaintenanceFailureState<T> extends AbstractState<T> {
  final String data;

  const MaintenanceFailureState(this.data);

  List<Object?> get props => [data];
}

final class DownloadState<T> extends AbstractState<T> {
  final T data;
  final AppFailure? failure;

  const DownloadState(this.data, {this.failure});

  List<Object?> get props => [data, failure];
}
