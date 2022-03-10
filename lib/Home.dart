import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  TextEditingController _controllerAlcool = TextEditingController();
  TextEditingController _controllerGasolina = TextEditingController();
  String mensagemAviso = '';

  void _calcular(){
   
    var precoAlcool = double.tryParse(_controllerAlcool.text); //recupera o valor do input como double para poder calcular
    var precoGasolina = double.tryParse(_controllerGasolina.text);
    if( precoAlcool == null || precoGasolina == null){
      setState(() {
        mensagemAviso = 'Numero invalido, use o (.) e numeros maiores que zero!';
      });
     
    }else{
      /*Se o preço do alcool dividido pelo preço da gasolina for
      >= a 0.7 é melhor abastecer com gasolina, senão é melhor utilizar álcool.*/

      if( (precoAlcool/precoGasolina) >= 0.7){
           setState(() {
        mensagemAviso = 'Melhor abastecer com GASOLINA!';
        _controllerAlcool.clear();
        _controllerGasolina.clear();
      });
     
      }else{
        setState(() {
        mensagemAviso = 'Melhor abastecer com ÁLCOOL!';
         _controllerAlcool.clear();
        _controllerGasolina.clear();
      });
      }

      
    }
  
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Álcool ou Gasolina',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold
          ),),
          centerTitle: true,
          backgroundColor: Color.fromARGB(255, 34, 4, 117)
      ),
      body: Container(
       
        child: SingleChildScrollView(
          padding: EdgeInsets.all(32),
          child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(bottom: 32),
              child: Image.asset('images/logo.png'),
              
            ),
            Padding(
              padding:  EdgeInsets.only(bottom: 10) ,
              child: Text('Saiba qual a melhor opção para seu carro:',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.black
              ),),
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration:InputDecoration(
                labelText: 'Preço do álcool, ex: 4.59'
              ) ,
              style: TextStyle(
                fontSize: 22
              ),
              controller: _controllerAlcool,
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration:InputDecoration(
                labelText: 'Preço da gasolina, ex: 6.89'
              ) ,
              style: TextStyle(
                fontSize: 22
              ),
              controller: _controllerGasolina,
            ),
            Padding(
              padding:  EdgeInsets.only(top: 20),
              child: ElevatedButton(
                onPressed: (){
                  _calcular();
                }, 
                child: Text('Calcular'),
                 style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6)
                      ),
                      primary: Color.fromARGB(255, 34, 4, 117),
                     padding: EdgeInsets.all(15),
                      
                      textStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.bold,
                          
                      )
                    ),)
            ),
            Padding(
              padding: EdgeInsets.only(top: 30) ,
              child: Text(
                mensagemAviso,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.red
              ),),)
          ],) )
      ) ,
      );
  }
}