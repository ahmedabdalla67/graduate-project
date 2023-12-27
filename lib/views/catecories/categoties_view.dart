import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/layout/cubit/home_cubit.dart';

class CategoriesView extends StatelessWidget {
  const CategoriesView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeStates>(builder: (context, state) {
      var cubit = HomeCubit.get(context);
      return Scaffold(
        body: GridView.builder(
            itemCount: cubit.model!.data!.dataOfCatogry!.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 3,
                mainAxisSpacing: 3,
                childAspectRatio: 1 / 1),
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Image.network(
                    cubit.model!.data!.dataOfCatogry![index].image!,
                    width: 150,
                    height: 150,
                    fit: BoxFit.fill,
                  ),
                  Expanded(
                      child:
                          Text(cubit.model!.data!.dataOfCatogry![index].name!))
                ],
              );
            }),
      );
    });
  }
}
