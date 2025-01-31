import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zovo/shopowner/screen/presentation/add_items/add_menu_items/add_menu_items.dart';
import 'package:zovo/shopowner/screen/presentation/add_items/add_offer_items/add_offerItems.dart';
import 'package:zovo/shopowner/screen/presentation/add_items/todayoffersitem/add_todayoffers.dart';
import 'package:zovo/theme.dart';

void showPopup(BuildContext context) {
  showModalBottomSheet(
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      ),
    ),
    builder: (BuildContext context) {
      return Container(
        decoration: BoxDecoration(color: AppColors.secondaryCream,borderRadius: BorderRadius.circular(20)),
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min, // Make the sheet content compact
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Choose an action',
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColors.primaryOrange,
              ),
            ),
            const SizedBox(height: 12),
            ListTile(
              leading: const Icon(Icons.add, color: Colors.orange),
              title: Text('Add Today Offers', style: GoogleFonts.poppins()),
              onTap: () {

               Navigator.push(context, MaterialPageRoute(builder: (context)=> Todayoffers())) ;// Close the popup
                // Perform Add Item Action
              },
            ),
            ListTile(
               leading: const Icon(Icons.add, color: Colors.orange),
              title: Text('Add new offers', style: GoogleFonts.poppins()),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=> AddOfferItems())) ;// Close the popup
                // Perform Upload File Action
              },
            ),
            ListTile(
             leading: const Icon(Icons.add, color: Colors.orange),
              title: Text('Add new Items', style: GoogleFonts.poppins()),
              onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => AddMenuItem(),));
              },
            ),
            ListTile(
              leading: const Icon(Icons.close, color: Colors.redAccent),
              title: Text('Cancel', style: GoogleFonts.poppins()),
              onTap: () {
                Navigator.pop(context); // Close the popup
              },
            ),
          ],
        ),
      );
    },
  );
}
