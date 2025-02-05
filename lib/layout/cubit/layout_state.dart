part of 'layout_cubit.dart';

@immutable
sealed class LayoutState {}

final class LayoutCubitInitial extends LayoutState {}

final class GetProfileLoadingState extends LayoutState {}

final class GetProfileSuccessState extends LayoutState {}

final class GetProfileFailureState extends LayoutState {
  final String error;

  GetProfileFailureState({required this.error});
}

final class IndexChanged extends LayoutState {}
