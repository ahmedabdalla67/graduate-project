import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/layout/cubit/home_cubit.dart';
import 'package:shop_app/shared/widgets/build_favorite_view.dart';

class FavoritesView extends StatelessWidget {
  const FavoritesView({super.key});

  @override
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeStates>(builder: (context, state) {
      var cubit = HomeCubit.get(context);

      return Scaffold(
          body: state is! GetFavoriteProductsLoadingState
              ? cubit.favoriteModel != null
                  ? BuildFavoriteView(
                      favoriteModel: cubit.favoriteModel!,
                    )
                  : const Center(
                      child: CircularProgressIndicator(),
                    )
              : const Center(child: CircularProgressIndicator()));
    });
  }
}
