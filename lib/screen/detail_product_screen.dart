import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lezazel_flutter/thema.dart';
import 'package:lottie/lottie.dart';


class DetailProductScreen extends StatefulWidget {
  const DetailProductScreen({super.key});

  @override
  State<DetailProductScreen> createState() => _DetailProductScreenState();
}

class _DetailProductScreenState extends State<DetailProductScreen> {

  bool isFavorite = false;
  void _toggleFavorite() {
    setState(() {
      isFavorite = !isFavorite;
      if (isFavorite) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            showCloseIcon: true,
            content: Text('You liked this product'),
            duration: Duration(seconds: 2),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            showCloseIcon: true,
            content: Text('You unliked this product'),
            duration: Duration(seconds: 2),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    return Scaffold(
      backgroundColor: backgroundColor,
      // floatingActionButton: Column(
      //   mainAxisAlignment: MainAxisAlignment.end,
      //   children: [
      //     FloatingActionButton(
      //       tooltip: 'Order',
      //       backgroundColor: const Color(0xff8E8D8B),
      //       onPressed: () {
      //         ScaffoldMessenger.of(context).showSnackBar(
      //           SnackBar(
      //             content: Text('You order this product'),
      //             action: SnackBarAction(
      //               label: 'View Cart',
      //               onPressed: () {
      //                 Navigator.pushNamed(context, '/cart');
      //               },
      //             ),
      //           ),
      //         );
      //       },
      //       child: const Icon(Icons.shopping_cart, color: Colors.black),
      //     ),
      //     const SizedBox(height: 16),
      //     FloatingActionButton(
      //       tooltip: 'Message',
      //       backgroundColor: const Color(0xff8E8D8B),
      //       onPressed: (){
      //         Navigator.pushNamed(context, '/message');
      //       },
      //       child: const Icon(Icons.message, color: Colors.black),
      //     ),
      //   ],
      // ),
      body: NestedScrollView(
          headerSliverBuilder: (context, isScrolled) {
            return [
              SliverAppBar(
                leading: IconButton(
                  icon:
                      const Icon(Icons.arrow_back_ios_new, color: Colors.white),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                actions: [
                  Container(
                    margin:  const EdgeInsets.symmetric(horizontal: 16),
                    child: GestureDetector(
                        onTap: _toggleFavorite,
                        child: Icon(isFavorite ? Icons.favorite : Icons.favorite_outline, color: const Color(0xffFEA300), size: 30,)),
                  ),
                ],
                backgroundColor: const Color(0xfffea300),
                pinned: true,
                expandedHeight: 300,
                flexibleSpace: FlexibleSpaceBar(
                  background: Image.asset(
                    'assets/images/detail_image.jpg',
                    fit: BoxFit.cover,
                  ),
                  title: const Text('Nama Product'),
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
                          const Icon(
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
                            fontSize: 16, fontWeight: FontWeight.w200),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Container(
                    margin: EdgeInsets.only(
                      top: defaultMargin,
                    ),
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(.20),
                          blurRadius: 10,
                          offset: const Offset(0, 10),
                        )
                      ],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Icon(Icons.fastfood_rounded,
                                color: Colors.black, size: 20),
                            Text(
                              'Food Details',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: medium,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        const Text(
                            'alham dulillahi robbil aalamiin, arrohmaanirrohiim maalikiyaumiddiin iyya kana\' budu waiyyakverv a nastaiin '),

                      ],
                    ),
                  ),

                  const SizedBox(height: 40,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/message');
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: const Color(0xff8E8D8B),
                            ),
                            color: const Color(0xff8E8D8B),
                          ),
                            padding: const EdgeInsets.all(
                              12,
                            ),
                            child: const Icon(Icons.message_rounded, color: Colors.black)
                        ),
                      ),

                      GestureDetector(
                        onTap: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: const Text('You order this product'),
                              action: SnackBarAction(
                                label: 'View Cart',
                                onPressed: () {
                                  Navigator.pushNamed(context, '/cart');
                                },
                              ),
                            ),
                          );
                        },
                        child: Container(
                          width: 300,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: const Color(0xffEEC27F),
                            ),
                            color: lezazelColor,
                          ),
                            padding: const EdgeInsets.all(
                              12,
                            ),
                            child: const Center(
                              child: Text('Add to cart', style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w300
                              ),
                              ),
                            )
                        ),
                      ),
                    ],
                  ),
                  Center(child: Lottie.asset('assets/jsons/check-out.json', width: 400)),

                ],
              ),
            ),
          )),
    );
  }


}

