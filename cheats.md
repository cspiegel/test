## Introduction

This page gathers cheats for various games that can be employed using Bocfel's cheat system.  In a few places, the value 65535 is used and might appear to be out of place.  When interpreted as a negative value on a 16-bit system (like the Z-machine), 65535 represents -1.  For cheats, however, only unsigned (non-negative) values are used, so for negative values, they must be “encoded” as positive values.

**Please note**: These cheats have not been thoroughly tested, or tested much at all.  Use at your own risk.  There is no guarantee that a game will be completable if these cheats are used.

For help on discovering cheats, please see [Finding Cheats](finding_cheats.md).

## Games

### All version 1-3 games

Version 1 and 2 games are *score* games, and version 3 games are either *score* or *time* games.  *Score* games keep track of a user's score and number of moves (e.g. *Enchanter*), while *time* games keep track of the time (e.g. *Wishbringer*).  The same memory locations are always used to store these, so the following cheats apply to all version 1-3 games.

For *score* games, the score is kept in global variable G01 and the number of moves is kept in global variable G02.

For *time* games, the hour (in the range [0, 23]) is kept in global variable G01 and the minutes (in the range [0, 59]) are kept in global variable G02.

### Examples

```
# Lock the score at 50.
cheat = freezew:G01:50

# Lock the number of moves at 25.
cheat = freezew:G02:25

# Lock the time at 5:45PM.
cheat = freezew:G01:17
cheat = freezew:G02:45
```

### Cutthroats

These cheats are for Cutthroats version 23-840809.

#### Hunger

The global variable Gb9 tracks hunger.  It can take the following values:
* 0: Not hungry.
* 1: A bit hungry.
* 2: Pretty hungry.
* 3: Very hungry.
* 4: Extremely hungry.

```
cheat = freezew:Gb9:0
```

#### Thirst

The global variable G07 tracks thirst.  It can take the following values:
* 0: Not thirsty.
* 1: A little thirsty.
* 2: Fairly thirsty.
* 3: Very thirsty.
* 4: Utterly parched.

```
cheat = freezew:G07:0
```

#### Sleepiness

The global variable Gba tracks sleepiness.  It can take the following values:
* 0: Half awake.
* 1: Wide awake (cannot sleep, even in bed).
* 2: Wide awake (but can still sleep in bed).
* 3: A bit drowsy.
* 4: Fairly tired.
* 5: Very sleepy.
* 6: Dead on your feet.

```
cheat = freezew:Gba:1
```

### Enchanter

These cheats are for Enchanter version 29-860820.

#### Hunger

The global variable G40 tracks hunger.  It can take the following values:
* 0: Well fed.
* 1: A bit hungry.
* 2: Becoming quite hungry.
* 3: Very hungry.
* 4: Fairly starving.
* 5: Faint from lack of food.

```
cheat = freezew:G40:0
```

Alternatively, the bread that you find early in the game can be made perpetually available as follows:

```
cheat = freezew:0xf68:8
```

#### Thirst

The global variable Ga5 tracks thirst.  It can take the following values:
* 0: Well hydrated.
* 1: A bit thirsty.
* 2: Quite thirsty.
* 3: Very thirsty.
* 4: Extremely thirsty.
* 5: Faint from lack of water.

```
cheat = freezew:Ga5:0
```

Alternatively, the jug of water that you find early in the game can be made perpetually full as follows:

```
cheat = freezew:0x1c09:4
```

#### Sleepiness

The global variable G13 tracks sleepiness.  It can take the following values:
* 65535: Wide awake.
* 0: Beginning to tire.
* 1: Feeling tired.
* 2: Worn out.
* 3: Wrung out and tired.
* 4: Getting more and more tired.
* 5: Dead on your feet.
* 6: So tired you can barely put one foot in front of another.
* 7: Practically asleep.
* 8: Moving only on your last reserves of strength.
* 9: Barely able to move your arms.
* 10: Unable to keep your eyes open for more than a few moments at a time.

```
cheat = freezew:G13:65535
```

#### Notes

Enchanter periodically reports how hungry and thirsty you are.  If you set the global variables indicating that you are fully sated, these periodic status reports will be gibberish (e.g. “cmhgfh   iseems gdon’t glk jmqcf” instead of “Your mouth is getting rather dry.”).  This is because the “print status” messages assume that the value will never be 0, and appears to be harmless.

Similarly, if sleepiness is set to 65535, the message “You are faint from lack of water and the spells you’ve memorized are becoming confused.” will periodically appear.  This is, as above, the game not expecting the value 65535, and should be harmless.

### Sorcerer

These cheats are for Sorcerer version 15-851108.

#### Thirst

The global variable G4f tracks thirst.  It can take the following values:
* 0: Not thirsty.
* 1: Somewhat thirsty.
* 2: Quite thirsty.
* 3: Very thirsty.
* 4: Extremely thirsty.
* 5: Incredibly thirsty.
* 6: Dangerously thirsty.

```
cheat = freezew:G4f:0
```

#### Hunger

The global variable G6c tracks hunger.  It can take the following values:
* 0: Not hungry.
* 1: Somewhat hungry.
* 2: Quite hungry.
* 3: Very hungry.
* 4: Extremely hungry.
* 5: Incredibly hungry.
* 6: Dangerously hungry.

```
cheat = freezew:G6c:0
```

### Spellbreaker

This cheat is for Spellbreaker version 87-860904.

#### Sleepiness

The global variable G0f tracks sleepiness.  It can take the following values:
* 65535: Wide awake.
* 0: Beginning to tire.
* 1: Feeling tired.
* 2: Getting more and more tired.
* 3: Worn out.
* 4: Dead tired.
* 5: So tired you can barely concentrate.
* 6: Moving on your last reserves of strength.
* 7: Practically asleep.
* 8: Barely able to keep your eyes open.
* 9: About to keel over from exhaustion.

```
cheat = freezew:G0f:0
```

#### Notes

As with Enchanter, Spellbreaker will periodically give status updates which are nonsensical if sleepiness is set to 65535 (e.g. “You are large bird circling the tower and eyeing you suspiciously..”).  These appear to be harmless.

### Planetfall

These cheats are for Planetfall version 37-851003.

#### Hunger and thirst

The global variable Gbc tracks hunger and thirst.  It can take the following values:
* 0: Well-fed.
* 1, 2: Fairly thirsty and hungry.
* 3, 4: Noticeably thirsty and hungry.
* 5: Awesomely phenomenally thirsty and hungry.

```
cheat = freezew:Gbc:0
```

#### Sleepiness

The global variable Gbe tracks sleepiness.  It can take the following values:
* 0: Well-rested.
* 1: Sort of tired.
* 2: Quite tired.
* 3: Phenomenally tired.

```
cheat = freezew:Gbe:0
```

#### Health

The global variable Gba tracks health.  It can take the following values:
* 0: Perfect health.
* 1, 2, 3: A bit sick and feverish.
* 4, 5: Somewhat sick and feverish.
* 6, 7: Very sick and feverish.
* 8: Severely sick and feverish.

```
cheat = freezew:Gba:0
```

#### Carrying capacity

The global variable Gda specifies the amount of weight that can be carried, while G80 specifies the number of items.  Because these are treated as signed 16-bit values, 32767 is the maximum for each: larger values will be interpreted as negative numbers.

```
cheat = freezew:Gda:32000
cheat = freezew:G80:32000
```
