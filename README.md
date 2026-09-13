# Open Typewriter

Ideas for an open source typewriter. 

This repo was started so I could get this out of my head and do the things I'm supposed to be doing instead.

# Goals

* Open source, mostly 3d printable electric golf-ball typewriter
* Utilize cheap CNC/3d printer components to control all movement, resulting in simpler movement mechanisms.
  * Less interlocking gears and levers, which are hard to 3d print.
* Variable speed typing: one key press should not instantly smash the wheel into the platen. Instead, move slower and track the pace of the writer, resulting in quieter typing.
* Add ability to support custom characters by combining other characters, or just making repeated dots to draw it out.
* Variable width typing
* Large e-ink display that buffers typed text
  * The typewriter prints the text slowly, speeding up as needed to maintain an adjustable buffer. One line buffer would probably be good. If you pause and think, often the typewriter doesn't have to go as fast. Text that is not yet printed can also be edited.
* Use universal manual typewriter spools (readily available, easy to refill.)

## Bonus Goals

* Automatic paper size detection and margin setting
* Detect ends of paper and prevent typing outside of the margins vertically
* Maybe detect paper alignment? Not sure if there's a good sensor for that. Maybe can be done with the carriage and basic IR sensor alone? White paper on black platen, that should work.
    * Find the ends of the page. Check edge of paper near ends, raise an error if they're too far apart. Roll paper to the middle, so the ends are aligned so the user can release the platen and adjust.

# Design Ideas

## Cylinder

There are some classic typewriters that use a cylinder instead of a ball. This is a simpler motion and may be a better starting point.

## Ball and Striking mechanism

Use the rear suspension from an RC car.

The wheel is replaced with a typing ball. The suspension arm swings to bring the wheel to the platen for a strike. The CV joints give control over the wheel even as the suspension moves, allowing the correct character to be selected. The top turnbuckle is pulled with a servo to change the angle of the ball and shift to another set of characters.

This will require some math to angle the characters correctly for a platen strike. Should be possible with just trig?

Benefits of this design:
* RC car parts are light and tough
    * Keeping the striking mechanism as light and simple as possible is important
* These can be found in smaller sizes
* Can use the wheel nut and mounting system
* High performance:
    * Any other design I can think of uses custom gears that will not be as smooth as these RC parts. This could be geared high so the ball could spin _very_ fast.

Ideas:

* Attach top turnbuckle to a servo to shift
* Attach striker mechanism to shock mount point
* Maybe even use a shock? 
    * Good dampener, and it would look cool. Would probably need really thin oil, if any.
    * Heavy, though.

Striker mechanism is going to be important, but is hard to plan for. I don't know how practical a slow press into the platen will be. I think for the first iteration, the striker should be directly pushed from a servo. I can see how well the slow strike works, and what the speed limit of the servo is. (The multiple shock mounting points is perfect for this.) If a servo works well enough, cool. If not a secondary striking mechanism may be needed that can bring more velocity. I think a cam driven by a Nema-17 motor could do the trick. The cam would not be large enough to push the wheel into the platen, but it would spin with enough velocity to throw it into the platen. This also gives a nice, clean rebound away from the platen.


## Ribbon Feed

Have each spool be directly driven by a small stepper motor that can free spin when not powered. The side that pulls stays locked until it needs to advance. The other motor spins freely, and the extra resistance from the motor maintains ribbon tension. Motor load detects when the ribbon needs to reverse. Or maybe read the other stepper? 

## Carriage 

Movable carriage, so that they can be printed in different sizes and used on the same base.

Rack and pinion (or worm?) drives it side to side, basic IR sensors on each side read the platen and paper. 

I can't think of a good way to drive the platen from the base. I think it will need to be driven with a belt off a DC stepper motor on the carriage. This will allow it to be spun manually.

There will need to be a standard wire and plug from the base to the carriage, with enough slack to move.
