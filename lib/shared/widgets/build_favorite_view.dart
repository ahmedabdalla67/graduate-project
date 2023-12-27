import 'package:flutter/material.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/layout/cubit/home_cubit.dart';
import 'package:shop_app/models/get_favorite_model.dart';

class BuildFavoriteView extends StatelessWidget {
  const BuildFavoriteView({super.key, required this.favoriteModel});
  final FavoriteModel favoriteModel;

  @override
  Widget build(BuildContext context) {
    var cubit = HomeCubit.get(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.separated(
          itemBuilder: (context, index) {
            return SizedBox(
              width: double.infinity,
              height: 150,
              child: Row(
                children: [
                  Stack(alignment: AlignmentDirectional.bottomStart, children: [
                    Image.network(
                      cubit.favoriteModel!.data!.data![index].product!.image!,
                      width: 130,
                      height: 145,
                      // fit: BoxFit.fitWidth,
                    ),
                    if (cubit.favoriteModel!.data!.data![index].product!
                            .discount !=
                        0)
                      Container(
                        color: Colors.red,
                        child: const Text(
                          'DISCOUNT',
                          style: TextStyle(fontSize: 8, color: Colors.white),
                        ),
                      ),
                  ]),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            cubit.favoriteModel!.data!.data![index].product!
                                .name!,
                            style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                overflow: TextOverflow.ellipsis),
                            maxLines: 2,
                          ),
                          Row(
                            children: [
                              Text(
                                cubit.favoriteModel!.data!.data![index].product!
                                    .price!
                                    .toString(),
                                style: const TextStyle(
                                    fontSize: 12,
                                    color: kMainColor,
                                    fontWeight: FontWeight.w300),
                              ),
                              const SizedBox(
                                width: 4,
                              ),
                              if (cubit.favoriteModel!.data!.data![index]
                                      .product!.discount !=
                                  0)
                                Text(
                                    cubit.favoriteModel!.data!.data![index]
                                        .product!.oldPrice!
                                        .toString(),
                                    style: const TextStyle(
                                        fontSize: 8,
                                        color: Colors.grey,
                                        decoration:
                                            TextDecoration.lineThrough)),
                              const Spacer(),
                              GestureDetector(
                                onTap: () {
                                  cubit.addFavoritesProduct(favoriteModel
                                      .data!.data![index].product!.id);

                                  // print(cubit.addFavModel!.message);
                                },
                                child: cubit.favorites[favoriteModel
                                        .data!.data![index].product!.id]!
                                    ? const Icon(
                                        Icons.favorite,
                                        color: Colors.red,
                                      )
                                    : const Icon(Icons.favorite_border),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            );
          },
          separatorBuilder: (context, index) => Container(
                width: double.infinity,
                height: 0.6,
                color: Colors.grey,
              ),
          itemCount: cubit.favoriteModel!.data!.data!.length),
    );
  }
}
