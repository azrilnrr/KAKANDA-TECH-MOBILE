import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:kakanda_tech/constants/size.dart';
import 'package:kakanda_tech/model/category.dart';
import 'package:kakanda_tech/pages/login.dart';
import 'package:kakanda_tech/pages/progressScreen.dart';
import 'package:kakanda_tech/pages/progressScreenMobile.dart';
import 'package:kakanda_tech/pages/progressScreenSeo.dart';
import 'package:kakanda_tech/widgets/circleButton.dart';
import 'package:kakanda_tech/widgets/themes.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/services.dart';

import '../network/api.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<void> getToken() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    String token = localStorage.getString('token')!;
    print(token);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [Header(), Body()],
        ),
      ),
    );
  }
}

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
        ),
        GridView.builder(
          shrinkWrap: true,
          padding: const EdgeInsets.symmetric(
            horizontal: 22,
            vertical: 15,
          ),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.8,
            crossAxisSpacing: 20,
            mainAxisSpacing: 12,
          ),
          itemBuilder: (context, index) {
            return CategoryCard(
              category: categoryList[index],
            );
          },
          itemCount: categoryList.length,
        ),
      ],
    );
  }
}

class CategoryCard extends StatelessWidget {
  final Category category;
  const CategoryCard({
    Key? key,
    required this.category,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        if (category.name == 'Web Development') {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => ProgressScreen()));
        } else if (category.name == 'Mobile Development') {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => ProgressScrennMobile()));
        } else if (category.name == 'Seo Content Writer') {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => ProgressScrennSeo()));
        }
      },
      // onTap: () => Navigator.push(
      //   context,
      //   MaterialPageRoute(
      //     builder: (context) => ProgressScreen(),
      //   ),
      // ),
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.1),
              blurRadius: 4.0,
              spreadRadius: .05,
            ), //BoxShadow
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.center,
              child: Image.asset(
                category.thumbnail,
                height: kCategoryCardImageSize,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(category.name),
            // Text(
            //   "${category.noOfCourses.toString()} Project",
            //   style: Theme.of(context).textTheme.bodySmall,
            // ),
          ],
        ),
      ),
    );
  }
}

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
      height: 190,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
        gradient: LinearGradient(
          colors: [Colors.blue.shade900, Colors.blue],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Welcome to\nKakanda-Tech", style: titleHome),
            ],
          ),
          SizedBox(height: 5),
          TextButton(
            child: Text('Logout', style: buttonLogin),
            onPressed: () async {
              SharedPreferences localStorage =
                  await SharedPreferences.getInstance();
              localStorage.setBool("isLogin", false);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Login(),
                  ));
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(
                'Anda berhasil Logout Terima Kasih ^_^',
                style: snackbarHint,
              )));
            },
          ),
        ],
      ),
    );
  }
}




// class HomeScreen extends StatefulWidget {
//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.amberAccent,
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Text(
//               'Hello',
//               style: TextStyle(fontSize: 20),
//             ),
//             MaterialButton(
//               color: Colors.blue,
//               child: Text('logout'),
//               onPressed: () async {
//                 SharedPreferences localStorage =
//                     await SharedPreferences.getInstance();
//                 localStorage.setBool("isLogin", false);
//                 Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => Login(),
//                     ));
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
