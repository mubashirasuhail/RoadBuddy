import 'package:flutter/material.dart';

class AboutRoadBuddyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About Road Buddy'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome to Road Buddy, your ultimate solution for when you\'re stuck on the road!',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16.0),
            Text(
              'Who We Are',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              'At Road Buddy, we understand the challenges and frustrations that can arise when you\'re on the road, whether it\'s a flat tire, a dead battery, or simply finding your way. We\'re a dedicated team committed to making your journey safer, smoother, and more enjoyable.',
            ),
            SizedBox(height: 16.0),
            Text(
              'Our Mission',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              'Our mission is to be your reliable partner in every journey, offering a range of essential services and tools to keep you moving. We\'re here to get you back on the road, provide peace of mind, and make your travel experiences memorable.',
            ),
            SizedBox(height: 16.0),
            Text(
              'What We Offer',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              'Emergency Services: When you\'re in a jam, we\'re just a tap away. From towing to battery jumpstarts, and even sand pullouts, we\'ve got you covered.\n\nService Locator: Quickly find the nearest service stations, taxi stands, and restaurants for your convenience.\n\nVehicle Management: Store important vehicle and insurance details in one secure place for easy access when needed.\n\nCommunity Support: Connect with fellow travelers, share experiences, and access valuable tips and advice for your journey.',
            ),
            SizedBox(height: 16.0),
            Text(
              'Why Choose Road Buddy?',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              'Reliability: Count on us to be there when you need it most, no matter where you are.\n\nSafety: Your safety and peace of mind are our top priorities.\n\nConvenience: We offer a one-stop solution for all your road travel needs.',
            ),
            SizedBox(height: 16.0),
            Text(
              'Contact Us',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              'Have questions, feedback, or need assistance? Our support team is available around the clock to assist you.\n\nEmail: support@roadbuddyapp.com\nPhone: [+91 9207696851]',
            ),
            SizedBox(height: 16.0),
            /* Text(
              'Follow Us',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              'Stay connected with us on social media:\n[Link to your Facebook page]\n[Link to your Twitter account]\n[Link to your Instagram account]',
            ),
            SizedBox(height: 16.0),*/
            Text(
              'Thank you for choosing Road Buddy to be your trusted road companion. We\'re here to make sure your journey is smooth, safe, and hassle-free.',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
