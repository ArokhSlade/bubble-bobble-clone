bubble bobble clone,
learning project

2024 11 18 mo
17:12

[x]level with tile map layer
 []wrap around (bottom down to top)
 []no wrap around : top up
[x]tile map 
 [x]collide with walls
 [x]collide with ground
 [x]can jump through tiles from below
 [x] and vertical angle from below
 []cannot pass through sideways 
 []cannot stand on top level tiles
 [] GODOT: mechanism for precise control over ghosting/colliding with tiles?
 []big and small tiles
 []pass through stacks of tiles from below
 []half gaps (level 5)
 []single gaps
 []double gaps 
[]player
 [x]sprite
 []good sprite format
 []animations
 []shoot bubbles
  []shoot delay
 []bubble monsters
[]bubble
 [_]fast bubble
  [x]quick move forward
  [x]turn into floating bubble
  []bubble monsters
 [x]floating bubble
  []pass through ceilings
   []except top level
  []slow move forward (after bubbling enemy, why not start rising right away?)
  [x]rise up
  []movement paths depending on ???
  []can be pushed sideways
  []pushes other bubbles and player sideways
  []can stack into each other 
  []monster interaction?
  [x]slide along ceilings
  []bug: not connecting to ceiling -> b/c neighbor tile check?
 []flashing bubble (floating bubble that will pop soon)
 [x]empty bubbles
  []spawn across level/time
 []bubbles with trapped enemies
 []pop bubbles
  []tail
  []teeth (while shooting is active)
  []tail
  []stomp (stomp timer)
  []combo mechanic (adjacent bubbles get popped)
 []jump from bubbles (before stomp timer)
  []hold jump pressed -> auto re-jump
 [x]jump
  [x]air control
   []original air control (pixel by pixel)
  []fast jump - slow fall
  [x]neutral jump
  [x]forward jump  
 [x]run
 [x]gravity
 []die 
[]monsters
 []spawn monsters
  []fancy array effect (how they first appear as one, then they split up in orderly fashion)
 []type 1 (clockwork)
 []ai
 []hurt player
 []get bubbled
 []get angry
 []die
 []type 2 (time out ghost)
  []movement rules
 []type 3 (shooting ghost)
  []projectile
[]fruit
 []add score
[]score
[]level transition
[]lives
[]HUD
 []life bubbles
 []high score

[]bonus mechanics:
 []level timer
  []spawn ghost
  []message "hurry up" (2x)
  []turn monster angry
 []water slide
  []flush monsters
  []flush players
  []player can jump off
 []2-player mode

2024 11 21 do
tileset 
https://anokolisa.itch.io/moon-graveyard
