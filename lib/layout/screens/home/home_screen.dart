import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:germaniatek_market/layout/cubit/layout_cubit.dart';
import 'package:germaniatek_market/layout/screens/cateogrey/cateogrey_screen.dart';
import 'package:germaniatek_market/models/product_model.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LayoutCubit()
        // cascade operator to call methode from cubit
        ..getBannerData()
        ..getCateogreyData()
        ..getProducts()
        ..getFavorite()
        ..filterProduct(input: '')
        ..getCart(),
      //..addOrRemoveFromCart(id: id),
      child: BlocConsumer<LayoutCubit, LayoutState>(
        listener: (context, state) {},
        builder: (context, state) {
          //instanse دا
          // cubit من ال
          LayoutCubit cubbitt = context.read<LayoutCubit>();

          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(12.0),
              child: ListView(
                children: [
                  TextFormField(
                    onChanged: (input) {
                      cubbitt.filterProduct(input: input);
                    },
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.zero,
                        hintText: "search",
                        prefixIcon: const Icon(Icons.search),
                        suffixIcon: const Icon(Icons.clear),
                        filled: true,
                        fillColor: Colors.grey.withOpacity(0.2),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                        )),
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  cubbitt.banner.isEmpty
                      ? const Center(child: CircularProgressIndicator())
                      : SizedBox(
                          height: 150,
                          width: double.infinity,
                          child: PageView.builder(
                            controller: pageController,
                            physics: const BouncingScrollPhysics(),
                            itemCount: 3,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return Container(
                                margin: const EdgeInsets.only(right: 12),
                                child: Image.network(
                                  cubbitt.banner[index].url!,
                                  fit: BoxFit.cover,
                                ),
                              );
                            },
                          ),
                        ),
                  const SizedBox(
                    height: 17,
                  ),
                  Center(
                    child: SmoothPageIndicator(
                      controller: pageController,
                      count: 3,
                      axisDirection: Axis.horizontal,
                      effect: const SlideEffect(
                          spacing: 8.0,
                          radius: 25.0,
                          dotWidth: 16.0,
                          dotHeight: 16.0,
                          paintStyle: PaintingStyle.stroke,
                          strokeWidth: 1.5,
                          dotColor: Colors.grey,
                          activeDotColor: Colors.indigo),
                    ),
                  ),
                  const SizedBox(
                    height: 22,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Cateogries",
                        style: TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff2d4567)),
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const CateogreyScreen()));
                        },
                        child: const Text(
                          "View all  ",
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff819f7f)),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  cubbitt.cateogrey.isEmpty
                      ? const Center(child: CircularProgressIndicator())
                      : SizedBox(
                          height: 90,
                          width: double.infinity,
                          child: ListView.separated(
                            physics: const BouncingScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CircleAvatar(
                                    radius: 35,
                                    backgroundImage: NetworkImage(
                                      cubbitt.cateogrey[index].url!,
                                    ),
                                  ),
                                  Text(
                                    cubbitt.cateogrey[index].title!,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w600),
                                  ),
                                ],
                              );
                            },
                            itemCount: cubbitt.cateogrey.length,
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return const SizedBox(
                                width: 15,
                              );
                            },
                          ),
                        ),
                  const SizedBox(
                    height: 30,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Products",
                        style: TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff2d4567)),
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      // Text(
                      //   "View all  ",
                      //   style: TextStyle(
                      //       fontSize: 14,
                      //       fontWeight: FontWeight.bold,
                      //       color: Color(0xff819f7f)),
                      // )
                    ],
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  cubbitt.products.isEmpty
                      ? const Center(child: CircularProgressIndicator())
                      : GridView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: cubbitt.filteredProducts.isEmpty
                              ? cubbitt.products.length
                              : cubbitt.filteredProducts.length,
                          shrinkWrap: true,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  mainAxisSpacing: 10,
                                  crossAxisSpacing: 10,
                                  childAspectRatio: .8),
                          itemBuilder: (context, index) {
                            return _productItem(
                              model: cubbitt.filteredProducts.isEmpty
                                  ? cubbitt.products[index]
                                  : cubbitt.filteredProducts[index],
                              cubit: cubbitt,
                            );
                          }),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

Widget _productItem({required ProductModel model, required LayoutCubit cubit}) {
  return Stack(
    children: [
      Container(
        color: Colors.grey.withOpacity(.2),
        child: Column(
          children: [
            Expanded(
              child: Image.network(
                model.image!,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 7.0),
              child: Text(
                model.name!,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 7.0),
              child: Row(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        Text("${model.price!}\$",
                            style: const TextStyle(fontSize: 13)),
                        const SizedBox(width: 7),
                        Text("${model.oldPrice!}\$",
                            style: const TextStyle(
                                color: Colors.grey,
                                fontSize: 13,
                                decoration: TextDecoration.lineThrough))
                      ],
                    ),
                  ),
                  GestureDetector(
                    child: IconButton(
                      onPressed: () {
                        cubit.addOrRemoveFromFavourite(
                            productID: model.id.toString());
                      },
                      icon: Icon(
                        Icons.favorite,
                        size: 20,
                        color: cubit.favoruteID.contains(model.id.toString())
                            ? Colors.red
                            : Colors.grey,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      CircleAvatar(
        //backgroundColor: ,
        radius: 16,
        child: GestureDetector(
          onTap: () {
            cubit.addOrRemoveFromCart(id: model.id.toString());
          },
          child: Icon(
            Icons.shopping_cart,
            size: 20,
            color: cubit.cartsID.contains(model.id.toString())
                ? Colors.red
                : Colors.black,
          ),
        ),
      ),
    ],
  );
}
