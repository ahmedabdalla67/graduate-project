import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/layout/cubit/home_cubit.dart';
import 'package:shop_app/views/search/search_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var homeCubit = HomeCubit.get(context);
        return Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: homeCubit.currentIndex,
            onTap: (int index) {
              homeCubit.changeBottmNav(index);
            },
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.apps), label: 'Categories'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.favorite), label: 'Favorites'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.settings), label: 'Settings'),
            ],
          ),
          appBar: AppBar(
            title: const Text('Shop For HOB'),
            actions: [
              IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SearchView()));
                  },
                  icon: const Icon(Icons.search))
            ],
          ),
          body: homeCubit.bottomNavVeiws[homeCubit.currentIndex],
        );
      },
    );
  }
}
