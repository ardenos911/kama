

bool isThirtyDaysPassed(int date1, int date2)
{

  DateTime dateTime1 = DateTime.fromMillisecondsSinceEpoch(date1);

  DateTime dateTime2 = DateTime.fromMillisecondsSinceEpoch(date2);

  Duration difference = dateTime1.difference(dateTime2);

  return difference.inDays >= 4;
}