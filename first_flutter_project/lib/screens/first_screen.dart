import 'package:flutter/material.dart';

class SecondClass extends StatefulWidget {
  @override
  _SecondClassState createState() => _SecondClassState();
}

class _SecondClassState extends State<SecondClass> {
  final _formKey = GlobalKey<FormState>();

  String name = '';
  int age = 0;
  String password = '';
  String maritalStatus = 'single';
  bool termsChecked = true;

  List<String> locations = ['A', 'B', 'C', 'D'];
  String? selectedLocation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 10.0,
        title: const Center(child: Text('Title')),
        actions: const <Widget>[
          Icon(Icons.settings),
        ],
      ),
      body: Material(
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Enter Name',
                      hintText: 'Name',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your name';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      setState(() {
                        name = value!;
                      });
                    },
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      hintText: 'Age',
                      labelText: 'Enter Age',
                    ),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your age';
                      }
                      if (int.tryParse(value) == null) {
                        return 'Please enter a valid number';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      setState(() {
                        age = int.parse(value!);
                      });
                    },
                  ),
                  TextFormField(
                    obscureText: true,
                    decoration: const InputDecoration(
                      hintText: 'Password',
                      labelText: 'Enter Password',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a password';
                      }
                      if (value.length < 8) {
                        return 'Password should be more than 8 characters long';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      setState(() {
                        password = value!;
                      });
                    },
                  ),

                  /// Dropdown
                  DropdownButton<String>(
                    hint: const Text('Please choose the city you live in'),
                    value: selectedLocation,
                    items: locations.map((location) {
                      return DropdownMenuItem(
                        value: location,
                        child: Text(location),
                      );
                    }).toList(),
                    onChanged: (newvalue) {
                      setState(() {
                        selectedLocation = newvalue;
                      });
                    },
                  ),

                  /// Radios
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Expanded(
                        child: RadioListTile<String>(
                          title: const Text('Single'),
                          value: 'single',
                          groupValue: maritalStatus,
                          onChanged: (value) {
                            setState(() {
                              maritalStatus = value!;
                            });
                          },
                        ),
                      ),
                      Expanded(
                        child: RadioListTile<String>(
                          title: const Text('Married'),
                          value: 'married',
                          groupValue: maritalStatus,
                          onChanged: (value) {
                            setState(() {
                              maritalStatus = value!;
                            });
                          },
                        ),
                      ),
                    ],
                  ),

                  /// Checkbox
                  CheckboxListTile(
                    controlAffinity: ListTileControlAffinity.leading,
                    value: termsChecked,
                    title: const Text(
                      'Sign up for the newspaper and related articles',
                    ),
                    onChanged: (value) {
                      setState(() {
                        termsChecked = value!;
                      });
                    },
                  ),

                  /// Botón
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                    ),
                    onPressed: () {
                      onPressedSubmit(context);
                    },
                    child: const Text('Register'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

    void onPressedSubmit(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      print("Nombre: $name");
      print("Edad: $age");
      print("Password: $password");
      print("Ciudad: $selectedLocation");
      print("Estado civil: $maritalStatus");
      print("Aceptó términos: $termsChecked");
      
    }
  }
}