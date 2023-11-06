import 'dart:math';

import 'package:flutter/material.dart';
class Asds extends StatefulWidget {
  const Asds({Key? key}) : super(key: key);

  @override
  State<Asds> createState() => _AsdsState();
}
class _AsdsState extends State<Asds> {
  TextEditingController count = TextEditingController();
TextEditingController val = TextEditingController();
TextEditingController high = TextEditingController();
TextEditingController low = TextEditingController();
TextEditingController lessthan = TextEditingController();
TextEditingController greaterthan = TextEditingController();
TextEditingController ascending  = TextEditingController();


List a= [];
List b =[];
List c =[];

String res = '';

void Ascending()
{
  setState(() {
      a.sort();
  });
}

void Decending()
{
  setState(() {
    a.sort((b,a)=> a.compareTo(b));
  });
}


void add(){

  setState(() {
    a.add(int.parse(val.text));
    val.clear();
    setState(() {
      if(a.length<num){
        a.add(int.parse(val.text));
      }
    });
  });

}
void High(){
  setState(() {
    var as = a.reduce((value, element) => value > element ? value: element);
    high.text= as.toString();
  });
}


void Low()
{
  var as = a.reduce((value, element) => value< element ? value : element);
  low.text= as.toString();
}

int num=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('SIMPLE CACULATION'),
        ),
      body:
    
      SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage('assets/pink.jpg'),
            fit: BoxFit.fill)
          ),
          child: Column(
             children: [

               Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: TextField(
                   controller:count ,
                   decoration: InputDecoration(
                     hintText: 'count',
                     labelText: 'count',
                     border: OutlineInputBorder()
                   ),
                 ),
               ),
               Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: TextField(
                   controller: val,
                   decoration: InputDecoration(
                     hintText: 'Element',
                     labelText: 'Element',
                     border: OutlineInputBorder(),

                   ),
                 ),
               ),
               ElevatedButton(onPressed: add
                   , child: Text('add')
               ),
               Row(
                 children: [
                   Padding(
                     padding: const EdgeInsets.all(8.0),
                     child: Container(
                       height: 150,
                       width: 110,
                       color: Colors.grey,
                       child: ListView.builder(
                         itemCount: a.length,
                           itemBuilder: (BuildContext con,index)
                       {
                         return Container(
                           height: 20,
                           width: 100,
                           color: Colors.blue,
                           child: Text(a[index].toString()),
                         );


                       }
                       )
                     ),
                   ),
                   Padding(
                     padding: const EdgeInsets.all(8.0),
                     child: Column(
                       children: [
                         ElevatedButton(onPressed:
                         Ascending
                             , child:Text(' ascending order')),
SizedBox(
  height: 15,
),

                         ElevatedButton(onPressed:Decending ,
                             child: Text('decending order'))

                       ],
                     ),
                   )
                 ],
               ),
               Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: ElevatedButton(onPressed:
                 High
                 , child: Text('high value'),
                 ),
               ),

               TextField(
                 controller: high,
                 decoration: InputDecoration(
                   border: OutlineInputBorder()
                 ),
               ),

               Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: ElevatedButton(onPressed: Low

                 , child: Text('low value')),
               ),
               TextField(
                 controller: low,
                 decoration: InputDecoration(
                   border: OutlineInputBorder()
                 ),
               ),
               ElevatedButton(onPressed: (){
                 b = a.where((e) => e < 5).toList();
                 print(b);
                 lessthan.text = b.toString();
                 }, child: Text('Less than 5')),
               TextField(
                 controller: lessthan,
                 decoration: InputDecoration(
                   border: OutlineInputBorder()
                 ),
               ),
               ElevatedButton(onPressed: (){
                 c = a.where((e) => e > 5 ).toList();
                 print(b);
                 greaterthan.text = c.toString();

               }, child: Text('greater than 5')),
               TextField(
                 controller: greaterthan,
                 decoration: InputDecoration(
                   border: OutlineInputBorder()
                 ),
               ),



             ],
          ),
        ),
      ),
    );
  }
}
