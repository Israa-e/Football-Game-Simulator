enum Positions {
  goalkeeper,
  rightBack,
  centralDefender,
  leftBack,
  rightMidfielder,
  centralMidfielder,
  leftMidfielder,
  rightWinger,
  leftWinger,
  striker,
  attackingMidfielder,
  sub,
}

enum Strategy {
  offensive,
  defensive,
  balanced,
  counterAttack,
  pressing,
  parkTheBus,
}

enum Weather { sunny, rainy, windy, snowy }

enum EventType { goal, yellowCard, redCard, injury, substitution }

enum Skills { passing, shooting, dribbling, defending }

enum FootballPlayer {
  messi,
  ronaldo,
  neymar,
  mbappe,
  salah,
  kane,
  deBruyne,
  modric,
  pogba,
  aguero,
  suarez,
  vardy,
  mane,
  hazard,
  lewandowski,
  sterling,
  ozil,
  coutinho,
  benzema,
  milito,
  cavani,
  gerrard,
  lampard,
  pirlo,
  ramos,
  pique,
  alves,
  thiago,
  davidVilla,
}

enum TrainerName {
  zidane,
  klopp,
  guardiola,
  mourinho,
  ancelotti,
  conte,
  pochetino,
  gerrard,
  pellegrini,
  low,
  allegri,
  sarri,
  simeone,
  moura,
  vanGaal,
  valverde,
  totti,
  lumor,
  tenHag,
  favre,
  koeman,
  santos,
  redknapp,
  beckham,
  cantona,
  beck,
  haaland,
  mourad,
  capello,
  martinez,
}

enum FootballTeamName {
  realMadrid,
  barcelona,
  manchesterUnited,
  liverpool,
  chelsea,
  juventus,
  bayernMunich,
  parisSaintGermain,
  atleticoMadrid,
  ajax,
}

final Map<FootballTeamName, String> teamCities = {
  FootballTeamName.realMadrid: 'Madrid',
  FootballTeamName.barcelona: 'Barcelona',
  FootballTeamName.manchesterUnited: 'Manchester',
  FootballTeamName.liverpool: 'Liverpool',
  FootballTeamName.chelsea: 'London',
  FootballTeamName.juventus: 'Turin',
  FootballTeamName.bayernMunich: 'Munich',
  FootballTeamName.parisSaintGermain: 'Paris',
  FootballTeamName.atleticoMadrid: 'Madrid',
  FootballTeamName.ajax: 'Amsterdam',
};
final Map<FootballTeamName, String> teamMottos = {
  FootballTeamName.realMadrid: 'Hala Madrid y nada más',
  FootballTeamName.barcelona: 'Més que un club',
  FootballTeamName.manchesterUnited: 'Glory Glory Man United',
  FootballTeamName.liverpool: 'You’ll Never Walk Alone',
  FootballTeamName.chelsea: 'Blue is the Colour',
  FootballTeamName.juventus: 'Fino alla fine',
  FootballTeamName.bayernMunich: 'Mia San Mia',
  FootballTeamName.parisSaintGermain: 'Dream Bigger',
  FootballTeamName.atleticoMadrid: 'Nunca dejes de creer',
  FootballTeamName.ajax: 'Een keer Ajax, altijd Ajax',
};
final Map<FootballTeamName, String> teamMascots = {
  FootballTeamName.realMadrid: 'None',
  FootballTeamName.barcelona: 'None',
  FootballTeamName.manchesterUnited: 'Fred the Red',
  FootballTeamName.liverpool: 'Mighty Red',
  FootballTeamName.chelsea: 'Stamford the Lion',
  FootballTeamName.juventus: 'Zebra',
  FootballTeamName.bayernMunich: 'Berni the Bear',
  FootballTeamName.parisSaintGermain: 'Germain the Lynx',
  FootballTeamName.atleticoMadrid: 'Indi the Bear',
  FootballTeamName.ajax: 'Lucky Lynx',
};

final Map<FootballTeamName, String> teamColors = {
  FootballTeamName.realMadrid: 'White',
  FootballTeamName.barcelona: 'Blue and Red',
  FootballTeamName.manchesterUnited: 'Red',
  FootballTeamName.liverpool: 'Red',
  FootballTeamName.chelsea: 'Blue',
  FootballTeamName.juventus: 'Black and White',
  FootballTeamName.bayernMunich: 'Red and White',
  FootballTeamName.parisSaintGermain: 'Blue, Red and White',
  FootballTeamName.atleticoMadrid: 'Red and White',
  FootballTeamName.ajax: 'Red and White',
};

enum Nationalities {
  egyptian,
  saudi,
  emirati,
  tunisian,
  algerian,
  moroccan,
  sudanese,
  libyan,
  jordanian,
  lebanese,
}

enum StadiumName {
  nationalArena,
  grandStadium,
  victoryField,
  eaglePark,
  sunsetDome,
  championGround,
  libertyStadium,
  royalArena,
  galaxyField,
  heritagePark,
}

enum Location {
  newYork,
  london,
  madrid,
  paris,
  berlin,
  rome,
  tokyo,
  moscow,
  sydney,
  dubai,
}
