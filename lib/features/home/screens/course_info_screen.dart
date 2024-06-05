import 'package:cource_test/core/custom/custom_button.dart';
import 'package:cource_test/core/extensions/num_extension.dart';
import 'package:cource_test/features/basket/models/basket_model.dart';
import 'package:cource_test/features/basket/provider/basket_provider.dart';
import 'package:cource_test/features/basket/screens/basket_screen.dart';
import 'package:cource_test/features/home/screens/course_pay_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CourseInfo extends StatelessWidget {
  final String image;
  final String title;
  final String price;
  final String description;
  const CourseInfo(
      {super.key,
      required this.image,
      required this.title,
      required this.price,
      required this.description});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Info",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const BasketScreen()),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 400,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                        image,
                      )),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 20),
                      child: Text(
                        title,
                        style: const TextStyle(
                            fontSize: 28, fontWeight: FontWeight.w700),
                      ),
                    ),
                  ],
                ),
              ),
              20.height,
              Row(
                children: [
                  Text("$price ₸"),
                  const Spacer(),
                  IconButton(
                    icon: const Icon(Icons.add_shopping_cart),
                    onPressed: () {
                      Provider.of<CartProvider>(context, listen: false).addItem(
                        CartItem(
                          image: image,
                          title: title,
                          price: price,
                          description: description,
                        ),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Added to cart')),
                      );
                    },
                  ),
                ],
              ),
              10.height,
              Text(description),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: CustomButton(
          text: "Pay",
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const CoursePayScreen()),
            );
          },
          color: Colors.black,
        ),
      ),
    );
  }
}
