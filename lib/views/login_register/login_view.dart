import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/layout/cubit/home_cubit.dart';
import 'package:shop_app/layout/home/home_view.dart';
import 'package:shop_app/network/local/cache_helper.dart';
import 'package:shop_app/views/login_register/cubit/login_cubit.dart';
import 'package:shop_app/views/login_register/register_view.dart';
import 'package:shop_app/shared/widgets/button_widget.dart';
import 'package:shop_app/shared/widgets/flutter_toast.dart';
import 'package:shop_app/shared/widgets/text_field_widget.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});
  static String id = 'Login';

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();
  String? email;
  @override
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginRegistStates>(
        listener: (context, state) {
          if (state is SuccessState) {
            if (state.userResponse.status) {
              CacheHelper.saveData(
                      key: 'token', value: state.userResponse.data!.token)
                  .then((value) {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => const HomeView()));
                token = state.userResponse.data!.token;
                print('token from login : $token');
              });

              showToast(
                  txt: state.userResponse.message, state: ToastState.SUCCESS);
              print('token is ${state.userResponse.data!.token}');
              debugPrint('message is ${state.userResponse.message}');
            } else {
              showToast(
                  state: ToastState.ERROR, txt: state.userResponse.message);
              debugPrint(state.userResponse.message);
            }
          } else {
            if (state is ErrorState) {
              showToast(state: ToastState.WARNING, txt: state.errMessage);
            }
          }
        },
        builder: (context, state) {
          return Scaffold(
            body: Form(
              key: formKey,
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Login',
                      style: TextStyle(
                          fontFamily: kFontFamily,
                          fontSize: 40,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    const Text(
                      'Login now to brwose our hot offers',
                      style: TextStyle(
                          color: Colors.grey,
                          fontFamily: kFontFamily,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    TextFormFieldWidget(
                      controller: emailController,
                      hintText: 'Email',
                      textInputType: TextInputType.emailAddress,
                      prefixIcon: const Icon(Icons.email),
                      validation: (value) {
                        if (value!.isEmpty) {
                          return 'required field';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    TextFormFieldWidget(
                        controller: passwordController,
                        hintText: 'password',
                        textInputType: TextInputType.visiblePassword,
                        prefixIcon: const Icon(Icons.lock),
                        suffixIcon: IconButton(
                          onPressed: () {
                            LoginCubit.get(context).changevisibilityForLogin();
                          },
                          icon: Icon(LoginCubit.get(context).suffix),
                        ),
                        obscureText: LoginCubit.get(context).isVisible,
                        validation: (value) {
                          if (value!.isEmpty) {
                            return 'password is short';
                          }
                          return null;
                        }),
                    const SizedBox(
                      height: 12,
                    ),
                    ButtonWidget(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          LoginCubit.get(context).userLogin(
                              email: emailController.text,
                              password: passwordController.text);
                          HomeCubit.get(context).getHomeData();
                          // Navigator.push(
                          //     context,
                          // MaterialPageRoute(
                          //     builder: (context) => const HomeView()));

                          // Navigator.pushReplacement(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => const HomeView()));
                        }
                      },
                      text: 'Login',
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Don\'t have an account ?'),
                        TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const RegisterView()));
                            },
                            child: const Text('Regist'))
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
