
class LoginModel {
    User? user;
    Token? token;

    LoginModel({this.user, this.token});

    LoginModel.fromJson(Map<String, dynamic> json) {
        if(json["user"] is Map) {
            user = json["user"] == null ? null : User.fromJson(json["user"]);
        }
        if(json["token"] is Map) {
            token = json["token"] == null ? null : Token.fromJson(json["token"]);
        }
    }

    static List<LoginModel> fromList(List<Map<String, dynamic>> list) {
        return list.map((map) => LoginModel.fromJson(map)).toList();
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        if(user != null) {
            _data["user"] = user?.toJson();
        }
        if(token != null) {
            _data["token"] = token?.toJson();
        }
        return _data;
    }

    LoginModel copyWith({
        User? user,
        Token? token,
    }) => LoginModel(
        user: user ?? this.user,
        token: token ?? this.token,
    );
}

class Token {
    String? access;
    String? refresh;
    int? accessExpires;

    Token({this.access, this.refresh, this.accessExpires});

    Token.fromJson(Map<String, dynamic> json) {
        if(json["access"] is String) {
            access = json["access"];
        }
        if(json["refresh"] is String) {
            refresh = json["refresh"];
        }
        if(json["accessExpires"] is num) {
            accessExpires = (json["accessExpires"] as num).toInt();
        }
    }

    static List<Token> fromList(List<Map<String, dynamic>> list) {
        return list.map((map) => Token.fromJson(map)).toList();
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["access"] = access;
        _data["refresh"] = refresh;
        _data["accessExpires"] = accessExpires;
        return _data;
    }

    Token copyWith({
        String? access,
        String? refresh,
        int? accessExpires,
    }) => Token(
        access: access ?? this.access,
        refresh: refresh ?? this.refresh,
        accessExpires: accessExpires ?? this.accessExpires,
    );
}

class User {
    String? avatar;
    String? collectionId;
    String? collectionName;
    String? created;
    String? email;
    bool? emailVisibility;
    String? employee;
    String? id;
    String? name;
    String? refresh;
    List<String>? role;
    String? updated;
    String? username;
    bool? verified;

    User({this.avatar, this.collectionId, this.collectionName, this.created, this.email, this.emailVisibility, this.employee, this.id, this.name, this.refresh, this.role, this.updated, this.username, this.verified});

    User.fromJson(Map<String, dynamic> json) {
        if(json["avatar"] is String) {
            avatar = json["avatar"];
        }
        if(json["collectionId"] is String) {
            collectionId = json["collectionId"];
        }
        if(json["collectionName"] is String) {
            collectionName = json["collectionName"];
        }
        if(json["created"] is String) {
            created = json["created"];
        }
        if(json["email"] is String) {
            email = json["email"];
        }
        if(json["emailVisibility"] is bool) {
            emailVisibility = json["emailVisibility"];
        }
        if(json["employee"] is String) {
            employee = json["employee"];
        }
        if(json["id"] is String) {
            id = json["id"];
        }
        if(json["name"] is String) {
            name = json["name"];
        }
        if(json["refresh"] is String) {
            refresh = json["refresh"];
        }
        if(json["role"] is List) {
            role = json["role"] == null ? null : List<String>.from(json["role"]);
        }
        if(json["updated"] is String) {
            updated = json["updated"];
        }
        if(json["username"] is String) {
            username = json["username"];
        }
        if(json["verified"] is bool) {
            verified = json["verified"];
        }
    }

    static List<User> fromList(List<Map<String, dynamic>> list) {
        return list.map((map) => User.fromJson(map)).toList();
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["avatar"] = avatar;
        _data["collectionId"] = collectionId;
        _data["collectionName"] = collectionName;
        _data["created"] = created;
        _data["email"] = email;
        _data["emailVisibility"] = emailVisibility;
        _data["employee"] = employee;
        _data["id"] = id;
        _data["name"] = name;
        _data["refresh"] = refresh;
        if(role != null) {
            _data["role"] = role;
        }
        _data["updated"] = updated;
        _data["username"] = username;
        _data["verified"] = verified;
        return _data;
    }

    User copyWith({
        String? avatar,
        String? collectionId,
        String? collectionName,
        String? created,
        String? email,
        bool? emailVisibility,
        String? employee,
        String? id,
        String? name,
        String? refresh,
        List<String>? role,
        String? updated,
        String? username,
        bool? verified,
    }) => User(
        avatar: avatar ?? this.avatar,
        collectionId: collectionId ?? this.collectionId,
        collectionName: collectionName ?? this.collectionName,
        created: created ?? this.created,
        email: email ?? this.email,
        emailVisibility: emailVisibility ?? this.emailVisibility,
        employee: employee ?? this.employee,
        id: id ?? this.id,
        name: name ?? this.name,
        refresh: refresh ?? this.refresh,
        role: role ?? this.role,
        updated: updated ?? this.updated,
        username: username ?? this.username,
        verified: verified ?? this.verified,
    );
}