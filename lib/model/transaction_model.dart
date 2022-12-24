// To parse this JSON data, do
//
//     final welcome = welcomeFromMap(jsonString);
//quicktype olan siteden generate ettim -enes
import 'dart:convert';

class TransactionModel {
  TransactionModel({
    required this.id,
    required this.kernelArch,
    required this.uptime,
    required this.hostname,
    required this.platform,
    required this.cpuS,
    required this.memory,
    required this.loadavg,
    required this.moduleVersions,
    required this.createdAt,
    required this.updatedAt,
  });

  final String id;
  final String kernelArch;
  final int uptime;
  final String hostname;
  final String platform;
  final CpuS cpuS;
  final Memory memory;
  final Loadavg loadavg;
  final ModuleVersions moduleVersions;
  final String createdAt;
  final String updatedAt;

  factory TransactionModel.fromJson(String str) =>
      TransactionModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory TransactionModel.fromMap(Map<String, dynamic> json) =>
      TransactionModel(
        id: json["id"],
        kernelArch: json["kernelArch"],
        uptime: json["uptime"],
        hostname: json["hostname"],
        platform: json["platform"],
        cpuS: CpuS.fromMap(json["cpu_s"]),
        memory: Memory.fromMap(json["memory"]),
        loadavg: Loadavg.fromMap(json["loadavg"]),
        moduleVersions: ModuleVersions.fromMap(json["moduleVersions"]),
        createdAt: json["createdAt"],
        updatedAt: json["updatedAt"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "kernelArch": kernelArch,
        "uptime": uptime,
        "hostname": hostname,
        "platform": platform,
        "cpu_s": cpuS.toMap(),
        "memory": memory.toMap(),
        "loadavg": loadavg.toMap(),
        "moduleVersions": moduleVersions.toMap(),
        "createdAt": createdAt,
        "updatedAt": updatedAt,
      };
}

class CpuS {
  CpuS({
    required this.user,
    required this.nice,
    required this.system,
    required this.idle,
  });

  final String user;
  final String nice;
  final String system;
  final String idle;

  factory CpuS.fromJson(String str) => CpuS.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CpuS.fromMap(Map<String, dynamic> json) => CpuS(
        user: json["user"],
        nice: json["nice"],
        system: json["system"],
        idle: json["idle"],
      );

  Map<String, dynamic> toMap() => {
        "user": user,
        "nice": nice,
        "system": system,
        "idle": idle,
      };
}

class Loadavg {
  Loadavg({
    required this.m1,
    required this.m5,
    required this.m15,
  });

  final String m1;
  final String m5;
  final String m15;

  factory Loadavg.fromJson(String str) => Loadavg.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Loadavg.fromMap(Map<String, dynamic> json) => Loadavg(
        m1: json["m1"],
        m5: json["m5"],
        m15: json["m15"],
      );

  Map<String, dynamic> toMap() => {
        "m1": m1,
        "m5": m5,
        "m15": m15,
      };
}

class Memory {
  Memory({
    required this.total,
    required this.free,
    required this.used,
    required this.usage,
  });

  final int total;
  final int free;
  final int used;
  final String usage;

  factory Memory.fromJson(String str) => Memory.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Memory.fromMap(Map<String, dynamic> json) => Memory(
        total: json["total"],
        free: json["free"],
        used: json["used"],
        usage: json["usage"],
      );

  Map<String, dynamic> toMap() => {
        "total": total,
        "free": free,
        "used": used,
        "usage": usage,
      };
}

class ModuleVersions {
  ModuleVersions({
    required this.dependencies,
    required this.devDependencies,
  });

  final Dependencies dependencies;
  final DevDependencies devDependencies;

  factory ModuleVersions.fromJson(String str) =>
      ModuleVersions.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ModuleVersions.fromMap(Map<String, dynamic> json) => ModuleVersions(
        dependencies: Dependencies.fromMap(json["dependencies"]),
        devDependencies: DevDependencies.fromMap(json["devDependencies"]),
      );

  Map<String, dynamic> toMap() => {
        "dependencies": dependencies.toMap(),
        "devDependencies": devDependencies.toMap(),
      };
}

class Dependencies {
  Dependencies({
    required this.axios,
    required this.express,
    required this.uuid,
  });

  final String axios;
  final String express;
  final String uuid;

  factory Dependencies.fromJson(String str) =>
      Dependencies.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Dependencies.fromMap(Map<String, dynamic> json) => Dependencies(
        axios: json["axios"],
        express: json["express"],
        uuid: json["uuid"],
      );

  Map<String, dynamic> toMap() => {
        "axios": axios,
        "express": express,
        "uuid": uuid,
      };
}

class DevDependencies {
  DevDependencies({
    required this.nodemon,
  });

  final String nodemon;

  factory DevDependencies.fromJson(String str) =>
      DevDependencies.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory DevDependencies.fromMap(Map<String, dynamic> json) => DevDependencies(
        nodemon: json["nodemon"],
      );

  Map<String, dynamic> toMap() => {
        "nodemon": nodemon,
      };
}
