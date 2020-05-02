class Label {
  final String id;
  final String name;
  final String parentId;

  Label({
    this.id,
    this.name,
    this.parentId,
  }) {
    ArgumentError.checkNotNull(id, 'id');
    ArgumentError.checkNotNull(name, 'name');
    ArgumentError.checkNotNull(parentId, 'parentId');
  }

  /// Function generates a Label object from the JSOn returned from API
  ///
  /// @param json The JSOn object got from API
  /// @param param2 Parameter description
  /// @returns The Label object generated from API's returned JSON.
  /// @throws Throws an ArgumentError related to the Label's constructor's missing parameters
  static Label fromJSON(Map<String, dynamic> json) {
    return Label(
      id: json['id'],
      name: json['name'],
      parentId: json['parent_id'],
    );
  }

  /// Function returns the String representation of the Label object
  ///
  /// @returns The string representation of the Label object
  @override
  String toString() {
    var result = '';
    result += 'Id: ${id}\n';
    result += 'Name: ${name}\n';
    result += 'Parent id: ${parentId}';
    return result;
  }
}
