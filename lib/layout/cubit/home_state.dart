part of 'home_cubit.dart';

@immutable
sealed class HomeStates {}

final class HomeInitial extends HomeStates {}

final class HomeChangeBottomNav extends HomeStates {}

///////////////////////
final class HomeGetDataLoadingState extends HomeStates {}

final class HomeGetDataSuccessState extends HomeStates {}

final class HomeGetDataFailureState extends HomeStates {}

////////////////////
final class ChangeFavoriteState extends HomeStates {}

final class AddProductToFavoriteState extends HomeStates {}

final class AddProductToFavoriteFailureState extends HomeStates {}

final class RemoveProductFromFavoriteState extends HomeStates {}

/////////////////
final class GetFavoriteProductsLoadingState extends HomeStates {}

final class GetFavoriteProductsSuccessState extends HomeStates {}

final class GetFavoriteProductsFailureState extends HomeStates {}

////////////////////////////////
final class GetCatogoriestDataLoadingState extends HomeStates {}

final class GetCatogoriestDataSuccessState extends HomeStates {}

final class GetCatogoriestDataFailureState extends HomeStates {}

////////////////////////////////
final class GetProfileLoadingState extends HomeStates {}

final class GetProfileSuccessState extends HomeStates {
  final UserResponse userResponse;

  GetProfileSuccessState({required this.userResponse});
}

final class GetProfileFailureState extends HomeStates {}

////////////////////////////////
final class UpdateProfileLoadingState extends HomeStates {}

final class UpdateProfileSuccessState extends HomeStates {
  final UserResponse userResponse;

  UpdateProfileSuccessState({required this.userResponse});
}

final class UpdateProfileFailureState extends HomeStates {}
