import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:fyfe/utils/controllers.dart';
import 'package:fyfe/utils/text_util.dart';
import 'package:fyfe/utils/textformfield.dart';

class ShowProperties extends StatefulWidget {
  final beds;
  final bathrooms;
  final carparks;
  final loanamount;
  final propertyValue;
  final images;
  final purchasedate;
  final propertyPrice;
  final rent;
  final leaseStart;
  final propertyType;
  final agent;
  final leaseend;
  final insure;
  final policyend;
  final propertyAddress;
  final policystart;
  const ShowProperties({
    super.key,
    required this.bathrooms,
    required this.beds,
    required this.carparks,
    required this.loanamount,
    required this.propertyAddress,
    required this.images,
    required this.propertyPrice,
    required this.agent,
    required this.insure,
    required this.leaseStart,
    required this.leaseend,
    required this.policyend,
    required this.policystart,
    required this.propertyValue,
    required this.purchasedate,
    required this.rent,
    required this.propertyType,
  });

  @override
  State<ShowProperties> createState() => _ShowPropertiesState();
}

class _ShowPropertiesState extends State<ShowProperties> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white),
          centerTitle: true,
          backgroundColor: const Color(
            0xff3AC1CD,
          ),
          elevation: 0,
          title: const Text(
            "Property Details",
            style: const TextStyle(
                color: Colors.white,
                fontFamily: "Nunito",
                fontSize: 16,
                fontWeight: FontWeight.w600),
          ),
        ),
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
                          child: GridView.builder(
                              shrinkWrap: true,
                              physics: ClampingScrollPhysics(),
                              itemCount: widget.images!.length,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 3),
                              itemBuilder: (context, index) {
                                return Card(
                                    child: Container(
                                  height: 120,
                                  width: MediaQuery.of(context).size.width,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: Image.network(
                                      widget.images![index],
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ));
                              })),
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
                                      TextUtilProperty(
                                        title: widget.propertyAddress,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 4),
                                        child: TextUtilProperty(
                                          title: widget.propertyType,
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
                                  widget.beds,
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
                                  widget.bathrooms,
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
                                  widget.carparks,
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
                                          Text(
                                            "\$${widget.propertyValue}",
                                            style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.white,
                                            ),
                                          ),
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
                                          Text(
                                            "\$${widget.propertyPrice}",
                                            style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.white,
                                            ),
                                          ),
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
                                          TextUtil(
                                              title:
                                                  "\$${widget.loanamount.toString()}"),
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
                                          TextUtil(
                                            title: widget.purchasedate,
                                          )
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
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 10),
                                            child: TextUtil(
                                              title: "Rent",
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 7,
                                          ),
                                          TextFormInputField(
                                            controller: rentController,
                                            hintText: widget.rent.toString(),
                                            textInputType: TextInputType.text,
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
                                        TextFormInputField(
                                          controller: leaseStartDateController,
                                          hintText: widget.leaseStart,
                                          textInputType: TextInputType.datetime,
                                        ),
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
                                          TextFormInputField(
                                            controller: agentController,
                                            hintText: widget.agent,
                                            textInputType: TextInputType.text,
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
                                        TextFormInputField(
                                          controller: leaseStartDateend,
                                          hintText: widget.leaseend,
                                          textInputType: TextInputType.text,
                                        ),
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
                                          TextFormInputField(
                                            controller: insuranceNameController,
                                            hintText: widget.insure,
                                            textInputType: TextInputType.text,
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
                                        TextFormInputField(
                                          controller: policyStartController,
                                          hintText: widget.policystart,
                                          textInputType: TextInputType.text,
                                        ),
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
                                          TextFormInputField(
                                            controller: insuranceNameController,
                                            hintText: widget.insure,
                                            textInputType: TextInputType.text,
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
                                            "Policy End",
                                            style: TextStyle(
                                                fontFamily: 'Roboto',
                                                color: Colors.white),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 7,
                                        ),
                                        TextFormInputField(
                                          controller: policyEndController,
                                          hintText: widget.policyend,
                                          textInputType: TextInputType.text,
                                        ),
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
