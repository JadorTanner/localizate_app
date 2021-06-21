String capitalize(string, {all = false}) {
  var finalString = "";
  if (all) {
    var splitted = string.split(" ");
    for (var i = 0; i < splitted.length; i++) {
      finalString +=
          "${splitted[i][0].toUpperCase()}${splitted[i].substring(1)} ";
    }
  } else {
    finalString = "${string[0].toUpperCase()}${string.substring(1)}";
  }
  return finalString;
}
