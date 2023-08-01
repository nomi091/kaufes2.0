class TagModel {
  final String name;
  final List<String> subTags;
  bool isSelected;

  TagModel(this.name, {this.subTags = const [],this.isSelected=false});
}