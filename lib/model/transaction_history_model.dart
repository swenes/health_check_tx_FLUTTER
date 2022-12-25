class TransactionHistoryModel {
  final String createdAt;
  final String updatetAt;

  final int uptime;
  //cpu
  final String user;
  final String nice;
  final String system;
  final String idle;
  //ram
  final int total;
  final int free;
  final int used;
  final String usage;
  //loadavg
  final String m1;
  final String m5;
  final String m15;

  TransactionHistoryModel(
      this.createdAt,
      this.updatetAt,
      this.uptime,
      this.user,
      this.nice,
      this.system,
      this.idle,
      this.total,
      this.free,
      this.used,
      this.usage,
      this.m1,
      this.m5,
      this.m15);
}
