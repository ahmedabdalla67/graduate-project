import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/layout/cubit/home_cubit.dart';
import 'package:shop_app/shared/widgets/build_products_view.dart';

class ProductsView extends StatelessWidget {
  const ProductsView({super.key});

  // HomeModel? model;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = HomeCubit.get(context);
        return Scaffold(
          body: cubit.homeModel != null && cubit.model != null
              ? BuildProductsView(
                  homeModel: cubit.homeModel!,
                  model: cubit.model!,
                )
              : const Center(
                  child: CircularProgressIndicator(),
                ),
        );
      },
    );
  }
}
