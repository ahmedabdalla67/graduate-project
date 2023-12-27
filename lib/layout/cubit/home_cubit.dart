import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/models/add_favorite_model.dart';
import 'package:shop_app/models/catogories_model.dart';
import 'package:shop_app/models/get_favorite_model.dart';
import 'package:shop_app/models/home_model.dart';
import 'package:shop_app/models/user_model.dart';
import 'package:shop_app/network/end_points.dart';
import 'package:shop_app/network/remote/dio_helper.dart';
import 'package:shop_app/views/catecories/categoties_view.dart';
import 'package:shop_app/views/favorites/favorite_view.dart';
import 'package:shop_app/views/products/products_view.dart';
import 'package:shop_app/views/settings/settings_view.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitial());

  static HomeCubit get(context) => BlocProvider.of<HomeCubit>(context);
  HomeModel? homeModel;
  List<BannerModel> banners = [];

  int currentIndex = 0;
  List<Widget> bottomNavVeiws = [
    const ProductsView(),
    const CategoriesView(),
    const FavoritesView(),
    const SettingsView(),
  ];
  void changeBottmNav(int index) {
    currentIndex = index;
    emit(HomeChangeBottomNav());
  }

  Map<int, bool> favorites = {};

  void getHomeData() {
    // favorites.clear;
    emit(HomeGetDataLoadingState());
    DioHelper().getData(url: BASEURL + HOME, token: token).then((value) {
      // print(value.data);
      homeModel = HomeModel.fromJson(value.data);
      //  getProfile();
      // print('Image: ${homeModel!.data!.banners![0].image}');
      print('[000]: ${homeModel!.data!.products![0].inFavorites}');
      for (var element in homeModel!.data!.products!) {
        favorites.addAll({element.id!: element.inFavorites!});
      }

      print(favorites.toString());
      emit(HomeGetDataSuccessState());

      // print(homeModel.status);
    }).catchError((error) {
      print(error.toString());
      emit(HomeGetDataFailureState());
    });
  }

  ChangeFavoriteModel? changeFavModel;
  void addFavoritesProduct(int? productId) {
    favorites[productId!] = !favorites[productId]!;

    emit(ChangeFavoriteState());

    DioHelper()
        .postData(
            url: BASEURL + FAVORITES,
            body: {'product_id': productId},
            token: token)
        .then((value) {
      changeFavModel = ChangeFavoriteModel.fromJson(value.data);
      if (!changeFavModel!.status!) {
        favorites[productId] = !favorites[productId]!;
      } else {
        getFavorites();
      }

      print(value.data);
      emit(AddProductToFavoriteState());

      print(changeFavModel!.message.toString());
    }).catchError((error) {
      favorites[productId] = !favorites[productId]!;
      print(error);
      emit(AddProductToFavoriteFailureState());
    });
  }

  FavoriteModel? favoriteModel;
  void getFavorites() {
    emit(GetFavoriteProductsLoadingState());
    DioHelper().getData(url: BASEURL + FAVORITES, token: token).then((value) {
      print(value.data);
      favoriteModel = FavoriteModel.fromJson(value.data);

      emit(GetFavoriteProductsSuccessState());
      print(favoriteModel);
    }).catchError((error) {
      print(error);
      emit(GetFavoriteProductsFailureState());
    });
  }

  CategoriesModel? model;
  void getCategoriesdata() {
    emit(GetCatogoriestDataLoadingState());
    DioHelper().getData(url: BASEURL + CATEGORIES).then((value) {
      model = CategoriesModel.fromJson(value.data);
      emit(GetCatogoriestDataSuccessState());
      // print('name: ${model!.data!.dataOfCatogry![0].name}');
    }).catchError((error) {
      // print(error.toString());
      emit(GetCatogoriestDataFailureState());
    });
  }

  ///////////// GET PROFILE//////////////////

  UserResponse? userResponse;
  void getProfile() {
    emit(GetProfileLoadingState());
    DioHelper().getData(url: BASEURL + Profile, token: token).then((value) {
      // print(value.data);
      userResponse = UserResponse.fromJson(value.data);
      log(userResponse!.data!.token);
      emit(GetProfileSuccessState(userResponse: userResponse!));
    }).catchError((error) {
      // print(error.toString());
      emit(GetProfileFailureState());
    });
  }
}
