import 'package:flutter/material.dart';
import 'package:germaniatek_market/widgwts/cust_row_button.dart';

class Profileview extends StatefulWidget {
  const Profileview({super.key});

  @override
  State<Profileview> createState() => _ProfileviewState();
}

class _ProfileviewState extends State<Profileview> {
  get onToggleTheme => null;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: MediaQuery.sizeOf(context).height * .68,
        child: Card(
          margin: const EdgeInsets.all(18),
          color: Colors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              children: [
                const CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  child: Icon(
                    Icons.person,
                    // color: Colors.white,
                    size: 50,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Mohamed Sherif",
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Mohamed.sherif5233@gmail.com",
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                      fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomRowBut(
                  text: 'Edit Name',
                  icon: Icons.person,
                  onTap: () {
                    Navigator.pushNamed(context, "EditName");
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomRowBut(
                  text: "My Orders",
                  icon: Icons.shopping_basket,
                  onTap: () {
                    Navigator.pushNamed(context, "MyOrderView");
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomRowBut(
                  text: "Log Out",
                  icon: Icons.logout,
                  onTap: () async {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
/*
 const Center(
                child: CircularProgressIndicator(
                  color: AppColor.primaryColor,
                ),

*/
