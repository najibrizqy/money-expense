class Expense {
  int? id;
  String name;
  String category;
  String date;
  int amount;

  Expense({
    this.id,
    required this.name,
    required this.category,
    required this.date,
    required this.amount,
  });

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'name': name,
      'category': category,
      'date': date,
      'amount': amount,
    };
    if (id != null) {
      map['id'] = id;
    }
    return map;
  }

  factory Expense.fromMap(Map<String, dynamic> map) {
    return Expense(
      id: map['id'],
      name: map['name'],
      category: map['category'],
      date: map['date'],
      amount: map['amount'],
    );
  }
}
