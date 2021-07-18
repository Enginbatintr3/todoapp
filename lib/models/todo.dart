class Todo {
  int _id;
  String _title;
  String _description;
  String _date;
  int _priority;

  Todo(this._title, this._priority, this._date, [this._description]);
  Todo.withId(this._id, this._title, this._priority, this._date,
      [this._description]);

  int get id => _id;
  String get title => _title;
  String get description => _description;
  int get priority => _priority;
  String get date => _date;

  set title(String newTitle) {
    if (newTitle.length <= 255) {
      _title = newTitle;
    }
  }

  set description(String newD) {
    if (newD.length <= 255) {
      _description = newD;
    }
  }

  set priority(int newP) {
    if (newP > 0) {
      _priority = newP;
    }
  }

  set date(String newD) {
    _date = newD;
  }

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{};
    map["title"] = _title;
    map["description"] = _description;
    map["priority"] = _priority;
    map["date"] = _date;
    if (_id != null) {
      map["id"] = _id;
    }
    return map;
  }

  Todo.fromObject(dynamic o) {
    _id = o["id"];
    _title = o["title"];
    _description = o["description"];
    _priority = o["priority"];
    _date = o["date"];
  }
}
