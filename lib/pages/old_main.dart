import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class Old extends StatelessWidget {
  const Old({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text ('Ohm\'s Law Calculator'),
        centerTitle: true,
        backgroundColor: Colors.purple[200],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Text('clear'),
        backgroundColor: Colors.purple[200],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 90),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // Amps Row
            Row(
                children: <Widget>[
                  Text('Amps'),
                  SizedBox(
                    width: 15.0,
                  ),
                  Container(
                    width: 100.0,
                    child: TextField(
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter> [FilteringTextInputFormatter.digitsOnly],
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Power',
                      ),
                    ),
                  ),
                ]
            ),
            //Volts Row
            Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text('Volts'),
                  SizedBox(
                    width: 15.0,
                  ),
                  Container(
                    width: 100.0,
                    child: TextField(
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter> [FilteringTextInputFormatter.digitsOnly],
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Volts',
                      ),
                    ),
                  ),
                ]
            ),
            //Power Row
            Row(
              //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text('Power'),
                  SizedBox(
                    width: 15.0,
                  ),
                  Container(
                    width: 100.0,
                    child: TextField(
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter> [FilteringTextInputFormatter.digitsOnly],
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Power',
                      ),
                    ),
                  ),
                ]
            ),
            // Resistance Row
            Row(
              //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text('Resistance'),
                  SizedBox(
                    width: 15.0,
                  ),
                  Container(
                    width: 100.0,
                    child: TextField(
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter> [FilteringTextInputFormatter.digitsOnly],
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Power',
                      ),
                    ),
                  ),
                ]
            ),

            ElevatedButton(
                onPressed: (){},
                child: Text('Calculate'))
          ],
        ),
      ),
    );
  }
}

