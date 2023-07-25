import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:fyfe/utils/controllers.dart';
import 'package:fyfe/widgets/palette.dart';

class ShowProperties extends StatefulWidget {
  const ShowProperties({super.key});

  @override
  State<ShowProperties> createState() => _ShowPropertiesState();
}

class _ShowPropertiesState extends State<ShowProperties> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: SafeArea(
          child: Container(
              decoration: const BoxDecoration(
                gradient: RadialGradient(colors: [
                  Color(
                    0xff3AC1CD,
                  ),
                  Color(
                    0xff3AC1CD,
                  ),
                  Color(
                    0xff3AADC6,
                  ),
                  Color(
                    0xff395CAA,
                  )
                ], radius: 1.8, center: Alignment.topCenter),
              ),
              child: Column(
                children: [
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                          decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(74))),
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          child: CarouselSlider(
                            options: CarouselOptions(height: 400.0),
                            items: [1, 2, 3, 4, 5].map((i) {
                              return Builder(
                                builder: (BuildContext context) {
                                  return Container(
                                      width: MediaQuery.of(context).size.width,
                                      margin:
                                          EdgeInsets.symmetric(horizontal: 5.0),
                                      decoration:
                                          BoxDecoration(color: Colors.amber),
                                      child: Text(
                                        'text $i',
                                        style: TextStyle(fontSize: 16.0),
                                      ));
                                },
                              );
                            }).toList(),
                          )),
                      Positioned.fill(
                        bottom: -25,
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(25.5),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black.withOpacity(0.25),
                                      offset: const Offset(0, 5),
                                      blurRadius: 4)
                                ]),
                            padding: const EdgeInsets.fromLTRB(21, 11, 25, 10),
                            margin: const EdgeInsets.only(left: 33, right: 39),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Property Address",
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.w600,
                                            color: Palette.blue),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 4),
                                        child: Text(
                                          "PropertyType",
                                          style: const TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 8,
                                              color: Palette.blue),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                SvgPicture.asset("assets/bed.svg"),
                                SizedBox(
                                  width: 4,
                                ),
                                Text(
                                  "Beds",
                                  style: TextStyle(
                                      color: Color(0xffC5C5C5),
                                      fontSize: 10,
                                      fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  " | ",
                                  style: TextStyle(
                                      color: Color(0xffB1B1B1),
                                      fontWeight: FontWeight.w300),
                                ),
                                SvgPicture.asset("assets/bath.svg"),
                                SizedBox(
                                  width: 4,
                                ),
                                Text(
                                  "Bathrooms",
                                  style: TextStyle(
                                      color: Color(0xffC5C5C5),
                                      fontSize: 10,
                                      fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  " | ",
                                  style: TextStyle(
                                      color: Color(0xffB1B1B1),
                                      fontWeight: FontWeight.w300),
                                ),
                                SvgPicture.asset("assets/car.svg"),
                                SizedBox(
                                  width: 4,
                                ),
                                Text(
                                  "Car Parks",
                                  style: TextStyle(
                                      color: Color(0xffC5C5C5),
                                      fontSize: 10,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 35),
                    child: TabBar(
                      indicatorColor: Colors.white,
                      indicatorWeight: 1,
                      tabs: [
                        Tab(
                          text: "Summary",
                        ),
                        Tab(text: "Maintenance"),
                      ],
                    ),
                  ),
                  Expanded(
                    child: TabBarView(
                      children: [
                        SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(0, 38, 0, 25),
                            child: Column(
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(48, 0, 61, 0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            "Value",
                                            style: TextStyle(
                                              fontSize: 10,
                                              fontWeight: FontWeight.w600,
                                              color: Color(0xffD3D3D3),
                                            ),
                                          ),
                                          // Text(
                                          //   "\$${controller.detailsModel.value}",
                                          //   style: const TextStyle(
                                          //     fontSize: 16,
                                          //     fontWeight: FontWeight.w600,
                                          //     color: Colors.white,
                                          //   ),
                                          // ),
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            "Purchase price",
                                            style: TextStyle(
                                              fontSize: 10,
                                              fontWeight: FontWeight.w600,
                                              color: Color(0xffD3D3D3),
                                            ),
                                          ),
                                          // Text(
                                          //   "\$${controller.detailsModel.purchasePrice}",
                                          //   style: const TextStyle(
                                          //     fontSize: 16,
                                          //     fontWeight: FontWeight.w600,
                                          //     color: Colors.white,
                                          //   ),
                                          // ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(48, 0, 61, 0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            "Loan",
                                            style: TextStyle(
                                              fontSize: 10,
                                              fontWeight: FontWeight.w600,
                                              color: Color(0xffD3D3D3),
                                            ),
                                          ),
                                          // Text(
                                          //   "\$${controller.detailsModel.loan}",
                                          //   style: const TextStyle(
                                          //     fontSize: 16,
                                          //     fontWeight: FontWeight.w600,
                                          //     color: Colors.white,
                                          //   ),
                                          // ),
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            "Purchase date",
                                            style: TextStyle(
                                              fontSize: 10,
                                              fontWeight: FontWeight.w600,
                                              color: Color(0xffD3D3D3),
                                            ),
                                          ),
                                          // Text(
                                          //   controller
                                          //       .detailsModel.purchaseDate,
                                          //   style: const TextStyle(
                                          //     fontSize: 16,
                                          //     fontWeight: FontWeight.w600,
                                          //     color: Colors.white,
                                          //   ),
                                          // ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(24, 34, 30, 34),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 10),
                                            child: Text(
                                              "Rent",
                                              style: TextStyle(
                                                  fontFamily: 'Roboto',
                                                  color: Colors.white),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 7,
                                          ),
                                          TextFormField(
                                            //  rentController.text,
                                            decoration: InputDecoration(
                                              enabled: false,
                                              fillColor:
                                                  const Color(0xffEEEEEE),
                                              filled: true,
                                              hintText: "Rent",
                                              hintStyle: const TextStyle(
                                                  color: Color(0xffB3B3B3),
                                                  fontFamily: 'Roboto'),
                                              contentPadding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 9.5,
                                                      horizontal: 10),
                                              border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(3),
                                                  borderSide: BorderSide.none),
                                              // suffixIcon: const Icon(
                                              //     Icons.arrow_drop_down)
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 23,
                                    ),
                                    Expanded(
                                        child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 10),
                                          child: Text(
                                            "Lease Start",
                                            style: TextStyle(
                                                fontFamily: 'Roboto',
                                                color: Colors.white),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 7,
                                        ),
                                        // GestureDetector(

                                        TextFormField(
                                          // controller:
                                          //     controller.leaseStartController,
                                          decoration: InputDecoration(
                                            enabled: false,
                                            fillColor: const Color(0xffEEEEEE),
                                            filled: true,
                                            hintText: "01/01/2022",
                                            hintStyle: const TextStyle(
                                                color: Color(0xffB3B3B3),
                                                fontFamily: 'Roboto'),
                                            contentPadding:
                                                const EdgeInsets.symmetric(
                                                    vertical: 9.5,
                                                    horizontal: 10),
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(3),
                                                borderSide: BorderSide.none),
                                            // suffixIcon: const Icon(
                                            //     Icons.arrow_drop_down)
                                          ),
                                        ),
                                        // )
                                      ],
                                    ))
                                  ],
                                ),
                                const SizedBox(
                                  height: 12,
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 10),
                                            child: Text(
                                              "Agent",
                                              style: TextStyle(
                                                  fontFamily: 'Roboto',
                                                  color: Colors.white),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 7,
                                          ),
                                          TextFormField(
                                            // controller:
                                            //     controller.agentController,
                                            decoration: InputDecoration(
                                              enabled: false,
                                              fillColor:
                                                  const Color(0xffEEEEEE),
                                              filled: true,
                                              hintText: "Agent",
                                              hintStyle: const TextStyle(
                                                  color: Color(0xffB3B3B3),
                                                  fontFamily: 'Roboto'),
                                              contentPadding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 9.5,
                                                      horizontal: 10),
                                              border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(3),
                                                  borderSide: BorderSide.none),
                                              // suffixIcon: const Icon(
                                              //     Icons.arrow_drop_down)
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 23,
                                    ),
                                    Expanded(
                                        child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 10),
                                          child: Text(
                                            "Lease End",
                                            style: TextStyle(
                                                fontFamily: 'Roboto',
                                                color: Colors.white),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 7,
                                        ),

                                        TextFormField(
                                          // controller:
                                          //     controller.leaseEndController,
                                          decoration: InputDecoration(
                                            enabled: false,
                                            fillColor: const Color(0xffEEEEEE),
                                            filled: true,
                                            hintText: "01/01/2022",
                                            hintStyle: const TextStyle(
                                                color: Color(0xffB3B3B3),
                                                fontFamily: 'Roboto'),
                                            contentPadding:
                                                const EdgeInsets.symmetric(
                                                    vertical: 9.5,
                                                    horizontal: 10),
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(3),
                                                borderSide: BorderSide.none),
                                            // suffixIcon: const Icon(
                                            //     Icons.arrow_drop_down),
                                          ),
                                        ),
                                        // )
                                      ],
                                    ))
                                  ],
                                ),
                                const SizedBox(
                                  height: 12,
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 10),
                                            child: Text(
                                              "Insurer",
                                              style: TextStyle(
                                                  fontFamily: 'Roboto',
                                                  color: Colors.white),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 7,
                                          ),
                                          TextFormField(
                                            // controller:
                                            //     controller.insurerController,
                                            decoration: InputDecoration(
                                              enabled: false,
                                              fillColor:
                                                  const Color(0xffEEEEEE),
                                              filled: true,
                                              hintText: "Insurer",
                                              hintStyle: const TextStyle(
                                                  color: Color(0xffB3B3B3),
                                                  fontFamily: 'Roboto'),
                                              contentPadding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 9.5,
                                                      horizontal: 10),
                                              border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(3),
                                                  borderSide: BorderSide.none),
                                              // suffixIcon: const Icon(
                                              //     Icons.arrow_drop_down)
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 23,
                                    ),
                                    Expanded(
                                        child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 10),
                                          child: Text(
                                            "Policy Start",
                                            style: TextStyle(
                                                fontFamily: 'Roboto',
                                                color: Colors.white),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 7,
                                        ),

                                        TextFormField(
                                          // controller:
                                          //     controller.policyStartController,
                                          decoration: InputDecoration(
                                            enabled: false,
                                            fillColor: const Color(0xffEEEEEE),
                                            filled: true,
                                            hintText: "01/01/2022",
                                            hintStyle: const TextStyle(
                                                color: Color(0xffB3B3B3),
                                                fontFamily: 'Roboto'),
                                            contentPadding:
                                                const EdgeInsets.symmetric(
                                                    vertical: 9.5,
                                                    horizontal: 10),
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(3),
                                                borderSide: BorderSide.none),
                                            // suffixIcon: const Icon(
                                            //     Icons.arrow_drop_down)
                                          ),
                                        ),
                                        // )
                                      ],
                                    ))
                                  ],
                                ),
                                const SizedBox(
                                  height: 12,
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 10),
                                            child: Text(
                                              "Insurance Policy",
                                              style: TextStyle(
                                                  fontFamily: 'Roboto',
                                                  color: Colors.white),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 7,
                                          ),
                                          TextFormField(
                                            // controller: controller
                                            //     .insurancePolicyController,
                                            decoration: InputDecoration(
                                              fillColor:
                                                  const Color(0xffEEEEEE),
                                              filled: true,
                                              enabled: false,
                                              hintText: "PA1023241",
                                              hintStyle: const TextStyle(
                                                  color: Color(0xffB3B3B3),
                                                  fontFamily: 'Roboto'),
                                              contentPadding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 9.5,
                                                      horizontal: 10),
                                              border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(3),
                                                  borderSide: BorderSide.none),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 23,
                                    ),
                                    Expanded(
                                        child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 10),
                                          child: Text(
                                            "Policy End",
                                            style: TextStyle(
                                                fontFamily: 'Roboto',
                                                color: Colors.white),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 7,
                                        ),

                                        TextFormField(
                                          // controller:
                                          //     controller.policyEndController,
                                          decoration: InputDecoration(
                                            enabled: false,
                                            fillColor: const Color(0xffEEEEEE),
                                            filled: true,
                                            hintText: "01/01/2022",
                                            hintStyle: const TextStyle(
                                                color: Color(0xffB3B3B3),
                                                fontFamily: 'Roboto'),
                                            contentPadding:
                                                const EdgeInsets.symmetric(
                                                    vertical: 9.5,
                                                    horizontal: 10),
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(3),
                                                borderSide: BorderSide.none),
                                            // suffixIcon: const Icon(
                                            //     Icons.arrow_drop_down),
                                          ),
                                        ),
                                        // )
                                      ],
                                    ))
                                  ],
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
