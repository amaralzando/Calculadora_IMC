import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final TextEditingController weightController = TextEditingController();
  final TextEditingController heightController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String infoText = 'Informe seus dados!';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Calculadora de IMC',
        ),
        centerTitle: true,
        backgroundColor: Colors.green,
        actions: [
          IconButton(
            onPressed: resetFields,
            icon: const Icon(
              Icons.refresh,
            ),
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                const Icon(
                  Icons.person_2_outlined,
                  size: 120,
                  color: Colors.green,
                ),
                TextFormField(
                  validator: (value) {
                    if(value!.isEmpty){
                      return  'Insira seu Peso';
                    }
                  },
                  controller: weightController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Peso em KG',
                    labelStyle: TextStyle(
                      color: Colors.green,
                    ),
                  ),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.green,
                    fontSize: 20,
                  ),
                ),
                TextFormField(
                  validator: (value) {
                    if(value!.isEmpty){
                      return  'Insira sua altura ';
                    }
                  },
                  controller: heightController,
                  keyboardType: TextInputType.number,
                  decoration:const InputDecoration(
                    labelText: 'Altura em CM',
                    labelStyle: TextStyle(
                      color: Colors.green,
                    ),
                  ),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.green,
                    fontSize: 20,
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
                  height: 60,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            if(formKey.currentState!.validate()){
                              calculate();
                            }
                          },
                          style: const ButtonStyle(
                              backgroundColor:
                              MaterialStatePropertyAll<Color>(Colors.green)),
                          child: const Text(
                            'Calcular',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 10,),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: resetFields,
                          style: const ButtonStyle(
                              backgroundColor:
                              MaterialStatePropertyAll<Color>(Colors.red)),
                          child: const Text(
                            'Resetar',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  infoText,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: 25,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
  //Functions
  void resetFields() {
    setState(() {
      weightController.text = '';
      heightController.text  = '';
      infoText = 'Informe seus dados';
    });
  }

  void calculate() {
    setState(() {
      double weight =  double.parse(weightController.text);
      double height =  double.parse(heightController.text) / 100;

      double imc = weight / (height * height);
      imc.toStringAsPrecision(3);
      if ( imc < 19.5 ){
        infoText = "Você está abaixo do peso";
      }
      if (imc >= 19.5 && imc < 26.4){
        infoText = "Você está com o peso ideal";
      }
      if (imc >= 26.4  && imc < 31) {
        infoText = " Você está acima do peso";
      }
      if (imc >= 31 ) {
        infoText = "Você está obeso";
      }
    });
  }
//
}
