import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lezazel_flutter/models/category_model.dart';


class CategoryProduct extends StatefulWidget {
  const CategoryProduct({super.key});

  @override
  State<CategoryProduct> createState() => _CategoryProductState();
}

class _CategoryProductState extends State<CategoryProduct> {
  var selectedCategory = 0;
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 46,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            setState(() {
              selectedCategory = index;
            });
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: selectedCategory == index
                  ? const Color(0xfffea300)
                  : const Color(0xffeeeeee),
              border: selectedCategory == index
                  ? Border.all(
                      color: const Color(0xfff1e5e5).withOpacity(.22), width: 2)
                  : null,
            ),
            child: Center(
              child: Text(
                Category.all()[index],
                style: GoogleFonts.manrope(
                  fontWeight: FontWeight.w800,
                  fontSize: 14,
                  color: selectedCategory == index
                      ? Colors.white
                      : const Color(0xff3f3e3f).withOpacity(.3),
                ),
              ),
            ),
          ),
        ),
        separatorBuilder: (context, index) => const SizedBox(width: 15),
        itemCount: Category.all().length,
      ),
    );
  }
}
