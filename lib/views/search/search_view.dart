import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/shared/widgets/build_list_products.dart';
import 'package:shop_app/shared/widgets/text_field_widget.dart';
import 'package:shop_app/views/search/cubit/search_cubit.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  var formKey = GlobalKey();
  var searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Search Product',
          style: TextStyle(
              fontSize: 25,
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontFamily: 'Baloo2'),
        ),
      ),
      body: BlocProvider(
        create: (context) => SearchCubit(),
        child: BlocBuilder<SearchCubit, SearchStates>(
          builder: (context, state) {
            var cubit = SearchCubit.get(context).searchModel;
            return Padding(
              padding: const EdgeInsets.all(12.0),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    TextFormFieldWidget(
                      controller: searchController,
                      hintText: 'Search',
                      textInputType: TextInputType.text,
                      validation: (value) {
                        if (value!.isEmpty) {
                          return 'enter text to search';
                        }
                        return null;
                      },
                      onSubmitted: (value) {
                        SearchCubit.get(context)
                            .searchProduct(text: searchController.text);
                      },
                      onchanged: (value) {
                        SearchCubit.get(context)
                            .searchProduct(text: searchController.text);
                      },
                    ),
                    if (state is SearchLoadingState)
                      const LinearProgressIndicator(),
                    const SizedBox(
                      height: 10,
                    ),
                    if (state is SearchSuccessState && cubit != null)
                      Expanded(
                        child: ListView.separated(
                            itemBuilder: (context, index) {
                              return BuildListProducts(
                                isOldPrice: false,
                                model: cubit.data!.data![index],
                              );
                            },
                            separatorBuilder: (context, index) => Container(
                                  width: double.infinity,
                                  height: 0.6,
                                  color: Colors.grey,
                                ),
                            itemCount: cubit.data!.data!.length),
                      )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
