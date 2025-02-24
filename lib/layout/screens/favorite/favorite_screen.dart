import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:germaniatek_market/layout/cubit/layout_cubit.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LayoutCubit()
        ..getFavorite()
        ..filterProduct(input: ''),
      child: BlocConsumer<LayoutCubit, LayoutState>(
        listener: (context, state) {},
        builder: (context, state) {
          LayoutCubit cubit = context.read<LayoutCubit>();
          return Scaffold(
              body: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 12.5),
            child: Column(
              children: [
                // TextFormField(
                //   onChanged: (input) {
                //     cubit.filterProduct(input: input);
                //   },
                //   decoration: InputDecoration(
                //       contentPadding: EdgeInsets.zero,
                //       hintText: "search",
                //       prefixIcon: const Icon(Icons.search),
                //       suffixIcon: const Icon(Icons.clear),
                //       filled: true,
                //       fillColor: Colors.grey.withOpacity(0.2),
                //       border: OutlineInputBorder(
                //         borderRadius: BorderRadius.circular(50),
                //       )),
                // ),
                // const SizedBox(
                //   height: 12,
                // ),
                cubit.favorites.isEmpty
                    ? const Center(child: CircularProgressIndicator())
                    : Expanded(
                        child: ListView.builder(
                          itemBuilder: (context, index) {
                            return Container(
                              margin: const EdgeInsets.symmetric(vertical: 10),
                              padding: const EdgeInsets.all(10),
                              color: const Color(0xffd3d0a8),
                              child: Row(
                                children: [
                                  Image.network(
                                    cubit.favorites[index].image!,
                                    width: 110,
                                    height: 100,
                                    fit: BoxFit.fill,
                                  ),
                                  const SizedBox(
                                    width: 7,
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          cubit.favorites[index].name!,
                                          maxLines: 1,
                                          style: const TextStyle(
                                              fontSize: 16.5,
                                              color: Color(0xff2d4569),
                                              fontWeight: FontWeight.bold,
                                              overflow: TextOverflow.ellipsis),
                                        ),
                                        const SizedBox(
                                          height: 7,
                                        ),
                                        Text(
                                            "${cubit.favorites[index].price!.toString()} \$"),
                                        MaterialButton(
                                          onPressed: () {
                                            cubit.addOrRemoveFromFavourite(
                                                productID: cubit
                                                    .favorites[index].id
                                                    .toString());
                                          },
                                          color: const Color(0xff2d4569),
                                          textColor: Colors.white,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(25)),
                                          child: const Text(
                                            "Remove",
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            );
                          },
                          itemCount: cubit.favorites.length,
                        ),
                      ),
              ],
            ),
          ));
        },
      ),
    );
  }
}
