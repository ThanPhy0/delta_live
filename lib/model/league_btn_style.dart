class LeagueBtnStyle {
  String setLeagueBackground(String league) {
    switch (league) {
      case "AFC":
        return "images/leagues/afc.png";
      case "Carabao Cup":
        return "images/leagues/carabao.png";
      default:
        return "images/leagues/afc.png";
    }
  }
}
