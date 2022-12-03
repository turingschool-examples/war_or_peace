## War or Peace

This is the starter repo for the BE Mod1 **War or Peace** project.

# Questions/notes 

- Every now and then, I am getting an undefined method rank for nil class. I think this happens when
there are less than 3 cards in a player's deck of cards. So it isn't able to call rank on index point 2, because
there is no card there.
- I also sometimes get an error similar tot he one above, but for a string. It will say something along the lines of
"undefined method 'name' for 'No Winner' String.' 
No Winner is the return of a mutually assured destruction type of turn in the winner method. I could not pinpoint why/how
a player object's name would be called when it is a mutually destructive type of turn. That should just return no winner

