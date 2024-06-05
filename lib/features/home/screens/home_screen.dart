import 'package:cource_test/features/home/screens/course_info_screen.dart';
import 'package:cource_test/features/home/widgets/course_card.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Map<String, String>> cources = [
    {
      "title": "Mobile",
      "description":
          "Learn about mobile app development. This course covers both iOS and Android development, providing a comprehensive guide to building powerful mobile applications.",
      "image":
          "https://cdn.elearningindustry.com/wp-content/uploads/2020/08/5-ways-to-improve-your-course-cover-design-1024x575.png",
      "price": "10 000tg"
    },
    {
      "title": "Flutter",
      "description":
          "Master Flutter for cross-platform apps. This course dives deep into Dart and Flutter to help you build stunning and high-performance mobile applications for both Android and iOS platforms.",
      "image":
          "https://www.itnext.in/sites/default/files/styles/article_image/public/ITN_September-October-2021-Cover-Story-Theme-Image---Without-Headline--750x500.jpg?itok=hr0Wvz4b",
      "price": "15 000tg"
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            "Cources",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10.0,
                      mainAxisSpacing: 10.0,
                    ),
                    itemCount: cources.length,
                    itemBuilder: (BuildContext context, int index) {
                      return CourceCard(
                        onTap: () => Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => CourseInfo(
                              image: cources[index]["image"] ?? '',
                              title: cources[index]["title"] ?? '',
                              price: cources[index]["price"] ?? '',
                              description: cources[index]["description"] ?? '',
                            ),
                          ),
                        ),
                        title: cources[index]["title"] ?? '',
                        price: cources[index]["price"] ?? '',
                        image: cources[index]["image"] ?? '',
                      );
                    },
                    padding: const EdgeInsets.all(10.0),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
