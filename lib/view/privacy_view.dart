import 'package:flutter/material.dart';

class PrivacyPolicyView extends StatelessWidget {
  const PrivacyPolicyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: NetworkImage('https://images.unsplash.com/photo-1478737270239-2f02b77fc618?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8cmFkaW98ZW58MHx8MHx8fDA%3D'),
            fit: BoxFit.cover,
          ),
        ),
        child: const Center(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Privacy Policy',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 20),
                Expanded(
                  child: SingleChildScrollView(
                    child: Text(
                      'Your privacy is important to us. It is our policy to respect your privacy and comply with any applicable law and regulation regarding any personal information we may collect about you, including across our website, and other sites we own and operate.'
                      '\n\nThis policy is effective as of 1 January 2024 and was last updated on 1 January 2024.'
                      '\n\nInformation We Collect'
                      '\n\nInformation we collect includes both information you knowingly and actively provide us when using or participating in any of our services and promotions, and any information automatically sent by your devices in the course of accessing our products and services.'
                      '\n\nLog Data'
                      '\n\nWhen you visit our website, our servers may automatically log the standard data provided by your web browser. It may include your device’s Internet Protocol (IP) address, your browser type and version, the pages you visit, the time and date of your visit, the time spent on each page, other details about your visit, and technical details that occur in conjunction with any errors you may encounter.'
                      '\n\nPlease be aware that while our website may contain links to other sites that are not operated by us, we cannot be responsible for their content, privacy policies, or practices.'
                      '\n\nWe will not share any personally identifying information publicly or with third parties, except when required to by law.'
                      '\n\nYour Rights and Controlling Your Personal Information'
                      '\n\nYou always retain the right to withhold personal information from us, with the understanding that your experience of our website may be affected. We will not discriminate against you for exercising any of your rights over your personal information. If you do provide us with personal information, you understand that we will collect, hold, use, and disclose it in accordance with this privacy policy.'
                      '\n\nIf you have any concerns or questions about how we handle your data and personal information, feel free to contact us.',
                      style: TextStyle(
                        fontSize: 16,
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
