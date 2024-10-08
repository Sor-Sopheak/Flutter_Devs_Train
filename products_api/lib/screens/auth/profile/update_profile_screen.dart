import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:products_api/constants/color_constants.dart';
import 'package:products_api/models/user.dart';

class UpdateProfileScreen extends StatefulWidget {
  final User
      user; //called here because - immutable data passed from the parent widget

  const UpdateProfileScreen({super.key, required this.user});

  @override
  State<UpdateProfileScreen> createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {
  // User? _user; - shouldn't modify widget.user directly inside the state class - use it when initState()
  bool _isLoading = false;

  late TextEditingController _firstNameController;
  late TextEditingController _lastNameController;
  late TextEditingController _userNameController;
  late TextEditingController _phoneNumberController;
  late TextEditingController _emailController;

  @override
  void initState() {
    super.initState();

    //initialize the controllers with the current data
    _firstNameController =
        TextEditingController(text: widget.user.name?.firstname ?? "");
    _lastNameController =
        TextEditingController(text: widget.user.name?.lastname ?? "");
    _userNameController =
        TextEditingController(text: widget.user.username);
    _phoneNumberController =
        TextEditingController(text: widget.user.phone ?? "");
    _emailController = TextEditingController(text: widget.user.email);
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _userNameController.dispose();
    _phoneNumberController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  void _saveUpdate() {
    setState(() {
      _isLoading = true;
    });

    Name updatedName = Name(
      firstname: _firstNameController.text,
      lastname: _lastNameController.text,
    );

    User updatedUser = User(
      name: updatedName,
      username: _userNameController.text,
      phone: _phoneNumberController.text,
      email: _emailController.text
    );

    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        _isLoading = false;
      });

      Navigator.pop(context, updatedUser); //pass the updated user back
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: true,
            backgroundColor: Colors.white,
            body: LayoutBuilder(builder: (context, constraints) {
              return SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: constraints.maxHeight),
                  child: IntrinsicHeight(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.10,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 16, right: 16),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  height: 36,
                                  width: 36,
                                  decoration: BoxDecoration(
                                    color: ColorConstants.lightGreyColor
                                        .withOpacity(0.3),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 4),
                                    child: IconButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        icon: Icon(
                                          Icons.arrow_back_ios,
                                          color: ColorConstants.darkGreyColor,
                                          size: 20,
                                        )),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Form(
                          child: Column(
                            children: [
                              SizedBox(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        height: 80,
                                        width: 80,
                                        clipBehavior: Clip.antiAlias,
                                        decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                        ),
                                        child: Image.network(
                                          "https://thekawaiifactory.com/cdn/shop/files/S64ef4db4cc7643a1919104b3e9fe215cd_530x@2x.jpg?v=1688011625",
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      const SizedBox(width: 16),
                                      TextFormField(
                                        controller: _firstNameController,
                                        decoration: const InputDecoration(
                                            labelText: 'First name'),
                                      ),
                                      TextFormField(
                                        controller: _lastNameController,
                                        decoration: const InputDecoration(
                                            labelText: 'Last name'),
                                      ),
                                      TextFormField(
                                        controller: _userNameController,
                                        decoration: const InputDecoration(
                                            labelText: 'Username'),
                                      ),
                                      TextFormField(
                                        controller: _phoneNumberController,
                                        decoration: const InputDecoration(
                                            labelText: 'Phone Number'),
                                      ),
                                      TextFormField(
                                        controller: _emailController,
                                        decoration: const InputDecoration(
                                            labelText: 'Email'),
                                      ),

                                      const SizedBox(height: 20),
                                      ElevatedButton(
                                        onPressed:
                                            _isLoading ? null : _saveUpdate,
                                        child: _isLoading
                                            ? const CircularProgressIndicator()
                                            : const Text('Update Profile'),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
            })));
  }
}
