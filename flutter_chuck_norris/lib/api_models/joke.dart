class Joke {
  String iconUrl;
  String id;
  String url;
  String value;

  Joke({this.iconUrl, this.id, this.url, this.value});

  Joke.fromJson(Map<String, dynamic> json) {
    iconUrl = json['icon_url'];
    id = json['id'];
    url = json['url'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['icon_url'] = this.iconUrl;
    data['id'] = this.id;
    data['url'] = this.url;
    data['value'] = this.value;
    return data;
  }
}