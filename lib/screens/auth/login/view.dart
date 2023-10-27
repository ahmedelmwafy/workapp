import 'package:flutter/material.dart';
import 'package:workapp/helpers/navigation.dart';
import 'package:workapp/screens/auth/login/cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workapp/screens/auth/login/state.dart';
import 'package:workapp/screens/home/view.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: kBlueColor,
        centerTitle: false,
        // title: const Text('التخصصات'),
      ),
      body: BlocProvider(
        create: (context) => LoginCubit(),
        child: Builder(builder: (context) {
          LoginCubit cubit = LoginCubit.get(context);
          return BlocBuilder<LoginCubit, LoginState>(
            builder: (context, state) {
              return Form(
                key: cubit.formKey,
                child: ListView(
                  padding: const EdgeInsets.all(20),
                  children: [
                    TextFormField(
                      controller: cubit.emailController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Email must not be empty';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        labelText: 'Email',
                        hintText: 'Enter your email',
                      ),
                    ),
                    TextFormField(
                      controller: cubit.passwordController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Password must not be empty';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        labelText: 'Password',
                        hintText: 'Enter your password',
                      ),
                    ),
                    cubit.isLoggedInLoading
                        ? const Center(child: CircularProgressIndicator())
                        : ElevatedButton(
                            onPressed: () {
                              RouteManager.navigateTo(const HomeScreen());
                              // if (cubit.formKey.currentState!.validate()) {
                              //   cubit.login();
                              // }
                            },
                            child: const Text('Login'),
                          ),
                  ],
                ),
              );
            },
          );
        }),
      ),
    );
  }
}
