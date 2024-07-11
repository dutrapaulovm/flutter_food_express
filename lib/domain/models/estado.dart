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
      'id': id,
      'ufibge': ufibge,
      'uf': uf,
      'nome': nome,
    };
  }

  factory Estado.fromMap(Map<String, dynamic> map) {
    return Estado(
      id: map['id'] != null ? map['id'] as int : null,
      ufibge: map['ufibge'] != null ? map['ufibge'] as String : null,
      uf: map['uf'] != null ? map['uf'] as String : null,
      nome: map['nome'] != null ? map['nome'] as String : null,
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
