// import 'package:fish_tutor/src/constants/ui_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/ui_colors.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  State<UserProfile> createState() => _UserProfile();
}

class _UserProfile extends State<UserProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.lightBlue,
        title: const Center(
          child: Text(
            'Profile',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        leading: IconButton(
          icon: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            child: const Center(
              child: Icon(Icons.arrow_back_ios),
            ),
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: [
          IconButton(
            icon: CircleAvatar(
              backgroundColor: Colors.white,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Icon(
                  Icons.shopping_bag_rounded,
                  color: Colors.black,
                ),
              ),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
      backgroundColor: AppColor.lightBlue,
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              CircleAvatar(
                  radius: 70,
                  child: Image.asset(
                    "assets/images/imgshop1.png",
                    fit: BoxFit.cover,
                  )),
              const SizedBox(height: 20),
              const Text(
                "Name",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 40),
              Container(
                width: MediaQuery.of(context).size.width * 0.999,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Colors.grey[100],
                  border: Border.all(color: AppColor.grey, width: 1),
                ),
                child: Column(
                  children: [
                    ListTile(
                      leading: const Icon(
                        Icons.person,
                        color: Colors.black,
                      ),
                      title: const Text("Edit Profile"),
                      trailing: const Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.black,
                      ),
                      onTap: () {},
                    ),
                    const Divider(
                      color: AppColor.grey,
                      height: 10,
                      indent: 30,
                      endIndent: 30,
                    ),
                    ListTile(
                      leading: const Icon(
                        Icons.map,
                        color: Colors.black,
                      ),
                      title: const Text("Shipping Address"),
                      trailing: const Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.black,
                      ),
                      onTap: () {},
                    ),
                    const Divider(
                      color: AppColor.grey,
                      height: 10,
                      indent: 30,
                      endIndent: 30,
                    ),
                    ListTile(
                      leading: const Icon(
                        Icons.favorite,
                        color: Colors.black,
                      ),
                      title: const Text("Wishlist"),
                      trailing: const Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.black,
                      ),
                      onTap: () {},
                    ),
                    const Divider(
                      color: AppColor.grey,
                      height: 10,
                      indent: 30,
                      endIndent: 30,
                    ),
                    ListTile(
                      leading: const Icon(
                        Icons.history,
                        color: Colors.black,
                      ),
                      title: const Text("Order History"),
                      trailing: const Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.black,
                      ),
                      onTap: () {},
                    ),
                    const Divider(
                      color: AppColor.grey,
                      height: 10,
                      indent: 30,
                      endIndent: 30,
                    ),
                    ListTile(
                      leading: const Icon(
                        Icons.notifications_active_sharp,
                        color: Colors.black,
                      ),
                      title: const Text("Notifications"),
                      trailing: const Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.black,
                      ),
                      onTap: () {},
                    ),
                    const Divider(
                      color: AppColor.grey,
                      height: 10,
                      indent: 30,
                      endIndent: 30,
                    ),
                    ListTile(
                      leading: const Icon(
                        Icons.credit_card_sharp,
                        color: Colors.black,
                      ),
                      title: const Text("Cards"),
                      trailing: const Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.black,
                      ),
                      onTap: () {},
                    ),
                    const Divider(
                      color: AppColor.grey,
                      height: 10,
                      indent: 30,
                      endIndent: 30,
                    ),
                    ListTile(
                      leading: const Icon(
                        Icons.credit_card_rounded,
                        color: Colors.black,
                      ),
                      title: const Text("Your Consultancies"),
                      trailing: const Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.black,
                      ),
                      onTap: () {},
                    ),
                    const Divider(
                      color: AppColor.grey,
                      height: 10,
                      indent: 30,
                      endIndent: 30,
                    ),
                    ListTile(
                      leading: const Icon(
                        Icons.credit_card_rounded,
                        color: Colors.black,
                      ),
                      title: const Text("Your Courses"),
                      trailing: const Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.black,
                      ),
                      onTap: () {},
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
