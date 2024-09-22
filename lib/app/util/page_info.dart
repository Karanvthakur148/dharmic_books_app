
class PaginateInfo{
  final int? pageSize;
  final int page;
  final int? previous;
  final int? next;
  final int? count;
  final bool? showLoad;

  const PaginateInfo({
    required this.page,
    this.pageSize,
    this.previous,
    this.next,
    this.count,
    this.showLoad,
  });
}