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

//////////////////////////////////////////////////////
final class GetProductsLoadingState extends LayoutState {}

final class GetProductsSuccessState extends LayoutState {}

final class GetProductsFailureState extends LayoutState {
  final String error;

  GetProductsFailureState({required this.error});
}

/////////////////////////////////////////////
final class FilterProductsLoadingState extends LayoutState {}

final class FilterProductsSuccessState extends LayoutState {}

final class FilterProductsFailureState extends LayoutState {
  final String error;

  FilterProductsFailureState({required this.error});
}

/////////////////////////////////////////////
final class GetFavouriteSuccessState extends LayoutState {}

final class GetFavouriteFailureState extends LayoutState {
  final String error;

  GetFavouriteFailureState({required this.error});
}

/////////////////////////////////////////////
final class AddOrRemoveFromFavouriteSuccessState extends LayoutState {}

final class AddOrRemoveFromFavouriteFailureState extends LayoutState {
  final String error;

  AddOrRemoveFromFavouriteFailureState({required this.error});
}

///////////////////////////////////////////
final class GetCartSuccessState extends LayoutState {}

final class GetCartFailureState extends LayoutState {
  final String error;

  GetCartFailureState({required this.error});
}

/////////////////////////////////////////
final class AddOrRemoveFromCartSuccessState extends LayoutState {}

final class AddOrRemoveFromCartFailureState extends LayoutState {
  final String error;

  AddOrRemoveFromCartFailureState({required this.error});
}
////////////////////////////////////////