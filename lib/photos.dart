import 'package:flutter/material.dart';
import 'package:testapp/models/photos_model.dart';
import 'package:testapp/photo_view.dart';

class Photos extends StatefulWidget {
  final List<PhotosModel> photos;
  final String albumName;
  const Photos({required this.photos, required this.albumName});

  @override
  _PhotosState createState() => _PhotosState();
}

class _PhotosState extends State<Photos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 10,),
            Text(widget.albumName,
            maxLines: 1,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 16,
            ),),
            SizedBox(height: 14,),
            Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  physics: AlwaysScrollableScrollPhysics(),
                  child: GridView.builder(
                    padding: EdgeInsets.symmetric(horizontal: 14),
                    physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                      ),
                      itemCount: widget.photos.length,
                      itemBuilder: (context, index){
                        return InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=> PhotoView(photoUrl: widget.photos[index].url,)));
                          },
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(6),
                            child: Container(
                              child: Image.network(widget.photos[index].thumbnailUrl,
                              fit: BoxFit.fill,),
                            ),
                          ),
                        );
                      }),
                ),
            ),
          ],
        ),
      ),
    );
  }
}
