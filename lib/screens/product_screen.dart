import 'package:flutter/material.dart';
import 'package:moviles/database/connection_database.dart';
import 'package:moviles/models/products_model.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {

  ConnectionDatabase? conexion;

  @override
  void initState() {
    super.initState();
    conexion = ConnectionDatabase();
  }

  @override
  Widget build(BuildContext context) {

    ProductsModel? product;
  
    final conNomProd = TextEditingController();
    final conCanProd = TextEditingController();
    final conPreProd = TextEditingController();
    final conFecCad = TextEditingController();

    if( ModalRoute.of(context)!.settings.arguments != null ){
      product = ModalRoute.of(context)!.settings.arguments as ProductsModel;
      conNomProd.text = product.nomProducto!;
      conCanProd.text = product.canProducto!.toString();
      conPreProd.text = product.precioProducto!.toString();
      //conFecCad.text = product.fecha!.toString();
    }

    final txtNomProd = TextFormField(
      controller: conNomProd,
      decoration: const InputDecoration(
        label: Text('Nombre producto'),
        border: OutlineInputBorder()
      ),
    );

    final txtCanProd = TextFormField(
      controller: conCanProd,
      keyboardType: TextInputType.number,
      decoration: const InputDecoration(
        label: Text('Cantidad producto'),
        border: OutlineInputBorder()
      ),
    );

    final txtPreProd = TextFormField(
      controller: conPreProd,
      keyboardType: TextInputType.number,
      decoration: const InputDecoration(
        label: Text('Precio producto'),
        border: OutlineInputBorder()
      ),
    );

    final txtFecCad = TextFormField(
      controller: conFecCad,
      decoration: const InputDecoration(
        label: Text('Fecha caducidad'),
        border: OutlineInputBorder()
      ),
    );


    final btnGuardar = ElevatedButton.icon(
      onPressed: (){
        if( ModalRoute.of(context)!.settings.arguments != null ){
          conexion!.UPDATE('tblProductos', {
            "idProducto" : product!.idProducto,
            "nomProducto" : conNomProd.text,
            "canProducto" : conCanProd.text,
            "precioProducto" : conPreProd.text,
            "fechaCaducidad" : conFecCad.text
          }).then((value){
            var msj = "";
            if( value > 0 )
              msj = "Producto actualizado correctamente";
            else
              msj = "Ocurrio un error en la operación";
            
            SnackBar snackBar = SnackBar(content: Text(msj));
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
            Navigator.pop(context);
          });
        }else{
          conexion!.INSERT('tblProductos', {
            "nomProducto" : conNomProd.text,
            "canProducto" : conCanProd.text,
            "precioProducto" : conPreProd.text,
            "fechaCaducidad" : conFecCad.text
          }).then((value){
            var msj = "";
            if( value > 0 )
              msj = "Producto insertado correctamente";
            else
              msj = "Ocurrio un error en la operación";
            
            SnackBar snackBar = SnackBar(content: Text(msj));
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
            Navigator.pop(context);
          });
        }
      }, 
      icon: Icon(Icons.save), 
      label: Text('Guardar')
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('Add Product'),
      ),
      body: ListView(
        padding: EdgeInsets.all(10),
        children: [
          txtNomProd,
          const SizedBox(height: 10,),
          txtCanProd,
          const SizedBox(height: 10,),
          txtPreProd,
          const SizedBox(height: 10,),
          txtFecCad,
          const SizedBox(height: 10,),
          btnGuardar
        ],
      ),
    );
  }
}