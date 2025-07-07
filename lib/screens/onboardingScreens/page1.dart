import 'package:flutter/material.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xff2A4BA0),
      body: Padding(
        padding: EdgeInsets.only(left: 30, right: 30, top: 50, bottom: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Your holiday\nshopping\ndelivered to Screen",
              style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 30,
                  color: Colors.white),
            ),
            Row(
              children: [
                Text(
                  "one",
                  style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 30,
                      color: Colors.white),
                ),
                SizedBox(
                  width: 40,
                ),
                Icon(Icons.import_contacts)
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "There's something for everyone\nto enjoy with Sweet Shop\nFavourites Screen 1",
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                  color: Colors.white),
            ),
            SizedBox(
              height: 40,
            ),
            Center(
              child: Image(
                image: AssetImage("assets/images/purchase.png"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
