import 'package:flutter/material.dart';
import 'package:workapp/core/color.dart';
import 'package:workapp/screens/home/cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workapp/screens/home/state.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: kBlueColor,
          centerTitle: false,
          title: const Text('التخصصات'),
        ),
        body: BlocProvider(
          create: (context) => HomeCubit()..getHomeData(),
          child: Builder(builder: (context) {
            HomeCubit cubit = HomeCubit.get(context);
            return BlocBuilder<HomeCubit, HomeState>(
              builder: (context, state) {
                return cubit.isHomeLoading
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : ListView(
                        children: [
                          GridView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: cubit.homeModel?.categories?.length ?? 0,
                            itemBuilder: (BuildContext context, int index) {
                              final data = cubit.homeModel?.categories?[index];
                              return Column(
                                children: [Text(data?.name ?? '')],
                              );
                            },
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2),
                          ),
                          ListView.separated(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: cubit.homeModel?.courses?.length ?? 0,
                            itemBuilder: (BuildContext context, int index) {
                              final courses = cubit.homeModel?.courses?[index];
                              return ListTile(
                                trailing: Text(courses?.price.toString() ?? ''),
                                subtitle: Text(courses?.hours ?? ''),
                                title: Text(courses?.title ?? ''),
                                leading: CircleAvatar(
                                  backgroundImage:
                                      NetworkImage(courses?.image ?? ''),
                                ),
                              );
                            },
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return const Divider();
                            },
                          )
                        ],
                      );
              },
            );
          }),
        ));
  }
}
