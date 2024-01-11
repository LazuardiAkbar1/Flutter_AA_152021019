class ToDo {
  String? id;
  String? todoText;
  bool isDone;

  ToDo({
    required this.id,
    required this.todoText,
    this.isDone = false,
  });

  static List<ToDo> todoList() {
    return [
      ToDo(id: '01', todoText: 'Ujian Pagi', isDone: true ),
      ToDo(id: '02', todoText: 'Membeli Perlengkapan', isDone: true ),
      ToDo(id: '03', todoText: 'Mengecek Email', ),
      ToDo(id: '04', todoText: 'Ketemu Client', ),
      ToDo(id: '05', todoText: 'Belajar Untuk Besok', ),
      ToDo(id: '06', todoText: 'Makan Malem Bareng Pacar', ),
    ];
  }
}