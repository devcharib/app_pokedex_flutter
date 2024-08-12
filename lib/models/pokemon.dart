class Pokemon {
  //variaveis
  int? id;
  String? numero;
  String? nome;
  String? imagem;
  List<String>? tipo;
  //construtor
  Pokemon({
    this.id,
    this.numero,
    this.nome,
    this.imagem,
    this.tipo,
  });
  //metodos
  //Recebendo ... fromJSON
  Pokemon.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    numero = json['num'];
    nome = json['name'];
    imagem = json['img'];
    tipo = json['type'].cast<String>();
  }
  //criando ... toJSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['num'] = this.numero;
    data['name'] = this.nome;
    data['img'] = this.imagem;
    data['type'] = this.tipo;

    return data;
  }
}
