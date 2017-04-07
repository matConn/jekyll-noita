---
title: Game Development - Text-based Level Editing and Phaser JS
layout: post
description: How I used only text to visually represent and render a level's layout.
robots: none
comments: true
published: false
---

If you are famiiar with roguelikes (turn-based dungeon crawlers), then you are no doubt familiar with the idea of a game's elements being displayed entirely as ASCII characters.  

The following array represents a single room in a game I am working on: 
 
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

"E" represents and enemy, and "p" represents a platform. A dash represents empty space, simply because I think it would be easier to read than whitespace, although I am not exactly counting dashes to find any kind of distance.  
The commented-out numbers on top and on the right represent columns and rows, respectively; I have divided a canvas 800 pixles wide and 600 pixels high into 25 by 19 32 pixel squares. Level creation is now highy managable.  

In a nutshell, how and when a room is drawn can be described as such:  
- The player collides with the edge of the world (canvas)
- The player's x-position is then changed to the position opposite the edge of the collision
- The room is then cleared, using Phaser's `sprite.kill()` method
- A variable integer is then increased or decreased by 1, depending on the direction traveled, and this integer is then used as our room's index in our level array.
- After getting the room we want, we check each array within the room array; each of these arrays can be looked as a row of things that can be rendered onto the canvas, from the top of the canvas to the bottom.
- For each row array in the room array, when check each character by its index using `String.charAt()`.
- Using a switch statement, the character can be matched to a case, and then we will call Phaser's `group.create()` function.
- For example, using the layout above, `level1[0][8].charAt(4)` would match a case of `p` in our switch statement. `group.create()` takes arguments of x-position, y-position, and sprite name when choosing where and what to render to the canvas, so after matching `p` in our switch, HERE  

```
function drawRoom(level){
    for(var room in level){
        for(var rows=0; rows <= level[room].length; rows++){
            switch (level[room].charAt(rows)){
                case 'p':
                    platforms.create(rows*32, room*32, 'platform');                 
                    break;
            }
        }
    }
}
```
