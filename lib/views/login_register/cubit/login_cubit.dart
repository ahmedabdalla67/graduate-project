import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/models/user_model.dart';
import 'package:shop_app/network/end_points.dart';
import 'package:shop_app/network/remote/dio_helper.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginRegistStates> {
  LoginCubit() : super(InitialState());

  // UserResponse? loginModel;

  static LoginCubit get(context) => BlocProvider.of(context);
  IconData suffix = Icons.visibility;
  bool isVisible = true;
  void changevisibilityForLogin() {
    isVisible = !isVisible;
    suffix = isVisible ? Icons.visibility : Icons.visibility_off;
    emit(ChangeVisibility());
  }

  void userLogin({required String email, required String password}) {
    emit(LoadingState());
    DioHelper().postData(
        url: BASEURL + LOGIN,
        body: {'email': email, 'password': password}).then((value) {
      UserResponse loginModel = UserResponse.fromJson(value.data);
      emit(SuccessState(loginModel));
      // print(value.data);

      // print(loginModel.message.toString());
    }).catchError((error) {
      debugPrint(error.toString());
      emit(ErrorState(error.toString()));
    });
  }

  IconData suffixIcon = Icons.visibility;
  bool isPassword = true;
  void changevisibilityForRegister() {
    isPassword = !isPassword;
    suffixIcon = isPassword ? Icons.visibility : Icons.visibility_off;
    emit(ChangeVisibilityForRegister());
  }

  void userRegist({
    required String nanme,
    required String email,
    required String password,
    required String phone,
  }) {
    emit(LoadingState());
    DioHelper().postData(url: BASEURL + REGISTER, body: {
      'email': email,
      'password': password,
      'name': phone,
      'phone': phone
    }).then((value) {
      UserResponse userResponse = UserResponse.fromJson(value.data);
      print(userResponse.message);
      emit(SuccessState(userResponse));
    }).catchError((error) {
      emit(ErrorState(error.toString()));
    });
  }
}
