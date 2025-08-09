import '../data/enum.dart';

class StrategyMatrix {
  static Map<Strategy, Map<Strategy, int>> matrix = {
    Strategy.offensive: {
      Strategy.offensive: 5,
      Strategy.defensive: -5,
      Strategy.balanced: 3,
      Strategy.counterAttack: -8,
      Strategy.pressing: 7,
      Strategy.parkTheBus: -10,
    },
    Strategy.defensive: {
      Strategy.offensive: 10,
      Strategy.defensive: 0,
      Strategy.balanced: 2,
      Strategy.counterAttack: 8,
      Strategy.pressing: -5,
      Strategy.parkTheBus: 5,
    },
    Strategy.balanced: {
      Strategy.offensive: -3,
      Strategy.defensive: -2,
      Strategy.balanced: 7,
      Strategy.counterAttack: 4,
      Strategy.pressing: 2,
      Strategy.parkTheBus: 3,
    },
    Strategy.counterAttack: {
      Strategy.offensive: 12,
      Strategy.defensive: -8,
      Strategy.balanced: -4,
      Strategy.counterAttack: 0,
      Strategy.pressing: -10,
      Strategy.parkTheBus: 8,
    },
    Strategy.pressing: {
      Strategy.offensive: -7,
      Strategy.defensive: 8,
      Strategy.balanced: -2,
      Strategy.counterAttack: 15,
      Strategy.pressing: -5,
      Strategy.parkTheBus: -15,
    },
    Strategy.parkTheBus: {
      Strategy.offensive: 15,
      Strategy.defensive: -5,
      Strategy.balanced: -3,
      Strategy.counterAttack: -8,
      Strategy.pressing: 20,
      Strategy.parkTheBus: -10,
    },
  };
  static int getStrategyBonus(Strategy myStrategy, Strategy opponentStrategy) {
    return matrix[myStrategy]?[opponentStrategy] ?? 0;
  }

  static Map<String, int> getBothStrategyBonuses({
    required Strategy myStrategy,
    required Strategy opponentStrategy,
  }) {
    int myBonus = matrix[myStrategy]?[opponentStrategy] ?? 0;
    int opponentBonus = matrix[opponentStrategy]?[myStrategy] ?? 0;
    return {"myBonus": myBonus, "opponentBonus": opponentBonus};
  }

  static void displayMatrix() {
    print("\n📊 STRATEGY EFFECTIVENESS MATRIX:");
    print("(Positive numbers = advantage, Negative = disadvantage)");
    print("-" * 60);

    for (Strategy strategy in Strategy.values) {
      print("${strategy.name.toUpperCase()}:");
      for (Strategy opponent in Strategy.values) {
        int bonus = getStrategyBonus(strategy, opponent);
        String sign = bonus >= 0 ? "+" : "";
        print("  vs ${opponent.name}: $sign$bonus");
      }
      print("");
    }
  }
}
