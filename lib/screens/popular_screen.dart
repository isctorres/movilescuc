import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:moviles/models/popular_model.dart';
import 'package:moviles/network/popular_api.dart';

class PopularScreen extends StatefulWidget {
  const PopularScreen({super.key});

  @override
  State<PopularScreen> createState() => _PopularScreenState();
}

class _PopularScreenState extends State<PopularScreen> {

  PopularApi? popularApi;

  @override
  void initState() {
    super.initState();
    popularApi = PopularApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Popular Movies'),),
      body: FutureBuilder(
        future: popularApi!.getAllPopular(),
        builder: (context, AsyncSnapshot<List<PopularModel>?> snapshot) {
          if( snapshot.hasData ){
            return GridView.builder(
              padding: const EdgeInsets.all(10),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: .7,
                crossAxisSpacing: 5,
                mainAxisSpacing: 10
              ),
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return cardPopularMovie(snapshot.data![index]);
              }, 
            );
          }else{
            if(snapshot.hasError){
              return const Center(child: Text('Ocurrio un error al ejecutar la petición'));
            }else{
              return const Center(child: CircularProgressIndicator(),);
            }
          }
        },
      ),
    );
  }

  Widget cardPopularMovie(PopularModel popularModel){
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/dash');
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            CachedNetworkImage(
              //fit: BoxFit.fill,
              placeholder: (context, url) => Image.asset('assets/giphy.gif'), 
              imageUrl: 'https://image.tmdb.org/t/p/w500/${popularModel.posterPath}'
            ),
            Opacity(
              opacity: .6,
              child: Container(
                height: 100,
                color: Colors.black,
                child: ListTile(
                  title: Text(popularModel.title!, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                  subtitle: Text(popularModel.overview!, overflow: TextOverflow.ellipsis, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

}