class HumoresModel {
  late int _id;
  late String _humor;
  late bool _ativo;

  HumoresModel({required int id, required String humor, required bool ativo}) {
    this._id = id;
    this._humor = humor;
    this._ativo = ativo;
  }

  HumoresModel.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _humor = json['humor'];
    _ativo = json['ativo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['humor'] = this._humor;
    data['ativo'] = this._ativo;
    return data;
  }
}
