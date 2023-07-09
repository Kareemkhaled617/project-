class ToDo{
  String? id;
  String? todotext;
  bool isdone;

  ToDo({
    required this.id,
    required this.todotext,
    this.isdone=false,
});
  static List<ToDo> list1(){
    return[
      ToDo(id:'01',todotext: 'morning exercise',),


    ];
  }
}