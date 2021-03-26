import 'package:flutter/material.dart';

class ImageSelector extends StatefulWidget {

  final Function(String) onImageSelected;

  const ImageSelector({Key key, this.onImageSelected}) : super(key: key);

  @override
  _ImageSelectorState createState() => _ImageSelectorState();
}

class _ImageSelectorState extends State<ImageSelector> {
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Selecteur d\'Image')),
      body: buildGridView(context),
      floatingActionButton: buildFloatingActionButton(context),
    );
  }

  Widget buildGridView(BuildContext context) {
    return GridView.builder(
      itemCount: images.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1.5,
      ),
      itemBuilder: (context, index) {
        return buildImage(context, index);
      },
    );
  }

  Widget buildImage(BuildContext context, int index) {
    String image = images[index];
    print('$index : $image');
    bool isSelected = selectedIndex == index;
    double padding;
    if(isSelected) {
      padding = 8.0;
    } else {
      padding = 0.0;
    }
    return InkWell(
      onTap: () {
        print('Image index : $index ');
        selectedIndex = index;
        setState(() {
        });
      },
      child: Padding(
        padding: EdgeInsets.all(padding),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(image, fit: BoxFit.cover),
            if(isSelected) Positioned(
              left: 5.0,
              top: 5.0,
              child: CircleAvatar(
                radius: 15.0,
                child: Icon(Icons.check),
                backgroundColor: Theme.of(context).accentColor,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildFloatingActionButton(BuildContext context) {
    return selectedIndex < 0
        ? null
        : FloatingActionButton(
      child: Icon(Icons.check),
      onPressed: () {
        Navigator.pop(context);
        String selectedImage = images[selectedIndex];
        widget.onImageSelected(selectedImage);
      },
    );
  }

}

class FoodImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

List<String> images = [
  'assets/images/pexels-photo-628776.jpeg',
  'assets/images/pexels-photo-821365.jpeg',
  'assets/images/pexels-photo-853006.jpeg',
  'assets/images/pexels-photo-1092730.jpeg',
  'assets/images/pexels-photo-1351238.jpeg',
  'assets/images/pexels-photo-1410236.jpeg',
  'assets/images/pexels-photo-1583884.jpeg',
  'assets/images/pexels-photo-1640777.jpeg',
  'assets/images/pexels-photo-3026805.jpeg',
  'assets/images/pexels-photo-3186654.jpeg',
  'assets/images/pexels-photo-3535383.jpeg',
  'assets/images/pexels-photo-3756523.jpeg',
  'assets/images/pexels-photo-3758053.jpeg',
];
