class CommonFunctions {
  List<int> searchByStart(List<int> items) {
    for (int i = 0; i < items.length; i++) {
      items.sort();
    }
    return items.reversed.toList();
  }

  List<DateTime> searchByDates(List<DateTime> dates) {
    for (int i = 0; i < dates.length; i++) {
      dates.sort((a, b) => b.compareTo(a));
    }
    return dates;
  }
}
