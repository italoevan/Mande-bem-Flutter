import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  BuildContext context;
  String image;
  String pushNamed;
  CustomCard(this.context, this.image, this.bloq, {this.pushNamed});
  bool bloq;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(this.context).size.height;
    double width = MediaQuery.of(this.context).size.width;
    return GestureDetector(
      onTap: () {
        bloq == false
            ? Navigator.pushNamed(context, pushNamed)
            : Navigator.pushNamed(this.context, '/compre');
      },
      child: Container(
          width: width / 3,
          child: Stack(
            children: [
              Align(
                alignment: Alignment.center,
                child: Container(
                  width: width / 2.3,
                  child: Card(
                    elevation: 0,
                    color: Colors.transparent,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(32),
                      child: Image.asset(
                        this.image,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
              bloq == true
                  ? Align(
                      alignment: Alignment.bottomRight,
                      child: Container(
                        width: 25,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.white),
                        child: Icon(
                          Icons.lock,
                          color: Colors.black,
                        ),
                      ),
                    )
                  : Container()
            ],
          )),
    );
  }
}
