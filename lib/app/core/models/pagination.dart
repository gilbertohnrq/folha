class Pagination {
  int? paginaAtual;
  int? inicioPaginacao;
  int? indiceFinal;
  int? registrosPorPaginacao;
  int? totalDePaginas;
  int? totalDeRegistros;

  Pagination({
    this.paginaAtual,
    this.inicioPaginacao,
    this.indiceFinal,
    this.registrosPorPaginacao,
    this.totalDePaginas,
    this.totalDeRegistros,
  });

  factory Pagination.fromJson(dynamic map) {
    return  Pagination(
      paginaAtual: map['pagina_atual'] as int?,
      inicioPaginacao: map['inicio_paginacao'] as int?,
      indiceFinal: map['indice_final'] as int?,
      registrosPorPaginacao: map['registros_por_paginacao'] as int?,
      totalDePaginas: map['total_de_paginas'] as int?,
      totalDeRegistros: map['total_de_registros'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'pagina_atual': paginaAtual,
      'inicio_paginacao': inicioPaginacao,
      'indice_final': indiceFinal,
      'registros_por_paginacao': registrosPorPaginacao,
      'total_de_paginas': totalDePaginas,
      'total_de_registros': totalDeRegistros,
    };
  }
}
