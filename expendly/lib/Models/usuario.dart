
class usuario
{
  int _id;
  String _name;
  String _apellidoP;
  String _apeliidoM;
  DateTime _fechaNac;
  String _correo;

  usuario(this._name, this._apellidoP, this._apeliidoM, this._fechaNac, this._correo);

  usuario.conID(this._id, this._name, this._apellidoP, this._apeliidoM, this._fechaNac, this._correo);

  //Gets
  int get id => _id;
  String get name => _name;
  String get apellidoP => _apellidoP;
  String get apellidoM => _apellidoP;
  DateTime get fechaNac => _fechaNac;
  String get correo => _correo;

  //Sets
  set id(int newID)
  { this._id = newID; }
  
  set name(String newName)
  { this._name = newName; }

  set apellidoP(String newApellidoP)
  { this._apellidoP = newApellidoP; }

  set apellidoM(String newApellidoM)
  { this._apeliidoM = newApellidoM; }

  set fechaNac(DateTime newFechaNac)
  { this._fechaNac = newFechaNac; }

  set correo(String newCorreo)
  { this._correo = newCorreo; }

  //Convertir objeto usuario a objeto MAP
  Map<String, dynamic> toMap()
  {
    var map = Map<String, dynamic>();
    if(id != null)
    { map['id'] = _id; } 
    map['name'] = _name;
    map['apellidoP'] = _apellidoP;
    map['apellidoM'] = _apeliidoM;
    map['fechaNac'] = _fechaNac;
    map['correo'] = _correo;

    return map;
  }

  //Regresar objeto usuario de objeto MAP
  usuario.fromMapObject(Map<String, dynamic> map)
  {
    this._id = map['id'];
    this._name = map['name'];
    this._apellidoP = map['apellidoP'];
    this._apeliidoM = map['apellidoM'];
    this._fechaNac = map['fechaNac'];
    this._correo = map['correo'];
  }
}