import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/layout/cubit/home_cubit.dart';
import 'package:shop_app/models/catogories_model.dart';
import 'package:shop_app/models/home_model.dart';
import 'package:shop_app/views/catecories/categoties_view.dart';

class BuildProductsView extends StatelessWidget {
  const BuildProductsView(
      {super.key, required this.homeModel, required this.model});

  final HomeModel homeModel;
  final CategoriesModel model;
  @override
  Widget build(BuildContext context) {
    var cubit = HomeCubit.get(context);
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          children: [
            CarouselSlider(
              options: CarouselOptions(
                enlargeCenterPage: true,
                autoPlay: true,
                autoPlayAnimationDuration: const Duration(milliseconds: 750),
                autoPlayCurve: Curves.fastEaseInToSlowEaseOut,
                scrollPhysics: const BouncingScrollPhysics(),
                animateToClosest: true,
                viewportFraction: 0.8,
                scrollDirection: Axis.horizontal,
                height: 250,
                initialPage: 0,
                enableInfiniteScroll: true,
              ),
              items: homeModel.data!.banners!
                  .map(
                    (e) => Image(
                      image: NetworkImage(e.image!),
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                  )
                  .toList(),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Categories',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const CategoriesView()));
                    },
                    child: const Text('view all')),
              ],
            ),
            ///////////////// Categories ////////////////
            SizedBox(
              height: 100,
              child: ListView.separated(
                shrinkWrap: true,
                separatorBuilder: (context, index) => const SizedBox(
                  width: 8,
                ),
                physics: const BouncingScrollPhysics(),
                itemCount: model.data!.dataOfCatogry!.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Stack(children: [
                    CircleAvatar(
                        radius: 55,
                        backgroundImage: NetworkImage(
                            model.data!.dataOfCatogry![index].image!)),
                  ]);
                },
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            ////////// Products /////////////
            GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: homeModel.data!.products!.length,
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 1,
                  mainAxisSpacing: 1,
                  childAspectRatio: 1 / 1.3),
              itemBuilder: (contxt, index) {
                return Card(
                  color: Colors.white,
                  elevation: 1,
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                    child: Column(
                      //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Stack(
                            alignment: AlignmentDirectional.bottomStart,
                            children: [
                              Image.network(
                                homeModel.data!.products![index].image!,
                                width: 160,
                                height: 140,
                                // fit: BoxFit.fill,
                              ),
                              if (homeModel.data!.products![index].discount !=
                                  0)
                                Container(
                                  color: Colors.red,
                                  child: const Text(
                                    'DISCOUNT',
                                    style: TextStyle(
                                        fontSize: 8, color: Colors.white),
                                  ),
                                )
                            ]),
                        const SizedBox(
                          height: 3,
                        ),
                        Text(
                          homeModel.data!.products![index].name!,
                          maxLines: 2,
                          style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              overflow: TextOverflow.ellipsis,
                              height: 1),
                        ),
                        Expanded(
                          child: Row(
                            children: [
                              Text(
                                homeModel.data!.products![index].price
                                    .toString(),
                                style: const TextStyle(color: kMainColor),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              if (homeModel.data!.products![index].discount !=
                                  0)
                                Text(
                                  homeModel.data!.products![index].oldPrice
                                      .toString(),
                                  style: const TextStyle(
                                      color: Colors.grey,
                                      fontSize: 11,
                                      decoration: TextDecoration.lineThrough),
                                ),
                              const Spacer(),
                              GestureDetector(
                                onTap: () {
                                  cubit.addFavoritesProduct(
                                      homeModel.data!.products![index].id);
                                },
                                child: cubit.favorites[
                                        homeModel.data!.products![index].id]!
                                    ? const Icon(
                                        Icons.favorite,
                                        color: Colors.red,
                                      )
                                    : const Icon(
                                        Icons.favorite_border_outlined),

                                // cubit.favModel != null &&
                                //         cubit.favorites['id'] !=
                                //             cubit.homeModel.data.products
                                //     ? const Icon(Icons.favorite_border_outlined)
                                //     : const Icon(
                                //         Icons.favorite,
                                //         color: Colors.red,
                                //       ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
