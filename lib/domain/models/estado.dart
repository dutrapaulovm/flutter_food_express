// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Estado {

  int? id;
  String? ufibge;
  String? uf;
  String? nome; 
  Estado({
    this.id,
    this.ufibge,
    this.uf,
    this.nome,
  });   
  

  Estado copyWith({
    int? id,
    String? ufibge,
    String? uf,
    String? nome,
  }) {
    return Estado(
      id: id ?? this.id,
      ufibge: ufibge ?? this.ufibge,
      uf: uf ?? this.uf,
      nome: nome ?? this.nome,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'ID': id,
      'UFIBGE': ufibge,
      'UF': uf,
      'NOME': nome,
    };
  }

  factory Estado.fromMap(Map<String, dynamic> map) {
    return Estado(
      id: map['ID'] != null ? map['ID'] as int : null,
      ufibge: map['UFIBGE'] != null ? map['UFIBGE'] as String : null,
      uf: map['UF'] != null ? map['UF'] as String : null,
      nome: map['NOME'] != null ? map['NOME'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Estado.fromJson(String source) => Estado.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Estado(id: $id, ufibge: $ufibge, uf: $uf, nome: $nome)';
  }

  @override
  bool operator ==(covariant Estado other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.ufibge == ufibge &&
      other.uf == uf &&
      other.nome == nome;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      ufibge.hashCode ^
      uf.hashCode ^
      nome.hashCode;
  }
}
