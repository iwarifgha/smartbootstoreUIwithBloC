import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shoe_store/views/details.dart';

import '../mock_data/product_list.dart';
import '../widgets/helpers/product_card.dart';
import '../widgets/helpers/quick_option_button.dart';
import '../widgets/helpers/search_bar.dart';
import '../widgets/helpers/shoe_store_app_bar.dart';

class HomeScreen extends StatelessWidget {
    HomeScreen({super.key});

  var quickButtonData = {
    'Alien' : 'assets/images/machine learning.png',
    'AI' : 'assets/images/artificial-intelligence-ai-icon-vector-23097736-1022936619.jpg'
  };

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final itemHeight = size.height/2.5;
    final itemWidth = size.width /2;
    return NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return [
          const SliverAppBar(
            surfaceTintColor: Colors.transparent,
            snap: true,
            floating: true,
            bottom: PreferredSize(
                preferredSize: Size(double.infinity, 50),
                child: ShoeStoreAppBar(),
            ),
          )
        ];
      },
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const SizedBox(height: 5),
            const ShoeStoreSearchBar(),
            Expanded(
              child: ListView(
                children: [
                  Container(
                    color: Colors.transparent,
                    height: 40,
                    width: double.maxFinite,
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        scrollDirection: Axis.horizontal,
                        itemCount: 2,
                        itemBuilder: (ctx, index){
                          return QuickOptionButton(
                            imageLink: quickButtonData.values.elementAt(index),
                            name: quickButtonData.keys.elementAt(index),
                            onTap: () {  },
                          );
                        }),
                  ),
                  const SizedBox(height: 15),
                  GridView.builder(
                    shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: (itemWidth / itemHeight) ,
                      ),
                      itemCount: listOfShoes.length,
                      itemBuilder: (context, index){
                        return ShoeStoreProductCard(
                          product: listOfShoes[index],
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(builder: (context){
                              return DetailsView(product: listOfShoes[index],);
                            }));
                          },
                        );
                      }
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
