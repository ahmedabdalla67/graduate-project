import 'package:flutter/material.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/layout/cubit/home_cubit.dart';

class BuildListProducts extends StatelessWidget {
  const BuildListProducts({this.isOldPrice = true, super.key, this.model});

  final dynamic model;
  final bool isOldPrice;

  @override
  Widget build(BuildContext context) {
    var cubit = HomeCubit.get(context);
    return SizedBox(
      width: double.infinity,
      height: 150,
      child: Row(
        children: [
          Stack(alignment: AlignmentDirectional.bottomStart, children: [
            Image.network(
              model!.image!,
              width: 130,
              height: 145,
              // fit: BoxFit.fitWidth,
            ),
            if (model!.discount != 0 && isOldPrice)
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
                    model!.name!,
                    style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        overflow: TextOverflow.ellipsis),
                    maxLines: 2,
                  ),
                  Row(
                    children: [
                      Text(
                        model!.price!.toString(),
                        style: const TextStyle(
                            fontSize: 12,
                            color: kMainColor,
                            fontWeight: FontWeight.w300),
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      if (model!.discount != 0 && isOldPrice)
                        Text(model!.oldPrice!.toString(),
                            style: const TextStyle(
                                fontSize: 8,
                                color: Colors.grey,
                                decoration: TextDecoration.lineThrough)),
                      const Spacer(),
                      GestureDetector(
                        onTap: () {
                          cubit.addFavoritesProduct(model!.id);

                          // print(cubit.addFavModel!.message);
                        },
                        child: cubit.favorites[model!.id]!
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
  }
}
