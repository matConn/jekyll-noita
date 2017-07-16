---
title: Animating with GreenSock
layout: post
description: >-
  A brief overview of the GSAP JavaScript library and the animation power it
  brings to your frontend arsenal that CSS3 can't.
robots: none
published: true
comments: true
---

<i>Originally written for <a href="https://thecharlesnyc.com/unordered-list/green-sock" target="_blank">The Charles NYC</a>.</i>

I've recently been introduced to animating with the powerful JavaScript library GreenSock. It’s quite impressive, notably for how manageable its animations are. Unlike CSS3, which measures its animations with percentages, GreenSock uses seconds for timing. GreenSock is also capable of applying multiple animations to a single element, each running either consecutively or simultaneously, which is something CSS3 is not capable of either.

The real beauty of GreenSock is how much control it affords. Much like the animations they control, tweens (the animations between two keyframes) can be controlled with a timeline. This is essentially a container for tweens, and timelines themselves can be nested in other timelines, affording even more control.

After building out a complex sequence of animations, you’ll find GreenSock’s afforded control becomes especially important when changing the animation or timing of your sequence. Whether it be within a single tween or an entire timeline, making changes is easy and painless, and will not affect adjacent animations.

<iframe height='265' scrolling='no' title='Greensock Pacman, Nested Timelines' src='//codepen.io/mattConn/embed/preview/aNZggN/?height=265&theme-id=0&default-tab=css,result&embed-version=2' frameborder='no' allowtransparency='true' allowfullscreen='true' style='width: 100%;'>See the Pen <a href='https://codepen.io/mattConn/pen/aNZggN/'>Greensock Pacman, Nested Timelines</a> by Matthew Connelly (<a href='https://codepen.io/mattConn'>@mattConn</a>) on <a href='https://codepen.io'>CodePen</a>.
</iframe>

Using GreenSock, I made a brief animation (above) detailing the interaction between PacMan and a ghost. To create these two characters, I styled and positioned multiple divs, essentially “building” them. To make them “interact,” I placed all of their actions (tweens) into their own respective timelines in order to control the timing of each action.

For example: to animate PacMan biting, there is a rotation tween on PacMan’s upper and lower jaw. These two tweens are both timed to occur simultaneously within a timeline. This timeline, containing all of Pacman’s animations, is then nested in my master timeline. This timeline is then timed to happen first, with my ghost’s timeline timed to happen shortly after.

The learning curve for animating with GreenSock was relatively low with all the available resources online. GreenSock has their own active forum where often the creator of GreenSock himself answers questions in detail with code examples or an occasional proof of concept on Codepen. I’m excited to be working more in-depth with GreenSock in the future. In the absence of Flash, GreenSock seems to be the runner-up as the standard for creating engaging animations on the web.
