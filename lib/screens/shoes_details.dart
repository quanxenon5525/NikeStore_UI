import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:mynikestore/screens/shopping_cart.dart';
import '../model/nike_shoes.dart';

class ShoesDetails extends StatelessWidget {
  ShoesDetails({Key? key, required this.shoes}) : super(key: key);

  final NikeShoes shoes;
  final ValueNotifier<bool> notifierButtonsVisible = ValueNotifier(false);

  Future<void> _openShoppingCart(BuildContext context) async {
    notifierButtonsVisible.value = false;
    await Navigator.of(context).push(
      PageRouteBuilder(
        opaque: false,
        pageBuilder: (_, animation1, __) {
          return FadeTransition(
            opacity: animation1,
            child: NikeShoppingCart(
              shoes: shoes,
            ),
          );
        },
      ),
    );
    notifierButtonsVisible.value = true;
  }

  Widget _buildCarousel(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * 0.48,
      child: Stack(
        children: <Widget>[
          Positioned.fill(
            child: Hero(
              tag: 'background_${shoes.model}',
              child: Container(
                color: Color(shoes.color),
              ),
            ),
          ),
          Positioned(
            left: 80,
            right: 70,
            top: 5,
            child: Hero(
              tag: 'number_${shoes.model}',
              child: Material(
                color: Colors.transparent,
                child: FittedBox(
                  child: Text(
                    shoes.modelNumber.toString(),
                    style: TextStyle(
                      color: Colors.black.withOpacity(0.05),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
          PageView.builder(
              itemCount: shoes.images.length,
              itemBuilder: (context, index) {
                final tag = index == 0
                    ? 'image_${shoes.model}'
                    : 'image_${shoes.model}_$index';
                return Container(
                  alignment: Alignment.center,
                  child: Hero(
                    tag: tag,
                    child: Image.asset(
                      shoes.images[index],
                      height: 300,
                      width: 300,
                    ),
                  ),
                );
              })
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      notifierButtonsVisible.value = true;
    });

    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Image.asset(
          'images/nike_shoes/nikelogomini.jpg',
          height: 40,
        ),
        leading: BackButton(
          color: Colors.black,
        ),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Positioned.fill(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                _buildCarousel(context),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            shoes.model,
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 25,
                            ),
                          ),
                          //const Spacer(),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: <Widget>[
                                Text(
                                  '\$${shoes.oldPrice.toInt().toString()}',
                                  style: TextStyle(
                                    color: Colors.redAccent,
                                    decoration: TextDecoration.lineThrough,
                                    fontSize: 15,
                                  ),
                                ),
                                Text(
                                  '\$${shoes.currentPrice.toInt().toString()}',
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 1, 1, 1),
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: List.generate(
                            5,
                            (index) => Icon(
                                  Icons.star,
                                  color: Color.fromARGB(255, 230, 207, 5),
                                )),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Text(
                        "AVAILABLE SIZE",
                        style: TextStyle(fontSize: 12),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 15, right: 20),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: List.generate(sizeShoes.length, (index) {
                              return Padding(
                                padding: const EdgeInsets.only(right: 27),
                                child: Container(
                                  width: 50,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                        spreadRadius: 1,
                                        blurRadius: 0.5,
                                        color: Colors.black.withOpacity(0.1),
                                      )
                                    ],
                                  ),
                                  child: Container(
                                    margin: EdgeInsets.only(
                                      left: 3,
                                      top: 5,
                                      right: 5,
                                    ),
                                    child: TextButton(
                                      child: Text(
                                        sizeShoes[index],
                                      ),
                                      style: TextButton.styleFrom(
                                        primary: Colors.black,
                                      ),
                                      onPressed: () {},
                                    ),
                                  ),
                                ),
                              );
                            }),
                          ),
                        ),
                      ),
                      SizedBox(height: 15),
                      Text(
                        'DESCRIPTION',
                        style: TextStyle(
                            fontSize: 13, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 5),
                      Center(
                        child: Text(
                          '- This is the best shoes we have',
                          style: TextStyle(
                              color: Color.fromARGB(255, 170, 167, 167),
                              fontSize: 13,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ],
            ),
          ),
          ValueListenableBuilder<bool>(
              valueListenable: notifierButtonsVisible,
              builder: (context, value, child) {
                return AnimatedPositioned(
                  duration: const Duration(microseconds: 150),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Row(
                      children: <Widget>[
                        FloatingActionButton(
                          heroTag: 'fav_1',
                          backgroundColor: Colors.white,
                          child: Icon(
                            Icons.favorite,
                            color: Colors.black,
                          ),
                          onPressed: () {},
                        ),
                        Spacer(),
                        FloatingActionButton(
                          heroTag: 'fav_2',
                          backgroundColor: Colors.black,
                          child: Icon(Icons.shopping_cart),
                          onPressed: () {
                            _openShoppingCart(context);
                          },
                        ),
                      ],
                    ),
                  ),
                );
              })
        ],
      ),
    );
  }
}
