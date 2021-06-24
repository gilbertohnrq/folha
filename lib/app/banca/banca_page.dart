import 'package:app_client/app/drawer/drawer_page.dart';
import 'package:flutter/material.dart';
import 'package:konoha/konoha.dart';

class BancaPage extends StatefulWidget {
  final String title;
  const BancaPage({Key? key, this.title = 'Edição Digital'}) : super(key: key);
  @override
  BancaPageState createState() => BancaPageState();
}

class BancaPageState extends State<BancaPage> {
  //final ScrollController _scrollController = ScrollController();
  int idx = 15;
  //final BancaStore store = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawer(),
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              //: MediaQuery.of(context).size.height * 0.3,
              margin: const EdgeInsets.only(top: 36, bottom: 32),
              child: KonohaCardEdicaoDeHoje(
                cardCallback: () {
                  //print('clicou na noticia');
                },
                shareCallBack: () {
                  //print('clicou no botão de share');
                },
                imageUrl: 'https://www.conjur.com.br/img/b/jornal-brasil3.jpeg',
                weekDay: 'Dia da semana',
                monthDay: '00 de Janeiro',
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Wrap(
                  //alignment: WrapAlignment.spaceAround,
                  spacing: MediaQuery.of(context).size.width * 0.08,
                  runSpacing: 23.0,
                  children: List.generate(
                      8,
                      (index) => KonohaCardDiaDaSemana(
                            cardCallback: () {
                            },
                            shareCallBack: () {
                            },
                            imageUrl: 'https://www.conjur.com.br/img/b/jornal-brasil3.jpeg',
                            weekDay: 'Dia da semana',
                            monthDay: '00 de Janeiro',
                          ))),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
        selectedItemColor: KonohaColors.laranja_total,
        backgroundColor: Theme.of(context).bottomAppBarColor,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Notícias',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chrome_reader_mode),
            label: 'Banca',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.format_quote),
            label: 'Colunistas',
          ),
        ],
      ),
    );
  }
}
