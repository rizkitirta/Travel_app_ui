import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProfileScreen extends StatefulWidget {
  // const ProfileScreen({ Key? key }) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool showPassword = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text("Profile"),
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(16, 25, 16, 0),
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: ListView(
            children: [
              Text(
                "Edit Profile",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 15,
              ),
              Center(
                child: Stack(
                  children: [
                    Container(
                      width: 130,
                      height: 130,
                      decoration: BoxDecoration(
                          border: Border.all(
                              width: 4,
                              color: Theme.of(context).scaffoldBackgroundColor),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black26,
                              offset: Offset(0.0, 2.0),
                              blurRadius: 6.0,
                            )
                          ],
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: NetworkImage("https://picsum.photos/200"),
                              fit: BoxFit.cover)),
                    ),
                    Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                                color: Colors.blue,
                                shape: BoxShape.circle,
                                border: Border.all(
                                    width: 4,
                                    color: Theme.of(context)
                                        .scaffoldBackgroundColor)),
                            child: Icon(
                              Icons.edit,
                              size: 20,
                              color: Colors.white,
                            )))
                  ],
                ),
              ),
              SizedBox(
                height: 35,
              ),
              buildTextField("Full Name", "Rizki Tirta Buwono", false),
              buildTextField("Email", "tirta@mail.com", false),
              buildTextField("Password", "Password", true),
              buildTextField("Location", "Indonesian", false),
              SizedBox(
                height: 35,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                      child: Text("Cancel".toUpperCase(),
                          style:
                              TextStyle(fontSize: 14, color: Colors.grey[800])),
                      style: ButtonStyle(
                         padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.symmetric(horizontal: 40)),
                          foregroundColor:
                              MaterialStateProperty.all<Color>(Colors.white),
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.white),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      side: BorderSide(color: Colors.white)))),
                      onPressed: () => null),
                  ElevatedButton(
                      child: Text("Save".toUpperCase(),
                          style: TextStyle(fontSize: 14)),
                      style: ButtonStyle(
                         padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.symmetric(horizontal: 50)),
                          foregroundColor:
                              MaterialStateProperty.all<Color>(Colors.white),
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.blue),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      side: BorderSide(color: Colors.blue)))),
                      onPressed: () => null),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Padding buildTextField(String lable, String placeholder, bool isPasword) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 35),
      child: TextField(
        obscureText: isPasword ? showPassword : false,
        decoration: InputDecoration(
            suffixIcon: isPasword
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        showPassword = !showPassword;
                      });
                    },
                    icon: Icon(Icons.remove_red_eye))
                : null,
            contentPadding: EdgeInsets.only(bottom: 3),
            labelText: lable,
            hintText: placeholder,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            hintStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
      ),
    );
  }
}
