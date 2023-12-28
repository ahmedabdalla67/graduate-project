import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/layout/cubit/home_cubit.dart';
import 'package:shop_app/network/local/cache_helper.dart';
import 'package:shop_app/shared/widgets/button_widget.dart';
import 'package:shop_app/shared/widgets/text_field_widget.dart';
import 'package:shop_app/views/login_register/login_view.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({super.key});
  static String id = 'settings';

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var phoneController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {
        // if (state is GetProfileSuccessState) {
        //   nameController.text = state.userResponse.data!.name;
        //   emailController.text = state.userResponse.data!.email;
        //   phoneController.text = state.userResponse.data!.phone;
        //}
      },
      builder: (context, state) {
        var cubit = HomeCubit.get(context).userResponse!;
        nameController.text = cubit.data!.name;
        emailController.text = cubit.data!.email;
        phoneController.text = cubit.data!.phone;
        // if (state is GetProfileSuccessState) {
        //   nameController.text = cubit.data!.name;
        //   emailController.text = cubit.data!.email;
        //   phoneController.text = cubit.data!.phone;
        // } else {
        //   const Center(child: CircularProgressIndicator());
        // }

        return Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                if (state is UpdateProfileLoadingState)
                  const LinearProgressIndicator(),
                const SizedBox(
                  height: 12,
                ),
                TextFormFieldWidget(
                  controller: nameController,
                  hintText: 'name',
                  textInputType: TextInputType.name,
                  prefixIcon: const Icon(Icons.person),
                  validation: (value) {
                    if (value!.isEmpty) {
                      return 'field is empty';
                    } else if (value.length < 5) {
                      return 'Input must be at least 5 characters';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 8,
                ),
                TextFormFieldWidget(
                  controller: emailController,
                  hintText: 'email',
                  textInputType: TextInputType.emailAddress,
                  prefixIcon: const Icon(Icons.mail),
                  validation: (value) {
                    if (value!.isEmpty) {
                      return 'field is empty';
                    } else if (value.contains('@') == false) {
                      return 'email must contain "@"';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 8,
                ),
                TextFormFieldWidget(
                  controller: phoneController,
                  hintText: 'phone',
                  textInputType: TextInputType.phone,
                  prefixIcon: const Icon(Icons.phone_iphone),
                  validation: (value) {
                    if (value!.isEmpty) {
                      return 'field is empty';
                    } else if (value.length != 11) {
                      return 'wrong Phone Numer';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 32,
                ),
                ButtonWidget(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        HomeCubit.get(context).updateProfile(
                            nameController.text,
                            phoneController.text,
                            emailController.text);
                      }
                    },
                    text: 'Update'),
                const SizedBox(
                  height: 12,
                ),
                ButtonWidget(
                    onPressed: () {
                      CacheHelper.removeData(key: token!).then((value) {
                        Navigator.pushReplacementNamed(context, LoginView.id);
                        // Navigator.pop(context);
                      });
                    },
                    text: 'LogOut'),
              ],
            ),
          ),
        );
      },
    );
  }
}
