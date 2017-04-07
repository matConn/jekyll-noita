---
title: Game Development - Text-based Level Editing and Phaser JS
layout: post
description: >-
  How I visually represent a level's layout through text (think ASCII art
  or Nethack) and use the Phaser JS game engine to render it to a canvas.
robots: none
comments: true
published: true
---
<style>
    code:first-of-type {
        border-style: none;
    }
</style>


If you are familiar with roguelikes (turn-based dungeon crawlers) such as Nethack, then you are no doubt familiar with the idea of a game's elements being displayed entirely as ASCII characters.  

Here I will explain how I use a similar approach to create the layout of rooms in a game I am working on and how I use Phaser (JS game engine) to render the rooms based on my layouts.

The following array represents a single room: 

<div class="highlight-edit">
```
   [
    //1         12             25
    '-------------------------',//1
    '-------------------------',//2
    '-------------------------',//3
    '-------------------------',//4
    '-------------------------',//5
    '-------------------------',//6
    '-------------------------',//7
    '-------E-E---------------',//8
    '----pppppp----------ppppp',//9
    '-------------------------',//10
    '-------------------------',//11
    '-------------------------',//12
    '-------------------------',//13
    '-------------------------',//14
    '-------------------------',//15
    '-------------------------',//16
    '-------------------------',//17
    'ppppppppppppppppppppppppp',//18
    'ppppppppppppppppppppppppp' //19
    ]
```  
</div>

"E" represents an enemy, and "p" represents a platform. A dash represents empty space, simply because I think it would be easier to read than whitespace, although I am not exactly counting dashes to find any kind of distance.  

The commented-out numbers on top and on the right represent columns and rows respectively; I have divided a canvas 800 pixels wide and 600 pixels high into 25-by-19 32-pixel squares.  

How and when a room like the one shown above is drawn can be described by the following:  
1. The player collides with the edge of the world (canvas)  

1. The player's x-position is then changed to the position of the edge opposite of the collision (right edge collision, player moved to far-left of canvas; left edge collision, player moved to far-right of canvas); this gives the appearance of entering a new room  

1. The room is then cleared, using Phaser's `sprite.kill()` method  

1. A variable integer is then increased or decreased by 1 depending on the edge of collision (right, +1; left, -1), and this integer is then used as our room's index in our level array.
	- So if our current room's index is 0 (the first room in the level array), and the player collides with the right edge of the canvas, our integer increases to 1, and we render the room who's index is 1 (our second room in the level array)  

1. After getting the room we want by index, we check each string within the room array; each of these strings can be looked at as a row of things that can be rendered onto the canvas, from the top of the canvas to the bottom.  

1. For each row (string) in the room array, we check each character by its index using `String.charAt()`.  

1. Using a switch statement, the character can be matched to a case; if and after being matched, we will call Phaser's `group.create()` method to render the matched sprite or image.  


So using the room layout above, `level1[0][8].charAt(4)` would match a case of `p` in our switch statement:
	- 0 is the index of the room (it is the only room shown, but typically there would be multiple rooms), 8 is the index of the row, and the 4th character of the 8th row is a `p`.  

An abridged version of the room-drawing function can be seen below; this is the function to be called on collision.

```
function drawRoom(room){
    for(var row in room){
        for(var column=0; column <=  room[row].length; column++){
            switch (room[row].charAt(column)){
                case 'p':
                    platform = platforms.create(column*32, row*32, 'platform-image');
                    break;
            }
        }
    }
}
```  
This room-drawing function currently only works with one level but should scale to accommodate multiple levels and work similarly if not identically. 

The room system works as detailed in pseudo-code below, with each "column" actually representing a single character in a string:  

```
level1 [
	room1 [ 
		row1 'column1 column2 column3',
		row2 'column1 column2 column3',
		row3 'column1 column2 column3'
	],
	room2 [ 
		row1 'column1 column2 column3',
		row2 'column1 column2 column3',
		row3 'column1 column2 column3'
	]
]
```
