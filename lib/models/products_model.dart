class ProductsModel {
  int? idProducto;
  String? nomProducto;
  int? canProducto;
  double? precioProducto;
  String? fecha; 

  ProductsModel({this.idProducto,this.nomProducto,this.canProducto,this.precioProducto,this.fecha});
  factory ProductsModel.fromMap(Map<String,dynamic> data){
    return ProductsModel(
      nomProducto: data['nomProducto'],
      idProducto: data['idProducto'],
      canProducto: data['canProducto'],
      fecha: data['fecha'],
      precioProducto: data['precioProducto']
    );
  }

}