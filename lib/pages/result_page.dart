import 'package:bmi_calculator/utils/bmi_class.dart';
import 'package:flutter/material.dart';
class ResultPage extends StatelessWidget {
  final double bmi;
  const ResultPage({Key? key, required this.bmi}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI RESULT'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Text(
                'Your BMI is ',
                style: TextStyle(
                  fontSize: 25
                ),
              ),
              Container(
                alignment: Alignment.center,
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.amber, width: 8)
                ),
                child: Text(
                  bmi.toStringAsFixed(1),
                  style: TextStyle(fontSize: 40),
                ),
              ),
              SizedBox(height: 20,),
              Text(
                'You are',
                style: TextStyle(fontSize: 25),
              ),
              Text(
                Bmi.getBmiStatus(bmi),
                style: TextStyle(fontSize: 25),
              ),
              const SizedBox(height: 20,),
              Column(
                children: Bmi.statusMap.keys.map((e) => ListTile(
                  tileColor: Bmi.getBmiStatus(bmi)==e? Colors.greenAccent:null,
                  title: Text(e),
                  trailing: Text(Bmi.statusMap[e]!),
                )).toList(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
