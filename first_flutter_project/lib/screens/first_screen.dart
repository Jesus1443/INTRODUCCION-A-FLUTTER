import 'package:flutter/material.dart';

class SecondClass extends StatefulWidget {
  @override
  _SecondClassState createState() => _SecondClassState();
}

class _SecondClassState extends State<SecondClass> {
  final _formKey = GlobalKey<FormState>();
  String maritalStatus = 'single';
  bool termsChecked = true;
  String? selectedLocation;

  List<String> locations = ['A', 'B', 'C', 'D'];

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
                        return 'Please enter a name';
                      }
                      return null;
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
                      if (value.length < 6) {
                        return 'Password must be at least 6 characters long';
                      }
                      return null;
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
                    onChanged: (String? value) {
                      setState(() {
                        selectedLocation = value;
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
                      if (_formKey.currentState!.validate()) {
                        print("Registro enviado");
                      } else {
                        print("Error en el formulario");
                      }
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
}