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

//
final class IndexChanged extends LayoutState {}

//
final class GetBannerLoadingState extends LayoutState {}

final class GetBannerSuccessState extends LayoutState {}

final class GetBannerFailureState extends LayoutState {
  final String error;

  GetBannerFailureState({required this.error});
}

//
final class GetCategoriesLoadingState extends LayoutState {}

final class GetCategoriesSuccessState extends LayoutState {}

final class GetCategoriesFailureState extends LayoutState {
  final String error;

  GetCategoriesFailureState({required this.error});
}

//
final class GetProductsLoadingState extends LayoutState {}

final class GetProductsSuccessState extends LayoutState {}

final class GetProductsFailureState extends LayoutState {
  final String error;

  GetProductsFailureState({required this.error});
}
