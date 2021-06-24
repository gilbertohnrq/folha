import 'package:app_client/app/core/service/theme/theme_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:konoha/konoha.dart';

class ColumnistDetailsPage extends StatelessWidget {
  final themeController = Modular.get<ThemeController>();

  @override
  Widget build(BuildContext context) {
    final List<int> lista = [1, 2, 3, 4, 5, 6, 7, 8];
    return Scaffold(
      appBar: AppBar(
        elevation: 20,
        centerTitle: true,
        title: RxBuilder(
          builder: (context) {
            return KonohaImages.logo(
              height: 20,
              width: MediaQuery.of(context).size.width * 0.3611,
              color: themeController.isDark ? KonohaColors.branco : null,
            );
          },
        ),
      ),
      body: Column(
        children: [
          KonohaColumnistHeader(),
          const Divider(thickness: 2, height: 24, endIndent: 16, indent: 16),
          Expanded(
            child: ListView.separated(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              separatorBuilder: (context, index) => const Divider(
                thickness: 2,
                height: 24,
              ),
              itemCount: lista.length,
              itemBuilder: (context, index) {
                if (lista.length == index + 1) {
                  return Column(
                    children: [
                      KonohaCardNoticiaSecundaria(
                        tema: 'TESTE',
                        tituloNoticia: 'Congresso derruba veto a PL que garante acesso à internet a alunos',
                        imageUrl: 'https://image.freepik.com/fotos-gratis/maquina-de-escrever-vintage-em-mesa-de-madeira_1150-1807.jpg',
                        dataHora: '2021-06-01 22:08:00',
                        iconBookMark: Icons.bookmark_border,
                        bookmarkCallBack: () {},
                        shareCallBack: () {},
                        noticiaCallBack: () {},
                      ),
                      const Divider(thickness: 2, height: 24, endIndent: 16, indent: 16),
                      const SizedBox(height: 98),
                    ],
                  );
                }
                return KonohaCardNoticiaSecundaria(
                  tema: 'Política',
                  tituloNoticia: 'Congresso derruba veto a PL que garante acesso à internet a alunos',
                  imageUrl: 'https://image.freepik.com/fotos-gratis/maquina-de-escrever-vintage-em-mesa-de-madeira_1150-1807.jpg',
                  dataHora: '2021-06-01 22:08:00',
                  iconBookMark: Icons.bookmark_border,
                  bookmarkCallBack: () {},
                  shareCallBack: () {},
                  noticiaCallBack: () {},
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
