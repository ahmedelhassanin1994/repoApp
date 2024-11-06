

class ModelCommits {
  String? sha;
  String? nodeId;
  Commit? commit;
  String? url;
  String? htmlUrl;
  String? commentsUrl;

  ModelCommits(
      {this.sha,
        this.nodeId,
        this.commit,
        this.url,
        this.htmlUrl,
        this.commentsUrl,});

  ModelCommits.fromJson(Map<String, dynamic> json) {
    sha = json['sha'];
    nodeId = json['node_id'];
    commit =
    json['commit'] != null ? new Commit.fromJson(json['commit']) : null;
    url = json['url'];
    htmlUrl = json['html_url'];
    commentsUrl = json['comments_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sha'] = this.sha;
    data['node_id'] = this.nodeId;
    if (this.commit != null) {
      data['commit'] = this.commit!.toJson();
    }
    data['url'] = this.url;
    data['html_url'] = this.htmlUrl;
    data['comments_url'] = this.commentsUrl;
    return data;
  }
}

class Commit {

  String? message;
  String? url;
  int? commentCount;

  Commit(
      {
        this.message,
        this.url,
        this.commentCount,
       });

  Commit.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    url = json['url'];
    commentCount = json['comment_count'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['message'] = this.message;
    data['url'] = this.url;
    data['comment_count'] = this.commentCount;
    return data;
  }
}

