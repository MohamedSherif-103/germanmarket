import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:germaniatek_market/layout/cubit/layout_cubit.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeScreen extends StatelessWidget {
  final pageController = PageController();
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LayoutCubit()
        ..getBannerData()
        ..getCateogreyData(),
      child: BlocConsumer<LayoutCubit, LayoutState>(
        listener: (context, state) {},
        builder: (context, state) {
          LayoutCubit cubbitt = context.read<LayoutCubit>();
          LayoutCubit cubit = context.read<LayoutCubit>();
          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(12.0),
              child: ListView(
                children: [
                  TextFormField(
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
                            itemCount: cubbitt.banner.length,
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
                    height: 12,
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
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Cateogries",
                        style: TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff2d4567)),
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      Text(
                        "View all  ",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff819f7f)),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  cubbitt.cateogrey.isEmpty
                      ? const Center(child: CircularProgressIndicator())
                      : SizedBox(
                          height: 75,
                          width: double.infinity,
                          child: ListView.builder(
                            physics: const BouncingScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return CircleAvatar(
                                radius: 35,
                                child: Image.network(
                                  cubbitt.cateogrey[index].url!,
                                  fit: BoxFit.cover,
                                ),
                              );
                            },
                            itemCount: cubbitt.cateogrey.length,
                          ),
                        ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
