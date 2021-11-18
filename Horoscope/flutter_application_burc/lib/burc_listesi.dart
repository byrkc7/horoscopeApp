import 'package:flutter/material.dart';

import 'burc_item.dart';
import 'data/strings.dart';
import 'model/burc.dart';

class BurcListesi extends StatelessWidget {
  late List<Burc> tumBurclar = [];
  BurcListesi() {
    tumBurclar = VeriKaynaginiHazirla();
    print(tumBurclar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(
          "Horoscope List",
          style: TextStyle(fontStyle: FontStyle.italic),
        ),
        centerTitle: true,
      ),
      body: Center(
          child: ListView.builder(
        itemBuilder: (context, index) {
          return BurcItem(listelenenBurc: tumBurclar[index]);
        },
        itemCount: tumBurclar.length,
      )),
    );
  }

  List<Burc> VeriKaynaginiHazirla() {
    List<Burc> gecici = [];
    for (int i = 0; i < 12; i++) {
      var burcAdi = Strings.BURC_ADLARI[i];
      var burcTarih = Strings.BURC_TARIHLERI[i];
      var burcDetay = Strings.BURC_GENEL_OZELLIKLERI[i];
      var burcKucukResim =
          Strings.BURC_ADLARI[i].toLowerCase() + '${i + 1}.png';
      var burcBuyukResim =
          Strings.BURC_ADLARI[i].toLowerCase() + '_buyuk' + '${i + 1}.png';
      Burc eklenenBurc =
          Burc(burcAdi, burcTarih, burcDetay, burcKucukResim, burcBuyukResim);

      gecici.add(eklenenBurc);
    }
    return gecici;
  }
}
