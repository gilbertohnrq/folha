import 'package:app_client/app/core/service/theme/theme_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:konoha/konoha.dart';

class ColumnistPage extends StatelessWidget {
  final themeController = Modular.get<ThemeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16, top: 36),
            child: Text('Colunistas', style: Theme.of(context).textTheme.headline2!.copyWith(fontWeight: FontWeight.bold)),
          ),
          SizedBox(
            height: 130,
            child: ListView.separated(
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.only(left: 16, top: 16),
              separatorBuilder: (context, index) => const SizedBox(width: 16),
              itemCount: 16,
              itemBuilder: (context, index) => KonohaCardColunista(
                imageUrl: 'https://www.psicosignificar.psc.br/wp-content/uploads/2020/01/mulher-pensando-sobre-a-relacao.jpg',
                titulo: 'Lorem ipsum is a simply dumby text about cats',
                dataHora: 'há 7h',
                nomeColunista: 'Marcela Andrade',
                onPressed: () {},
              ),
            ),
          ),
          const Divider(endIndent: 16, indent: 16, thickness: 2, height: 0),
          Expanded(
            child: ListView.separated(
              separatorBuilder: (context, index) => const Divider(endIndent: 16, indent: 16, thickness: 2, height: 0),
              itemCount: 16,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) => ListTile(
                contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                onTap: () => Modular.to.pushNamed('/columnist-details'),
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  clipBehavior: Clip.hardEdge,
                  child: KonohaCacheNetworkImage(
                    width: MediaQuery.of(context).size.width * 0.0694,
                    height: MediaQuery.of(context).size.width * 0.0694,
                    imageUrl: 'https://www.psicosignificar.psc.br/wp-content/uploads/2020/01/mulher-pensando-sobre-a-relacao.jpg',
                  ),
                ),
                horizontalTitleGap: 0,
                title: Text(
                  'Marcela Andrade',
                  style: Theme.of(context).textTheme.headline6!.copyWith(fontWeight: FontWeight.w500),
                  overflow: TextOverflow.ellipsis,
                ),
                trailing: Container(
                  alignment: Alignment.center,
                  height: 20,
                  width: 103,
                  decoration: BoxDecoration(
                    color: KonohaColors.laranja_total,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    'Lorem ipsum..',
                    style: Theme.of(context).textTheme.headline6!.copyWith(
                          fontWeight: FontWeight.bold,
                          color: KonohaColors.branco,
                        ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
