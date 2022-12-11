import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:calculator/services/ohm_calculator.dart';
import 'package:flutter/services.dart';


class CalculateResistance extends StatefulWidget {
  const CalculateResistance({Key? key}) : super(key: key);

  @override
  State<CalculateResistance> createState() => _CalculateResistanceState();
}


class _CalculateResistanceState extends State<CalculateResistance> {
  String appTitle = 'Form tutorial';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text ('Ohm\'s Law Calculator'),
        centerTitle: true,
        backgroundColor: Colors.purple[200],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);  // pop current page
          Navigator.pushNamed(context, "/"); // push it back in
        },
        backgroundColor: Colors.purple[200],
        child: const Text('clear'),
      ),
      body: OhmCalcForm(),
    );
  }
}
// Create a Form widget.
class OhmCalcForm extends StatefulWidget {
  const OhmCalcForm({super.key});

  @override
  OhmCalcFormState createState() {
    return OhmCalcFormState();
  }
}
// Create a corresponding State class. This class holds data related to the form.
class OhmCalcFormState extends State<OhmCalcForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  final _formKey = GlobalKey<FormState>();
  OhmCalculator calculator = OhmCalculator(volts: '0', ohms: '0', amps: '0', expression: '');
  bool showConclusion = false;

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    TextEditingController voltController = TextEditingController();
    TextEditingController ampController = TextEditingController();
    TextEditingController ohmController = TextEditingController();
    return Padding(padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 50.0),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextFormField(
              controller: voltController,
              validator: (input) {return  input == null || input.isEmpty ? 'Please enter a value' :  null;},
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                FilteringTextInputFormatter.digitsOnly
              ],
              decoration: const InputDecoration(
                icon: Icon(Icons.power_input),
                hintText: 'Enter the voltage (V)',
                labelText: 'Volts',
              ),
              style: const TextStyle(
                fontSize: 18.0,
                letterSpacing: 1.5,
              ),
            ),
            TextFormField(
              controller: ampController,
              validator: (input) {return  input == null || input.isEmpty ? 'Please enter a value' :  null;},
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                FilteringTextInputFormatter.digitsOnly
              ],
              decoration: const InputDecoration(
                icon: Icon(Icons.power_outlined),
                hintText: 'Enter the Current (I)',
                labelText: 'Amps',

              ),
              style: const TextStyle(
                fontSize: 18.0,
                letterSpacing: 1.5,
              ),
            ),
            TextFormField(
              controller: ohmController,
              validator: (input) {return  input == null || input.isEmpty ? 'Please enter a value' :  null;},
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                FilteringTextInputFormatter.digitsOnly
              ],
              decoration: const InputDecoration(
                icon: Icon(Icons.electric_meter),
                hintText: 'Enter the resistance ',
                labelText: 'Ohms',
              ),
              style: const TextStyle(
                fontSize: 18.0,
                letterSpacing: 1.5,
              ),

            ),
            Container(
                padding: const EdgeInsets.only(top: 10.0),
                child: ElevatedButton(
                  child: const Text('calculate'),
                  onPressed: ()
                  {
                    if (_formKey.currentState!.validate()) {
                    if (kDebugMode) {
                      print('Volt input: : ${voltController.text}');
                      print('Amps input: : ${ampController.text}');
                      print('Ohms input: : ${ohmController.text}');
                    }
                    setState(() {
                      calculator.volts = voltController.text;
                      calculator.amps = ampController.text;
                      calculator.ohms = ohmController.text;
                      calculator.calculator();
                      showConclusion = true;
                    });

                    }
                  else {
                    showConclusion = false;
                  }
                  },

                )),
            Container(
              child: conclusion(),
            )
          ],
        ),
      ),
    );
  }
  Widget conclusion() {
    return showConclusion==true ? Text(
      'The Calculated field is ${calculator.volts}\n'
          'The expression used was:\n'
          '${calculator.expression} ',
    ) : const Text("") ;
  }
}


