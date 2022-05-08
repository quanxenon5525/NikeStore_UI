import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import '../screens/shoes_details.dart';

import '../model/nike_shoes.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ValueNotifier<bool> notifierBottomBarVisible = ValueNotifier(true);

  void _onShoesPressed(NikeShoes shoes, BuildContext context) async {
    notifierBottomBarVisible.value = false;
    await Navigator.of(context).push(
      PageRouteBuilder(
        pageBuilder: (context, animation1, animation2) {
          return FadeTransition(
            opacity: animation1,
            child: ShoesDetails(
              shoes: shoes,
            ),
          );
        },
      ),
    );
    notifierBottomBarVisible.value = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Container(
          height: 70,
          width: 100,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/nike_shoes/nikelogomini.jpg'),
            ),
          ),
        ),
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.menu),
          color: Colors.black,
        ),
        actions: [
          Stack(
            children: <Widget>[
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.shopping_cart),
                color: Colors.black,
              ),
              Positioned(
                top: 5,
                right: 5,
                child: Container(
                  height: 18,
                  width: 18,
                  decoration: BoxDecoration(
                      color: Colors.blueAccent,
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 3)),
                ),
              )
            ],
          ),
        ],
      ),
      body: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 20.0, top: 20.0, right: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Expanded(
                  child: ListView.builder(
                      itemCount: shoes.length,
                      itemBuilder: (context, index) {
                        final shoesItem = shoes[index];
                        return HomeScreenShoes(
                          shoesItem: shoesItem,
                          onTap: () {
                            _onShoesPressed(shoesItem, context);
                          },
                        );
                      }),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class HomeScreenShoes extends StatelessWidget {
  const HomeScreenShoes(
      {Key? key, required this.shoesItem, required this.onTap})
      : super(key: key);

  final NikeShoes shoesItem;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    const itemHeight = 250.0;
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15.0),
        child: SizedBox(
          height: 180,
          child: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              Positioned.fill(
                child: Hero(
                  tag: 'background_${shoesItem.model}',
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(shoesItem.color),
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Hero(
                  tag: 'number_${shoesItem.model}',
                  child: SizedBox(
                    height: itemHeight * 0.6,
                    child: Material(
                      color: Colors.transparent,
                      child: FittedBox(
                        child: Text(
                          shoesItem.modelNumber.toString(),
                          style: TextStyle(
                            color: Colors.black.withOpacity(0.05),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 20,
                right: 20,
                bottom: 45,
                height: itemHeight * 0.6,
                child: Hero(
                  tag: 'image_${shoesItem.model}',
                  child: Image.asset(
                    shoesItem.images.first,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Positioned(
                bottom: 20,
                left: 20,
                child: LikeButton(),
              ),
              Positioned(
                bottom: 20,
                right: 20,
                child: Icon(
                  Icons.shopping_cart,
                  color: Colors.grey,
                ),
              ),
              Positioned(
                left: 0,
                right: 0,
                bottom: 5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      shoesItem.model,
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      '\$${shoesItem.oldPrice.toInt().toString()}',
                      style: TextStyle(
                        color: Colors.red,
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      '\$${shoesItem.currentPrice.toInt().toString()}',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
