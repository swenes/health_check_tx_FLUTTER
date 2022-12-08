// To parse this JSON data, do
//
//     final transactionModel = transactionModelFromMap(jsonString);

import 'dart:convert';

TransactionModel transactionModelFromMap(String str) =>
    TransactionModel.fromMap(json.decode(str));

String transactionModelToMap(TransactionModel data) =>
    json.encode(data.toMap());

class TransactionModel {
  TransactionModel({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.kernelArch,
    required this.uptime,
    required this.hostname,
    required this.platform,
    required this.cpuS,
    required this.memory,
    required this.loadavg,
    required this.moduleVersions,
  });

  final String id;
  final String createdAt;
  final String updatedAt;
  final String kernelArch;
  final int uptime;
  final String hostname;
  final String platform;
  final List<Cpu> cpuS;
  final Memory memory;
  final List<double> loadavg;
  final ModuleVersions moduleVersions;

  factory TransactionModel.fromMap(Map<String, dynamic> json) =>
      TransactionModel(
        id: json["id"],
        createdAt: json["createdAt"],
        updatedAt: json["updatedAt"],
        kernelArch: json["kernelArch"],
        uptime: json["uptime"],
        hostname: json["hostname"],
        platform: json["platform"],
        cpuS: List<Cpu>.from(json["cpu_s"].map((x) => Cpu.fromMap(x))),
        memory: Memory.fromMap(json["memory"]),
        loadavg: List<double>.from(json["loadavg"].map((x) => x.toDouble())),
        moduleVersions: ModuleVersions.fromMap(json["moduleVersions"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "createdAt": createdAt,
        "updatedAt": updatedAt,
        "kernelArch": kernelArch,
        "uptime": uptime,
        "hostname": hostname,
        "platform": platform,
        "cpu_s": List<dynamic>.from(cpuS.map((x) => x.toMap())),
        "memory": memory.toMap(),
        "loadavg": List<dynamic>.from(loadavg.map((x) => x)),
        "moduleVersions": moduleVersions.toMap(),
      };
}

class Cpu {
  Cpu({
    required this.model,
    required this.speed,
    required this.times,
  });

  final String model;
  final int speed;
  final Times times;

  factory Cpu.fromMap(Map<String, dynamic> json) => Cpu(
        model: json["model"],
        speed: json["speed"],
        times: Times.fromMap(json["times"]),
      );

  Map<String, dynamic> toMap() => {
        "model": model,
        "speed": speed,
        "times": times.toMap(),
      };
}

class Times {
  Times({
    required this.user,
    required this.nice,
    required this.sys,
    required this.idle,
    required this.irq,
  });

  final int user;
  final int nice;
  final int sys;
  final int idle;
  final int irq;

  factory Times.fromMap(Map<String, dynamic> json) => Times(
        user: json["user"],
        nice: json["nice"],
        sys: json["sys"],
        idle: json["idle"],
        irq: json["irq"],
      );

  Map<String, dynamic> toMap() => {
        "user": user,
        "nice": nice,
        "sys": sys,
        "idle": idle,
        "irq": irq,
      };
}

class Memory {
  Memory({
    required this.free,
    required this.total,
    required this.used,
  });

  final int free;
  final int total;
  final String used;

  factory Memory.fromMap(Map<String, dynamic> json) => Memory(
        free: json["free"],
        total: json["total"],
        used: json["used"],
      );

  Map<String, dynamic> toMap() => {
        "free": free,
        "total": total,
        "used": used,
      };
}

class ModuleVersions {
  ModuleVersions({
    required this.dependencies,
    required this.devDependencies,
  });

  final Dependencies dependencies;
  final DevDependencies devDependencies;

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
    required this.express,
    required this.uuid,
  });

  final String express;
  final String uuid;

  factory Dependencies.fromMap(Map<String, dynamic> json) => Dependencies(
        express: json["express"],
        uuid: json["uuid"],
      );

  Map<String, dynamic> toMap() => {
        "express": express,
        "uuid": uuid,
      };
}

class DevDependencies {
  DevDependencies({
    required this.nodemon,
  });

  final String nodemon;

  factory DevDependencies.fromMap(Map<String, dynamic> json) => DevDependencies(
        nodemon: json["nodemon"],
      );

  Map<String, dynamic> toMap() => {
        "nodemon": nodemon,
      };
}
