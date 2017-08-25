Bocfel contains a number of ways to help discover cheats in games:

## Scanning

It is possible to scan memory for words (16-bit values) matching a specific value.  This can be used if you know the specific value of something and want to find it, such as the amount of money being carried.  The commands are:

`/debug scan start`: Restart scanning.  This forgets any previous scan that was in progress.

`/debug scan N`: Scan memory for the value *N*.  If *N* starts with `0x` it is hexadecimal and unsigned; otherwise it is decimal and can range from `-32768` to `65535`.  When this command is run, the number of memory locations which contain the specific value is printed.  If this command is run again, the list will be narrowed down.  This process can be repeated until, with luck, only a single memory location contains the specified value.

`/debug scan show`: Print out all locations matching the values that have been scanned for since the last scan start.

For example, in *Beyond Zork*:

```
Kitchen
  Coils of greasy steam rise from a cauldron bubbling over a roaring hearth. The ceiling is hung with crusty pots and strips of old meat.
  A closed door in the corner bears the legend, "Keepeth Out."
  A skinny old cook is bustling around the kitchen.
  There's a giant onion here.

>$
You have 1 zorkmid.

>/debug scan start
[debug scan reset]

>/debug scan 1
[183 locations]

>buy onion
[with your zorkmid]
  The cook gives you a bewildered look, shrugs, and accepts your zorkmid without question.

>$
You're broke.

>/debug scan 0
[1 location]

>/debug scan show
Gd3

>/debug freeze Gd3 100
[frozen]

>$
You have 100 zorkmids.
```

## Changes

Sometimes you can be confident that a word (16-bit value) is increasing or decreasing, but not know the specific values being used, such as when a water or food source is being consumed.  The commands are:

`/debug change start`: Restart change tracking.  This forgets any previous change tracking that was in progress.

`/debug change dec`: Display the location of all words which have decreased since the last check.

`/debug change inc`: Display the location of all words which have increased since the last check.

For example, in *Enchanter*:

```
>x jug
The jug is empty.

>/debug change start
[debug change reset]

>fill jug
The jug is now full of water.

>/debug change start

>sw then drink water
Trailhead

The delicious spring water tasted great, and there's lots more where that came from.

>/debug change dec
0x60e: 14099 -> -25325
0x682: -16913 -> -17097
0x1c09: 4 -> 3
0x1c0a: 1065 -> 809
[...]

>ne then fill jug
Shady Brook

The jug is now full of water.

>/debug change inc
0x60e: -25325 -> 14099
0x682: -17097 -> -16913
0x1c09: 3 -> 4
0x1c0a: 809 -> 1065
[...]

>sw then z.z.z then drink water
Trail Head

Time passes...
[...]

The delicious spring water tasted great, and there's lots more where that came from.

>/debug change dec
0x60e: 14099 -> -25325
0x682: -16913 -> -17097
0x1c09: 4 -> 3
0x1c0a: 1065 -> 809
[...]

> z.z.z.z.z.z.z.z.z.z.z.z.z.z.z.
Time passes...
[...]

>drink water
The delicious spring water tasted great, and there's plenty more.

>/debug change dec
0x1c09: 3 -> 2
0x1c0a: 809 -> 553

> ne then fill jug
Shady Brook

The jug is now full of water.

>/debug change inc
0x1c09: 2 -> 4
0x1c0a: 553 -> 1065
```

At this point it's been narrowed down to two variables.  `0x1c09` looks promising because it keeps track in small increments, which keeps in line with how the water is managed in *Enchanter* (the jug being full, nearly full, half full, mostly empty, and empty).  To test, you can freeze the address at specific values and see what happens:

```
>/debug freeze 0x1c09 4 
[frozen]

>x jug
The jug is full.

>/debug freeze 0x1c09 3
[frozen]

>x jug
The jug is nearly full.

>/debug freeze 0x1c09 2
[frozen]

>x jug
The jug is half full.

>/debug freeze 0x1c09 1
[frozen]

>x jug
The jug is mostly empty.

>/debug freeze 0x1c09 0
[frozen]

>x jug
The jug is foo
```

Looks like `0x1c09` tracks how much water is available.  Why is there odd output when the water is set to 0?  *Enchanter* handles water by having both a water object and a jug object.  When the jug is filled, the water object is placed into the jug.  The water object keeps track of how much water there is, with the values 4, 3, 2, and 1.  When the water object is at 1 and the player drinks that, instead of reducing the value to 0, the water object is removed entirely from the jug, and now instead of the *water* being in charge of determining how much water is left, the *jug* is in charge, and since it's empty, it says so.  The upshot is that the game never expects the water object to be in the jug while at level 0: at that point, the water should be outside of the jug.  By freezing it at 0, the water stays in the jug but at an “impossible” value so far as the game is concerned.  It looks up what 0 means and finds a junk text string, which happens to be “foo”.

These sorts of interactions can be tricky to deal with, because while it may seem that a single word tracks something, there may be more to it than that.  In this case, looking at the disassembly of the *Enchanter* game helps figure out how the water and jug interact, but it's not really necessary to do so: it was enough to learn that freezing `0x1c09` at 4 keeps the jug perpetually full.
