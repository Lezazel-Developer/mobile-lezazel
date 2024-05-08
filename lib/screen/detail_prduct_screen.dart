import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lezazel_flutter/thema.dart';

class DetailProductScreen extends StatelessWidget {

  const DetailProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    return Scaffold(
      backgroundColor: backgroundColor,
      floatingActionButton: FloatingActionButton(
        tooltip: 'Order',
        backgroundColor: buttonColor,
        onPressed: () {
          Navigator.pushNamed(context, '/cart');
        },
        child: const Icon(Icons.shopping_cart, color: Colors.white),
      ),
      body: NestedScrollView(
          headerSliverBuilder: (context, isScrolled) {
            return [
              SliverAppBar(
                leading: IconButton(
                  icon: const Icon(Icons.arrow_back_ios_new),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                backgroundColor: Color(0xfffea300),
                pinned: true,
                expandedHeight: 270,
                flexibleSpace: FlexibleSpaceBar(
                  background: Image.asset(
                    'assets/images/detail_image.jpg',
                    fit: BoxFit.cover,
                  ),
                  title: const Text('Lezazel'),
                  titlePadding: const EdgeInsets.only(left: 16, bottom: 16),
                ),
              )
            ];
          },
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.money_outlined,
                            color: Colors.black,
                          ),
                          const SizedBox(width: 10),
                          Text(
                            'Rp. 100.000',
                            style: Theme.of(context).textTheme.headlineMedium,
                          ),
                        ],
                      ),


                      Text(
                        'Stock : 86',
                        style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w200
                        ),
                      ),

                    ],
                  ),
                  const SizedBox(height: 50),
                  Container(
                    decoration: BoxDecoration(
                      color: altColor,
                      borderRadius: BorderRadius.circular(10.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: const Offset(0, 3), // changes position of shadow
                        ),
                      ]
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(Icons.question_answer, color: Colors.black),
                          SizedBox(width: 8),
                          Expanded(
                            child: Text(maxLines: 6,
                              'Talk time (3g/WCDMA): up to 26 hou nVideo playbacInternet use time (Wi-Fi): up to 13 hoursk: up to 13 hoursrs Fast charging: Fast charging: up to 7 hours of use from only 15 minutes of charging up to 7 hours of use from only 15 minutes of charging',
                              style: GoogleFonts.poppins(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w300
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )

                  // Table(
                  //   columnWidths: const {1: FractionColumnWidth(0.7)},
                  //   children: const [
                  //     TableRow(
                  //         children: [
                  //           Icon(Icons.question_answer),
                  //           Padding(
                  //             padding: EdgeInsets.symmetric(vertical: 4),
                  //             child: Text('Talk time (3g/WCDMA): up to 26 hours\nInternet use time (Wi-Fi): up to 13 hours\nInternet use time (LTE): up to 13 hours\nVideo playback: up to 13 hours\nAudio playback (via headset): up to 110 hours\nFast charging: up to 7 hours of use from only 15 minutes of charging'),
                  //           ),
                  //         ]
                  //     ),
                  //
                  //   ],
                  // ),

                  // SizedBox(
                  //     width: double.infinity,
                  //     child: ElevatedButton(
                  //       style: ElevatedButton.styleFrom(
                  //         backgroundColor: Theme.of(context).primaryColorLight,
                  //         foregroundColor: Colors.white,
                  //         shape: const BeveledRectangleBorder(
                  //           borderRadius: BorderRadius.all(
                  //             Radius.circular(8),
                  //           ),
                  //         ),
                  //       ),
                  //       onPressed: () {
                  //         ScaffoldMessenger.of(context).showSnackBar(
                  //           const SnackBar(
                  //             content: Text('Added to Cart'),
                  //           ),
                  //         );
                  //       },
                  //       child: const Text('Beli'),
                  //
                  //     )
                  // ),
                ],
              ),
            ),
          )),
    );
  }
}
