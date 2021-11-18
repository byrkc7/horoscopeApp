import 'package:flutter/material.dart';
import 'package:flutter_application_burc/model/burc.dart';
import 'package:palette_generator/palette_generator.dart';

class BurcDetay extends StatefulWidget {
  final Burc secilenBurc;
  const BurcDetay({required this.secilenBurc, Key? key}) : super(key: key);

  @override
  State<BurcDetay> createState() => _BurcDetayState();
}

class _BurcDetayState extends State<BurcDetay> {
  Color appBarRengi = Colors.transparent;
  late PaletteGenerator _generator;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) => appBarRenginiBul());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 250,
            pinned: true,
            backgroundColor: appBarRengi,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                'images/' + widget.secilenBurc.burcBuyukResim,
                fit: BoxFit.cover,
              ),
              title: Text(widget.secilenBurc.burcAdi +
                  " Horoscope and Characteristics"),
              centerTitle: true,
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              margin: EdgeInsets.all(12),
              padding: EdgeInsets.all(4),
              child: SingleChildScrollView(
                child: Text(
                  widget.secilenBurc.burcDetayi,
                  style: Theme.of(context).textTheme.subtitle2,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void appBarRenginiBul() async {
    _generator = await PaletteGenerator.fromImageProvider(
        AssetImage("images/${widget.secilenBurc.burcBuyukResim}"));
    appBarRengi = _generator.dominantColor!.color;
    setState(() {});
  }
}
