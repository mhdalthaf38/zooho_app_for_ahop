import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zovo/shopowner/screen/presentation/mainscreen/mainscreen.dart';
import 'package:zovo/shopowner/screen/presentation/sign_in/signUp_page.dart';
import 'package:zovo/theme.dart';



class SignInScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Fetching screen height and width dynamically
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColors.primaryOrange, // Background color
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: AppColors.secondaryCream),
          onPressed: () => Navigator.pop(context),
        ),
       
      ),
      body: Stack(
        children: [
          // Top Text Section
          Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: screenHeight * 0.03), // Responsive spacing
                Text(
                  "Sign In",
                  style: GoogleFonts.poppins(
                    color: AppColors.secondaryCream,
                   fontSize: screenWidth * 0.08, 
                     fontWeight: FontWeight.w900
                  )
                ),
                SizedBox(height: screenHeight * 0.01),
                Text(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do tempor",
                  style: GoogleFonts.poppins(
                    color: AppColors.secondaryCream,
                    fontSize: screenWidth * 0.04,
                  )
                ),
              ],
            ),
          ),

          // Bottom Card Section
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.all(screenWidth * 0.05),
              decoration: BoxDecoration(
                color: AppColors.secondaryCream,
                borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
              ),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Username Field
                    TextField(
                      decoration: InputDecoration(
                         focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(
                          color: AppColors.primaryOrange),
                      ),
                        focusColor: AppColors.primaryOrange,
                        floatingLabelStyle: TextStyle(color: AppColors.primaryOrange),
                        labelText: 'Username',
                        labelStyle: TextStyle(fontSize: screenWidth * 0.045), // Responsive font
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        filled: true,
                        fillColor: AppColors.secondaryCream
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.02),

                    // Password Field
                    TextField(
                      
                      obscureText: true,
                      decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(
                          color: AppColors.primaryOrange),
                      ),
                        focusColor: AppColors.primaryOrange,
                        floatingLabelStyle: TextStyle(color: AppColors.primaryOrange), // Responsive font,
                        labelText: 'Password',
                        labelStyle: TextStyle(fontSize: screenWidth * 0.045), // Responsive font
                        border: OutlineInputBorder(
                          
                          borderRadius: BorderRadius.circular(15),
                        ),
                        filled: true,
                        fillColor: AppColors.secondaryCream,
                      ),
                    ),

                    // Forgot Password
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {},
                        child: Text(
                          "Forgot Password?",
                          style: GoogleFonts.poppins(
                            color: AppColors.accentRed,
                           fontSize: screenWidth * 0.035, // Responsive font
                          )
                        ),
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.03),

                    // Sign-In Button
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primaryOrange,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        padding: EdgeInsets.symmetric(
                          vertical: screenHeight * 0.02, // Responsive padding
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => MainPage()),
                        );
                      },
                      child: Text(
                        "Sign In",
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w900,
                            color: AppColors.secondaryCream,
                           fontSize: screenWidth * 0.045, // Responsive font
                          ), // Responsive font
                      ),
                    ),

                    SizedBox(height: screenHeight * 0.02),

                    // Google and Facebook Buttons
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: OutlinedButton.icon(
                            style: OutlinedButton.styleFrom(
                              padding: EdgeInsets.symmetric(
                                vertical: screenHeight * 0.015, // Responsive padding
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                            icon: Image.asset(
                              'assets/images/google.webp',
                              width: screenWidth * 0.055, // Responsive width
                         
                            ),
                            label: Text(
                              "Google",
                              style: TextStyle(fontSize: screenWidth * 0.04), // Responsive font
                            ),
                            onPressed: () {},
                          ),
                        ),
                        SizedBox(width: screenWidth * 0.02),
                        Expanded(
                          child: OutlinedButton.icon(
                            style: OutlinedButton.styleFrom(
                              padding: EdgeInsets.symmetric(
                                vertical: screenHeight * 0.015, // Responsive padding
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                         
                            label: Text(
                              "Sign Up",
                              style: TextStyle(fontSize: screenWidth * 0.04), // Responsive font
                            ),
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder:(context) => SignUpScreen()));
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
