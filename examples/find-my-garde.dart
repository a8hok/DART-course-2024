String studentavg(int math, int eng, int science, int history) {
  int totalscore = math + eng + science + history;
  double avgscore = totalscore / 4;
  String finalgrade = findmygrade(avgscore);
  return finalgrade;
}

String getmygrade(String grade) {
  switch (grade) {
    case "A":
      return ('your grade is A! Good job!');
    case "B":
      return ('your grade is B! So close!');
    case "C":
      return ('your grade is C! Better luck next time!');
    case "D":
      return ('your grade is D! Aim for at least a B next time!');
    case "F":
      return ('ur dumb...you failed :O');
    default:
      return ("Sorry, no grade for u.");
  }
}

String findmygrade(double avgscore) {
  print('your average score is $avgscore');
  // 65.5<=100 && 65.5>=90
  if (avgscore <= 100 && avgscore >= 90) {
    //print('your grade is A! Good job!');
    String grademessage = getmygrade("A");
    return grademessage;
  } else if (avgscore < 90 && avgscore >= 80) {
    //print('your grade is B! So close!');
    String grademessage = getmygrade("B");
    return grademessage;
  } else if (avgscore < 80 && avgscore >= 70) {
    //print('your grade is C! Better luck next time!');
    String grademessage = getmygrade("C");
    return grademessage;
  } else if (avgscore < 70 && avgscore >= 50) {
    //print('your grade is D! Aim for at least a B next time!');
    String grademessage = getmygrade("D");
    return grademessage;
  } else {
    //print('ur dumb...you failed :O');
    String grademessage = getmygrade("F");
    return grademessage;
  }
}

void main() {
  String scoremessage = studentavg(80, 74, 97, 78);
  print(scoremessage);
}
