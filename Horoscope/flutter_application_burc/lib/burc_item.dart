import 'package:flutter/material.dart';
import 'package:flutter_application_burc/burc_detay.dart';

import 'model/burc.dart';

class BurcItem extends StatelessWidget {
  final Burc listelenenBurc;
  const BurcItem({required this.listelenenBurc, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var myTextStyle = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.all(1),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        elevation: 6,
        child: Padding(
          padding: const EdgeInsets.all(1),
          child: ListTile(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => BurcDetay(secilenBurc: listelenenBurc),
                ),
              );
            },
            leading: Image.asset(
              "images/" + listelenenBurc.burcKucukResim,
              fit: BoxFit.cover,
            ),
            title: Text(
              listelenenBurc.burcAdi,
              style: myTextStyle.headline6,
            ),
            subtitle: Text(
              listelenenBurc.burcTarihi,
              style: myTextStyle.subtitle1,
            ),
            trailing: Icon(
              Icons.arrow_forward_ios_sharp,
              color: Colors.red,
            ),
          ),
        ),
      ),
    );
  }
}
