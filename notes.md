# possible issues
- Are cards not being subtracted from players decks when #pile_cards is happening? 
- Is #award_spoils moving cards from turn@spoils_of_war to the turn#winner?
- #pile_cards does change the Turn#type....does any other turn method change the turn#type?

```
Traceback (most recent call last):
        1: from war_or_peace_runner.rb:87:in `<main>'
/Users/michaelmarchand/Documents/turing/practice/war_or_peace/lib/turn.rb:87:in `award_spoils': undefined method `deck' for "No Winner":String (NoMethodError)
```

- so again, turn#pile_cards is changing the turn#type within the algorithm. Try to isolate this....

- What if the turn.type became an instance variable?