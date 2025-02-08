import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:germaniatek_market/layout/cubit/layout_cubit.dart';

class CateogreyScreen extends StatelessWidget {
  const CateogreyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LayoutCubit()..getCateogreyData(),
      child: BlocConsumer<LayoutCubit, LayoutState>(
        listener: (context, state) {},
        builder: (context, state) {
          LayoutCubit cubit = context.read<LayoutCubit>();
          return Scaffold(
            
            body: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
              child: GridView.builder(
                itemCount: cubit.cateogrey.length,
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 20,
                  crossAxisCount: 2,
                ),
                itemBuilder: (context, index) {
                  return Container(
                    child: Column(
                      children: [
                        Expanded(
                            child: Image.network(
                          cubit.cateogrey[index].url!,
                          fit: BoxFit.fill,
                        )),
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          cubit.cateogrey[index].title!,
                          style: const TextStyle(fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
