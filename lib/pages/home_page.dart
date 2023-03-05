import 'package:bmi_calculator/pages/result_page.dart';
import 'package:flutter/material.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _weightController= TextEditingController();
  final _heightController=TextEditingController();
  @override
  void dispose() {
    _weightController.dispose();
    _heightController.dispose();
    // TODO: implement dispose
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('BMI CALCULATOR'), centerTitle: true,),
      body: Column(
        children: [
          Text('Welcome', style: TextStyle(fontSize: 24),),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _weightController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Weight',
                hintText: 'Enter you weight in kg',
                border:OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10)
                )
              ),
            ),
          ),
          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _heightController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Height',
                hintText: 'Enter you height in Meter',
                border:OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10)
                )
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: double.infinity,
              height: 45,
              child: ElevatedButton(
                onPressed: _calculateBMI,
                child: const Text('Get your BMI'),
              ),
            ),
          ),

        ],
      ),
    );
  }

  void _calculateBMI() {
    if(_weightController.text.isEmpty || _heightController.text.isEmpty){
      showMsg(context, 'Please provide a valid height or weight');
      return;
    }
    if(double.parse(_weightController.text)<=0.0 ||
        double.parse(_heightController.text)<=0.0){
      showMsg(context, 'Height and Weight greater than Zero');
      return;
    }
    final weight= double.parse(_weightController.text);
    final height= double.parse(_heightController.text);
    final bmi=weight/(height*height);
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context)=> ResultPage(bmi: bmi,))
    );
  }
}
void showMsg(BuildContext context, String msg)=>
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(msg))
    );