import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/shared/widgets/button_widget.dart';
import 'package:shop_app/shared/widgets/flutter_toast.dart';
import 'package:shop_app/shared/widgets/text_field_widget.dart';
import 'package:shop_app/views/login_register/cubit/login_cubit.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var phoneController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginRegistStates>(
      listener: (context, state) {
        if (state is SuccessState) {
          if (state.userResponse.status == true) {
            showToast(
                state: ToastState.SUCCESS, txt: state.userResponse.message);
            Navigator.pop(context);
            print('message is: ${state.userResponse.message.toString()}');
            print('token is: ${state.userResponse.data!.token}');
          } else {
            print(state.userResponse.message);
            showToast(state: ToastState.ERROR, txt: state.userResponse.message);
          }
        } else {
          if (state is ErrorState) {
            showToast(
                state: ToastState.WARNING, txt: state.errMessage.toString());
          }
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(16),
            child: Center(
              child: Form(
                key: formKey,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        'Regist a new account',
                        style: TextStyle(
                            fontSize: 40, fontWeight: FontWeight.w700),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      TextFormFieldWidget(
                        controller: nameController,
                        hintText: 'Name',
                        textInputType: TextInputType.name,
                        prefixIcon: const Icon(Icons.person),
                        validation: (value) {
                          if (value!.isEmpty) {
                            return 'required field';
                          } else {
                            return null;
                          }
                        },
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      TextFormFieldWidget(
                        controller: emailController,
                        hintText: 'Email',
                        textInputType: TextInputType.emailAddress,
                        prefixIcon: const Icon(Icons.mail),
                        validation: (value) {
                          if (value!.isEmpty) {
                            return 'required field';
                          } else {
                            return null;
                          }
                        },
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      TextFormFieldWidget(
                        controller: passwordController,
                        hintText: 'Password',
                        textInputType: TextInputType.visiblePassword,
                        prefixIcon: const Icon(Icons.lock),
                        suffixIcon: IconButton(
                          onPressed: () {
                            LoginCubit.get(context)
                                .changevisibilityForRegister();
                          },
                          icon: Icon(LoginCubit.get(context).suffixIcon),
                        ),
                        obscureText: LoginCubit.get(context).isPassword,
                        validation: (value) {
                          if (value!.isEmpty) {
                            return 'required field';
                          } else {
                            return null;
                          }
                        },
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      TextFormFieldWidget(
                        controller: phoneController,
                        hintText: 'Phone',
                        textInputType: TextInputType.phone,
                        prefixIcon: const Icon(Icons.phone_android),
                        validation: (value) {
                          if (value!.length != 11) {
                            return 'phone should be 11 number';
                          } else {
                            return null;
                          }
                        },
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      ButtonWidget(
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              LoginCubit.get(context).userRegist(
                                  nanme: nameController.text,
                                  email: emailController.text,
                                  password: passwordController.text,
                                  phone: phoneController.text);
                            }
                          },
                          text: 'Regist'),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('have an account ?'),
                          TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text('Login'))
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
