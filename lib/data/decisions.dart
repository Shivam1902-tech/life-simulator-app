import '../models/decision.dart';

final List<Decision> decisions = [
  Decision(
    title: 'What will you do after dinner?',
    options: [
      DecisionOption(
  label: 'Study for 2 hours',
  energyChange: -20,     // tiring
  careerChange: 12,      // strong benefit
  happinessChange: -5,   // not always fun
),

      DecisionOption(
  label: 'Scroll social media',
  energyChange: -15,     // drains you
  happinessChange: 6,    // feels good now
  careerChange: -8,      // long-term damage
),

      DecisionOption(
        label: 'Sleep early',
        energyChange: 10,
        healthChange: 5,
      ),
    ],
  ),
  Decision(
    title: 'It’s morning. Your choice?',
    options: [
      DecisionOption(
        label: 'Go to the gym',
        healthChange: 10,
        energyChange: -5,
        happinessChange: 5,
      ),
      DecisionOption(
  label: 'Skip workout',
  energyChange: 5,       // feels easy
  healthChange: -8,      // body pays
  happinessChange: -3,   // guilt
),

    ],
  ),Decision(
  title: 'It’s afternoon. How do you spend your time?',
  options: [
    DecisionOption(
      label: 'Learn a new skill',
      energyChange: -15,
      careerChange: 10,
      happinessChange: -3,
    ),
    DecisionOption(
      label: 'Take a long nap',
      energyChange: 10,
      careerChange: -4,
    ),
    DecisionOption(
      label: 'Watch random videos',
      energyChange: -10,
      happinessChange: 5,
      careerChange: -6,
    ),
  ],
),Decision(
  title: 'You received some extra money. What do you do?',
  options: [
    DecisionOption(
      label: 'Save it',
      moneyChange: 10,
      happinessChange: -2,
    ),
    DecisionOption(
      label: 'Spend on gadgets',
      moneyChange: -8,
      happinessChange: 6,
    ),
    DecisionOption(
      label: 'Invest in learning',
      moneyChange: -5,
      careerChange: 8,
    ),
  ],
),Decision(
  title: 'Friends ask you to hang out. Your response?',
  options: [
    DecisionOption(
      label: 'Go out with friends',
      happinessChange: 8,
      energyChange: -5,
    ),
    DecisionOption(
      label: 'Decline and work',
      careerChange: 6,
      happinessChange: -4,
    ),
    DecisionOption(
      label: 'Stay home and rest',
      energyChange: 6,
      happinessChange: 2,
    ),
  ],
),



];
