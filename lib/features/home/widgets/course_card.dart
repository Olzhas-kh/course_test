import 'package:cource_test/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class CourceCard extends StatelessWidget {
  final String title;
  final String price;
  final String image;
  final void Function()? onTap;
  const CourceCard({
    super.key, required this.title, required this.price, required this.image, this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color:
                  Colors.grey.withOpacity(0.5), 
              spreadRadius: 2, 
              blurRadius: 5,
              offset:const Offset(
                  0, 3), 
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 200,
              height: 120,
              decoration: BoxDecoration(
                borderRadius:const BorderRadius.all(Radius.circular(8)),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(image,))
              ),
            ),
             Padding(
               padding: const EdgeInsets.symmetric(horizontal:  8.0),
               child: Text(title),
             ),
             Padding(
               padding: const EdgeInsets.symmetric(horizontal:  8.0),
               child: Text("$price ₸"),
             ),
          ],)
      ),
    );
  }
}
