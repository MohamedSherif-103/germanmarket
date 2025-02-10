import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:germaniatek_market/layout/cubit/layout_cubit.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LayoutCubit()..getCart(),
      child: BlocConsumer<LayoutCubit, LayoutState>(
        listener: (context, state) {},
        builder: (context, state) {
          LayoutCubit cubit = context.read<LayoutCubit>();

          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  const SizedBox(
                    height: 9,
                  ),
                  Expanded(
                    child: cubit.carets.isEmpty
                        ? const Center(child: CircularProgressIndicator())
                        : ListView.separated(
                            physics: const BouncingScrollPhysics(),
                            separatorBuilder: (context, index) {
                              return const SizedBox(
                                height: 12,
                              );
                            },
                            itemCount: cubit.carets.length,
                            itemBuilder: (context, index) {
                              return Container(
                                padding: const EdgeInsets.all(10),
                                color: const Color(0xffd3d0a8),
                                child: Row(
                                  children: [
                                    Image.network(
                                      cubit.carets[index].image!,
                                      height: 100,
                                      width: 100,
                                      fit: BoxFit.fill,
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                        child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          cubit.carets[index].name!,
                                          maxLines: 1,
                                          style: const TextStyle(
                                            overflow: TextOverflow.ellipsis,
                                            fontSize: 17,
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xff2d4569),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              "${cubit.carets[index].price!.toString()} \$",
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.w800),
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            if (cubit.carets[index].price !=
                                                cubit.carets[index].oldPrice)
                                              Text(
                                                " ${cubit.carets[index].oldPrice!.toString()} \$",
                                                style: const TextStyle(
                                                    fontWeight: FontWeight.w700,
                                                    color: Colors.grey,
                                                    decoration: TextDecoration
                                                        .lineThrough),
                                              ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            OutlinedButton(
                                              onPressed: () {
                                                cubit.addOrRemoveFromFavourite(
                                                    productID: cubit
                                                        .carets[index].id!
                                                        .toString());
                                              },
                                              child: Icon(
                                                Icons.favorite,
                                                color: cubit.favoruteID
                                                        .contains(cubit
                                                            .carets[index].id
                                                            .toString())
                                                    ? Colors.red
                                                    : Colors.grey,
                                              ),
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                cubit.addOrRemoveFromCart(
                                                    id: cubit.carets[index].id
                                                        .toString());
                                              },
                                              child: const Icon(
                                                Icons.delete,
                                                color: Colors.red,
                                              ),
                                            )
                                          ],
                                        ),
                                      ],
                                    )),
                                  ],
                                ),
                              );
                            },
                          ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    child: Text(
                      "Total Price : ${cubit.totalPrice} \$",
                      style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff2d4569)),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
