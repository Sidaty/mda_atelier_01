import 'package:flutter/material.dart';

class ImageSelector extends StatefulWidget {



  @override
  _ImageSelectorState createState() => _ImageSelectorState();
}

class _ImageSelectorState extends State<ImageSelector> {

  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Selecteur d\'Image'),
      ),
      body: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1.5,
          ),
          itemCount: images.length,
          itemBuilder: (context, index) {
            final image = images[index];
            return InkWell(
              onTap: () {
                setState(() {
                  selectedIndex = index;
                });
              },
              child: Padding(
                padding: EdgeInsets.all(selectedIndex == index ? 8.0 : 0.0),
                child: Image.asset(
                    'assets/images/$image',
                  fit: BoxFit.cover,
                ),
              ),
            );
          },
      ),
      floatingActionButton: selectedIndex < 0 ? null : FloatingActionButton(
        child: Icon(Icons.check),
        onPressed: () {

        },
      ),
    );
  }
}

final images = [
  'pexels-photo-628776.jpeg',
  'pexels-photo-821365.jpeg',
  'pexels-photo-853006.jpeg',
  'pexels-photo-1092730.jpeg',
  'pexels-photo-1351238.jpeg',
  'pexels-photo-1410236.jpeg',
  'pexels-photo-1583884.jpeg',
  'pexels-photo-1640777.jpeg',
  'pexels-photo-3026805.jpeg',
  'pexels-photo-3186654.jpeg',
  'pexels-photo-3535383.jpeg',
  'pexels-photo-3756523.jpeg',
  'pexels-photo-3758053.jpeg',
];