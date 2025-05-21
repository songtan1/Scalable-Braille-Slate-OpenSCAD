# Scalable-Braille-Slate-OpenSCAD

This is a free software to make Braille Slate for 6 dot braille, 8 dot braille, and dot graphics with OpenSCAD.

There are two braille types - 6 dot braille (2 column * 3 row) and 8 dot braille (2 column * 4 row). The 6 dot braille has 64 (2^6) different characters and the 8 dot braille has 256 (2^8) characters. Each dot position is named as follows:

1 4

2 5

3 6

7 8

The braille specification defines its size with 5 % tolerance. There are three types in use - Basic, Compressed (95%), and Jumbo dot (125%). Basic uses 1.6 mm dot with 2.4 mm dot spacing. The 95% compressed one is commonly used for reading materials. The cell spacing is further reduced to put more characters in a line. Jumbo dot uses the same basic dot size with 125% dot spacing. It is used for the signage, etc., with the consideration of people with less dexterity.

Type ________ Basic Compressed Jumbo Remark

Scale _______ 1.0 0.95 1.25

Dot Size ____ 1.6 1.5 1.6

Dot-X Spacing 2.4 2.3 3.1 Range: 2.3-2.5

Dot-Y Spacing 2.4 2.3 3.1 Range: 2.3-2.5

Dot Height __ - 0.6 - Minimum (Range: 0.6-0.9)

Cell Spacing 6.0 5.5 - Minimum (Range: 5.5-7.5)

Line Spacing 11 10 - Minimum (Range: 10-)

Cell Gap ____ 1.0 0.9 - Derived from cell spacing

Line Gap ____ 3.5 3.1 - Derived from line spacing

In the program, the initial X size is set same as the letter size paper even it is changeable. The Y size is divided into the repeat for the fast 3d rendering. One repeat has 20 dot rows and about 50 mm. One repeat is 5 lines of 6 dot braille (3 dot row with 1 spacing) or 4 lines of 8 dot braille (4 dot row with 1 spacing). I suggest to make the bottom slate with 6 repeats (300 mm) with the 1 repeat top slate (50mm) and use the bottom slate as a backboard while moving around the top slate over as needed. You may also make the slate size same as a memo pad or a name card to take a quick short note.

The font size of normal inked text is 10 to 12 points. The braille character is 24 points. The braille text takes about 200 to 240 % more space than the inked text. In the compressed braille text, the cell gap is smaller than the dot-x spacing and the line gap is bigger than the dot-y spacing for better readability while having more characters in a line.

However, if the cell gap was same as the dot-x spacing and the line gap was same as the dot-y spacing, the bottom slate would be same for 6 dot or 8 dot brailles and even could be used for the dot graphics. For this in mind, I added dots on spacing area for the bottom slate and 2nd paper holes on the top slate to assist to access most dots. The program is also designed to make a cell with any number of column and row. A cell with 5 column * 7 row with 50% scale can be used for the dotted alphabet text. It takes about the same space as the 6 dot braille.

Interestingly, the braille specification is very similar to that of LEGO(R). Lego uses the 1.6 mm unit for its brick sizes and its dot size is 3 units instead of 1.

For the fast 3d rendering, run the code on the OpenSCAD Developer Snapshot version using Manifold and turn off Automatic Preview from Customizer.

