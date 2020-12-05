class SectionItem {

  SectionItem.fromMap(Map<String, dynamic> map){
    image = map['image'] as String;
    person = map['person'] as String;
    category = map['category'] as String;
    name = map['name'] as String;
    career = map['career'] as String;
  }

  String image;
  String person;
  String category;
  String name;
  String career;

  @override
  String toString() {
    return 'SectionItem{image: $image, person: $person, category: $category}';
  }
}