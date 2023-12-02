
import 'package:flutter/material.dart';
import 'package:hawk_fab_menu/hawk_fab_menu.dart';
import 'package:moviles/database/connection_database.dart';
import 'package:moviles/models/products_model.dart';

class DespensaScreen extends StatefulWidget {
  const DespensaScreen({super.key});

  @override
  State<DespensaScreen> createState() => _DespensaScreenState();
}

class _DespensaScreenState extends State<DespensaScreen> {

  ConnectionDatabase? conexion;
  @override
  void initState() {
    super.initState();
    conexion = ConnectionDatabase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Mi despensa'),),
      body: HawkFabMenu(
        body: FutureBuilder(
          future: conexion!.GETALLPROUCTS(),
          builder: (context, AsyncSnapshot<List<ProductsModel>> snapshot) {
            if( snapshot.hasData ){
              return ListView.builder(
                padding: const EdgeInsets.all(10),
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return cardProduct(snapshot.data![index]);
                },
              );
            }else{
              if( snapshot.hasError ){
                return  const Center(
                  child: Text('Ocurrio un error'),
                );
              }else{
                return const Center(child: CircularProgressIndicator());
              }
            }
          },
        ),
        items: [
          HawkFabMenuItem(
            label: 'Agregar Producto',
            ontap: () => Navigator.pushNamed(context, '/add').then((value){
              setState(() {});
            }),
            icon: const Icon(Icons.production_quantity_limits),
            color: Colors.red,
            labelColor: Colors.blue,
          ),
        ]
      ),
    );
  }

  Widget cardProduct(ProductsModel product){
    return Container(
      margin: EdgeInsets.only(top: 10),
      height: 150,
      decoration: BoxDecoration(
        color: Colors.blueAccent,
        borderRadius: BorderRadius.circular(10),
        image: const DecorationImage(
          opacity: .5,
          alignment: Alignment.topRight,
          fit: BoxFit.cover,
          image: NetworkImage('https://www.subodega.mx/articulo/605/04.webp')
        )
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(product.nomProducto!,style: TextStyle(color: Colors.black, fontSize: 25),),
            Text('Caducidad : ${product.fecha}'),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  onPressed: (){
                    Navigator.pushNamed(context, '/add', arguments: product).then((value){
                      setState(() {});
                    });
                  }, 
                  icon: Icon(Icons.edit, color: Colors.white, size: 40,)
                ),
                SizedBox(height: 80,),
                IconButton(onPressed: (){
                  showDialog(
                    context: context, 
                    builder: (context) {
                      return AlertDialog(
                        title: const Text('Confirmar acción'),
                        content: const Text('¿Deseas mandar a la basura el producto?'),
                        actions: [
                          ElevatedButton(
                            onPressed: (){
                              conexion!.DELETE('tblProductos', product.idProducto!).then((value){
                                SnackBar snackBar = SnackBar(content: Text('Producto desechado'));
                                Navigator.pop(context);
                                setState(() {});
                                ScaffoldMessenger.of(context).showSnackBar(snackBar);
                              });
                            }, 
                            child: const Text('Si')
                          ),
                          ElevatedButton(
                            onPressed: (){}, 
                            child: const Text('No')
                          )
                        ],
                      );
                    },
                  );

                  
                }, 
                icon: Icon(Icons.delete, color: Colors.white, size: 40,)),
              ],
            )
          ], 
        ),
      ),
    );
  }
}