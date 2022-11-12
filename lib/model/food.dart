class Food {
  final String name;
  final String description;
  final double price = 100;
  final List direction;
  final List ingredient;
  final String image;
  final int kcal;
  final int ratings;
  final int servingNumber;
  final int typeOfFood;
  final String toServe;

  const Food({
    this.name,
    this.description,
    this.direction,
    this.ingredient,
    this.image,
    this.kcal,
    this.ratings,
    this.servingNumber,
    this.typeOfFood,
    this.toServe,
  });

  factory Food.fromMap(Map<String, dynamic> map) {
    return Food(
      name: map['name'],
      description: map['description'],
      direction: map['direction'],
      ingredient: map['ingredient'],
      image: map['image'],
      kcal: map['kcal'],
      ratings: map['ratings'],
      servingNumber: map['servingNumber'],
      typeOfFood: map['typeOfFood'],
      toServe: map['toServe'],
    );
  }

  Food copyWith({
    String name,
    String description,
    double price = 100,
    List direction,
    List ingredient,
    String image,
    int kcal,
    int ratings,
    int servingNumber,
    int typeOfFood,
    String toServe,
  }) {
    return Food(
      name: name ?? this.name,
      description: description ?? this.description,
      direction: direction ?? this.direction,
      ingredient: ingredient ?? this.ingredient,
      image: image ?? this.image,
      kcal: kcal ?? this.kcal,
      ratings: ratings ?? this.ratings,
      servingNumber: servingNumber ?? this.servingNumber,
      typeOfFood: typeOfFood ?? this.typeOfFood,
      toServe: toServe ?? this.toServe,
    );
  }
}
