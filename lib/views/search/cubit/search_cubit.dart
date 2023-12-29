import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/models/search_model.dart';
import 'package:shop_app/network/end_points.dart';
import 'package:shop_app/network/remote/dio_helper.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchStates> {
  SearchCubit() : super(SearchInitialState());
  static SearchCubit get(context) => BlocProvider.of<SearchCubit>(context);
  SearchModel? searchModel;
  void searchProduct({required String text}) {
    emit(SearchLoadingState());
    DioHelper()
        .postData(url: BASEURL + SEARCH, body: {'text': text}, token: token)
        .then((value) {
      searchModel = SearchModel.fromJson(value.data);
      emit(SearchSuccessState());
    }).catchError((error) {
      log(error.toString());
      emit(SearchFailureState());
    });
  }
}
