class RepositoryLiscence {
  String? key;
  String? name;
  String? spdxId;
  String? url;
  String? nodeId;

  RepositoryLiscence({
    this.key,
    this.name,
    this.spdxId,
    this.url,
    this.nodeId,
  });

  RepositoryLiscence.fromJson(Map<String, dynamic> json) {
    key = json['key'];
    name = json['name'];
    spdxId = json['spdx_id'];
    url = json['url'];
    nodeId = json['node_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['key'] = key;
    data['name'] = name;
    data['spdx_id'] = spdxId;
    data['url'] = url;
    data['node_id'] = nodeId;
    return data;
  }
}
