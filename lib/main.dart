import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'bodyBMI',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: MyHomePage(title: 'Calculate Your Body Mass Index (BMI)'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);


  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();

  var calculateBMI;
  var result;

  void calculate() {
    setState(() {
      double height = double.parse(_heightController.text) / 100;
      double weight = double.parse(_weightController.text);

      calculateBMI = weight / (height * height);
      print(calculateBMI);

      if(calculateBMI < 18)
        result ='underweight';

      if(calculateBMI >= 18 && calculateBMI < 25)
        result = 'normal';

      if(calculateBMI >= 25 && calculateBMI < 35)
        result = 'overweight';

      if(calculateBMI >= 35 )
        result = 'fat';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),

        child: Column(
          children: <Widget>[
            TextField(
              style: TextStyle(),
              controller: _weightController,
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Weight',
                hintText: 'Enter your weigh',
                prefixText: ' ',
                prefixIcon: const Icon(
                Icons.person,
                color: Colors.blueGrey,
              )
              ),
            ),
            SizedBox(height: 15),
            TextField(
              controller: _heightController,
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.done,
              decoration: InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Height',
                hintText: 'Enter your height ',
                prefixText: ' ',
                prefixIcon: const Icon(
                  Icons.person,
                  color: Colors.blueGrey,
                ),
              ),
            ),
            SizedBox(height: 25),
            // ignore: deprecated_member_use
            RaisedButton(
              color: Colors.blueGrey,
              child: Text(
                "Calculate",
                style: TextStyle(color: Colors.white),
              ),
              onPressed: calculate,
            ),
            SizedBox(height: 25),
            new Image(
              image: new AssetImage("assets/images/$result.png"),
              errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                return const Text('');
                },
              fit: BoxFit.cover,
            ),
            SizedBox(height: 25),
            Text(
              result == null ? ' ' :  'Your BMI: ${calculateBMI.toInt()}, $result',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}