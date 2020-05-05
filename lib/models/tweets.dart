class Tweets {
  List<Documents> documents;

  Tweets({this.documents});

  Tweets.fromJson(Map<String, dynamic> json) {
    if (json['documents'] != null) {
      documents = new List<Documents>();
      json['documents'].forEach((v) {
        documents.add(new Documents.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.documents != null) {
      data['documents'] = this.documents.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Documents {
  Id iId;
  String tweetId;
  String tweet;
  String username;
  String profileImageUrl;
  String pnr;
  Timestamp timestamp;

  Documents(
      {this.iId,
      this.tweetId,
      this.tweet,
      this.username,
      this.profileImageUrl,
      this.pnr,
      this.timestamp});

  Documents.fromJson(Map<String, dynamic> json) {
    iId = json['_id'] != null ? new Id.fromJson(json['_id']) : null;
    tweetId = json['tweet_id'];
    tweet = json['tweet'];
    username = json['username'];
    profileImageUrl = json['profile_image_url'];
    pnr = json['pnr'];
    timestamp = json['timestamp'] != null
        ? new Timestamp.fromJson(json['timestamp'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.iId != null) {
      data['_id'] = this.iId.toJson();
    }
    data['tweet_id'] = this.tweetId;
    data['tweet'] = this.tweet;
    data['username'] = this.username;
    data['profile_image_url'] = this.profileImageUrl;
    data['pnr'] = this.pnr;
    if (this.timestamp != null) {
      data['timestamp'] = this.timestamp.toJson();
    }
    return data;
  }
}

class Id {
  String oid;

  Id({this.oid});

  Id.fromJson(Map<String, dynamic> json) {
    oid = json['\$oid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['\$oid'] = this.oid;
    return data;
  }
}

class Timestamp {
  Date date;

  Timestamp({this.date});

  Timestamp.fromJson(Map<String, dynamic> json) {
    date = json['\$date'] != null ? new Date.fromJson(json['\$date']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.date != null) {
      data['\$date'] = this.date.toJson();
    }
    return data;
  }
}

class Date {
  String numberLong;

  Date({this.numberLong});

  Date.fromJson(Map<String, dynamic> json) {
    numberLong = json['\$numberLong'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['\$numberLong'] = this.numberLong;
    return data;
  }
}
