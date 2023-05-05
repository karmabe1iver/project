import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/app/data/services/remote_services.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: Get.height * .03),
              Row(
                children: [
                  Icon(
                    Icons.ac_unit_sharp,
                  ),
                  Text(
                    'ZEDZAT',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: Get.height * .03),
                  ),
                ],
              ),
              SizedBox(
                height: Get.height * .03,
              ),
              Row(
                children: [
                  Icon(
                    Icons.location_on_outlined,
                  ),
                  GestureDetector(
                    onTap: () {
                      controller.address.value='loading.......';
                      controller.CurrentLocation();
                    },
                    child: Obx(
                      () => Text(
                        controller.address.value,
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: Get.height * .018),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: Get.height * .02,
              ),
              Container(
                  child: CarouselSlider.builder(
                itemCount: 1,
                options: CarouselOptions(
                  viewportFraction: 0.9,
                  enlargeCenterPage: true,
                  autoPlay: false,
                ),
                itemBuilder: (BuildContext context, int index, int realIndex) {
                  return Container(
                    child: Image.network(
                      'https://i0.wp.com/www.smartprix.com/bytes/wp-content/uploads/2022/05/image-13.png?ssl=1',
                      fit: BoxFit.fitHeight,
                    ),
                  );
                },
              )),
              SizedBox(
                height: Get.height * .03,
              ),
              Obx(
                () => Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {

                        controller.status.value = false;
                        print(controller.status.value);
                        controller.getData();
                      },
                      child: Container(
                        height: Get.height * .05,
                        width: Get.width * .34,
                        decoration: BoxDecoration(
                            color: controller.status.value == true
                                ? Colors.white
                                : Colors.black,
                            border: Border.all(
                              color: Colors.black,
                            ),
                            borderRadius: BorderRadius.circular(10)),
                        child: Center(
                            child: Text(
                          'Porduct',
                          style: TextStyle(
                              color: controller.status.value == true
                                  ? Colors.grey
                                  : Colors.white),
                        )),
                      ),
                    ),
                    SizedBox(
                      width: Get.width * .1,
                    ),
                    InkWell(
                      onTap: () {
                        controller.status.value = true;
                        controller.getData();

                      },
                      child: Container(
                        height: Get.height * .05,
                        width: Get.width * .34,
                        decoration: BoxDecoration(
                            color: controller.status.value == false
                                ? Colors.white
                                : Colors.black,
                            border: Border.all(
                              color: Colors.black,
                            ),
                            borderRadius: BorderRadius.circular(10)),
                        child: Center(
                            child: Text(
                          'Service',
                          style: TextStyle(
                              color: controller.status.value == false
                                  ? Colors.grey
                                  : Colors.white),
                        )),
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                  child: Obx(
                      ()=> FutureBuilder<dynamic>(
                        future: controller.getData(),
                        builder: (
                          BuildContext context,
                          AsyncSnapshot<dynamic> snapshot,
                        ) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Center(child: CircularProgressIndicator());
                          } else if (snapshot.connectionState ==
                              ConnectionState.done) {
                            if (snapshot.hasError) {
                              return Center(child: const Text('No Data'));
                            } else {
                              return Container(
                                child: controller.Data.length!=0? GridView.builder(
                                    scrollDirection: Axis.horizontal,
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      childAspectRatio: 3,
                                      mainAxisSpacing: Get.width * .08,
                                    ),
                                    itemCount: controller.Data.length,
                                    itemBuilder: (context, int) {
                                      return Container(
                                        child: Column(
                                          children: [
                                             SizedBox(height: Get.height*.04,),
                                            Container(
                                              decoration: BoxDecoration(
                                                  color: Colors.grey.shade400,
                                                  shape: BoxShape.circle),
                                              child: Padding(
                                                padding: const EdgeInsets.all(12),
                                                child:
                                                Center(
                                                    child: CircleAvatar(
                                                      backgroundColor: Colors.transparent,
                                                      backgroundImage: NetworkImage(
                                                          controller
                                                              .Data[int]
                                                              .categoryImage
                                                              .toString()),
                                                    )),
                                              ),
                                            ),
                                            SizedBox(
                                              height: Get.height * .05,
                                            ),
                                            Text(
                                              controller.Data[int].categoryName
                                                  .toString(),
                                              style: TextStyle(
                                                  fontSize: Get.height * .011,
                                                  fontWeight: FontWeight.w300),
                                            ),
                                          ],
                                        ),
                                      );
                                    }):Center(child: Text('No data'),),
                              );
                            }
                          }
                          return Container();
                        }),
                  )),
            ],
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          child: SizedBox(
            height: Get.height * .08,
            width: double.infinity,
            child: FittedBox(
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MaterialButton(
                      onPressed: () {},
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.home),
                          Text(
                            'My Note',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ),
                    MaterialButton(
                      onPressed: () {},
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.shopify),
                          Text(
                            'Offers',
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 12,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ),
                    MaterialButton(
                      onPressed: () {},
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.radar),
                          Text(
                            'Rewards',
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 12,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ),
                    MaterialButton(
                      onPressed: () {},
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.shopping_cart),
                          Text(
                            'Cart',
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 12,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ),
                    MaterialButton(
                      onPressed: () {},
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.person),
                          Text(
                            'profile',
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 12,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ),
                  ]),
            ),
          ),
        ));
  }
}
