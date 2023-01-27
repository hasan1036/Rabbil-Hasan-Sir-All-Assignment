import 'package:flutter/material.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home:  MyHomePage(),
    );
  }
}
class MyHomePage extends StatelessWidget {

  static List<String> fruitname =['Apple','Banana','Mango','Orange','pineapple'];
  static List url = ['https://www.applesfromny.com/wp-content/uploads/2020/05/Jonagold_NYAS-Apples2.png',
    'https://cdn.mos.cms.futurecdn.net/42E9as7NaTaAi4A6JcuFwG-1200-80.jpg',
    'https://upload.wikimedia.org/wikipedia/commons/thumb/9/90/Hapus_Mango.jpg/220px-Hapus_Mango.jpg',
    'https://5.imimg.com/data5/VN/YP/MY-33296037/orange-600x600-500x500.jpg',
    'https://5.imimg.com/data5/GJ/MD/MY-35442270/fresh-pineapple-500x500.jpg'];


  final List<FruitDataModel> Fruitdata = List.generate(
      fruitname.length,
          (index)
      => FruitDataModel('${fruitname[index]}', '${url[index]}','${fruitname[index]} Description...'));



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("MyApps"),),
      body: ListView.builder(
        itemCount:Fruitdata.length ,
        itemBuilder:(context, index){
          return Card(
            child:ListTile(
              title: Text(Fruitdata[index].name),
              leading: SizedBox(
                width: 50,
                height: 50,
                child: Image.network(Fruitdata[index].ImageUrl),
              ),
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>FruitDetail(fruitDataModel: Fruitdata[index],)));
              },
            ) ,
          );
        },
      ),
    );
  }
}


class FruitDataModel{
  final String name, ImageUrl, desc;

  FruitDataModel(this.name, this.ImageUrl, this.desc);
}


class FruitDetail extends StatelessWidget {


  final FruitDataModel fruitDataModel;
  const FruitDetail({Key? key, required this.fruitDataModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(fruitDataModel.name),),
      body: Column(
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.network(fruitDataModel.ImageUrl),
          Text(fruitDataModel.desc)
        ],
      ),
    );
  }
}