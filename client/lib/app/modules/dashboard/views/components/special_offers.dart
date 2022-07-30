import 'package:client/app/components/default_image.dart';
import 'package:flutter/material.dart';
import '../../../../../size_config.dart';
import '../../../../helper/constants.dart';
import 'section_title.dart';

class SpecialOffers extends StatelessWidget {
  const SpecialOffers({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: defaultPadding),
          child: SectionTitle(
            title: "All categories",
            press: () {},
          ),
        ),
        SizedBox(height: defaultPadding),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              Column(
                children: [
                  SizedBox(
                    width: 150,
                    height: 150,
                    child: DefaultInternetImage(
                        imageUri:
                            'https://res.cloudinary.com/luongvany/image/upload/v1657000276/categories/TuiVayNu_lidwod.png',
                        tagId:
                            'https://res.cloudinary.com/luongvany/image/upload/v1657000276/categories/TuiVayNu_lidwod.png'),
                  ),
                  Text('Túi váy nữ'),
                ],
              ),
              Column(
                children: [
                  SizedBox(
                    width: 150,
                    height: 150,
                    child: DefaultInternetImage(
                        imageUri:
                            'https://res.cloudinary.com/luongvany/image/upload/v1657000274/categories/MayTinhVaLapTop_rhucpi.png',
                        tagId:
                            'https://res.cloudinary.com/luongvany/image/upload/v1657000274/categories/MayTinhVaLapTop_rhucpi.png'),
                  ),
                  Text('Máy tính và laptop'),
                ],
              ),
              Column(
                children: [
                  SizedBox(
                    width: 150,
                    height: 150,
                    child: DefaultInternetImage(
                        imageUri:
                            'https://res.cloudinary.com/luongvany/image/upload/v1657000275/categories/OtoXeMay_wuilwv.png',
                        tagId:
                            'https://res.cloudinary.com/luongvany/image/upload/v1657000275/categories/OtoXeMay_wuilwv.png'),
                  ),
                  Text('Ô tô xe máy'),
                ],
              ),

              // SpecialOfferCard(
              //   image: "assets/images/Image Banner 2.png",
              //   category: "Smartphone",
              //   numOfBrands: 18,
              //   press: () {},
              // ),
              // SpecialOfferCard(
              //   image: "assets/images/Image Banner 3.png",
              //   category: "Fashion",
              //   numOfBrands: 24,
              //   press: () {},
              // ),
              SizedBox(width: defaultPadding),
            ],
          ),
        ),
      ],
    );
  }
}

class SpecialOfferCard extends StatelessWidget {
  const SpecialOfferCard({
    Key? key,
    required this.category,
    required this.image,
    required this.numOfBrands,
    required this.press,
  }) : super(key: key);

  final String category, image;
  final int numOfBrands;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: defaultPadding),
      child: GestureDetector(
        onTap: press,
        child: SizedBox(
          width: getProportionateScreenWidth(242),
          height: getProportionateScreenWidth(100),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Stack(
              children: [
                Image.asset(
                  image,
                  fit: BoxFit.cover,
                ),
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0xFF343434).withOpacity(0.4),
                        Color(0xFF343434).withOpacity(0.15),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(15.0),
                    vertical: getProportionateScreenWidth(10),
                  ),
                  child: Text.rich(
                    TextSpan(
                      style: TextStyle(color: Colors.white),
                      children: [
                        TextSpan(
                          text: "$category\n",
                          style: TextStyle(
                            fontSize: getProportionateScreenWidth(18),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(text: "$numOfBrands Brands")
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
