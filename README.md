## War or Peace

Simulate the Card Game War in the terminal!

To play: `$ ruby war_or_peace_runner.rb`

##### Also: [I realized I had a new, standalone program.](https://github.com/ajtran303/card_generator)

`CardTextFileGenerator` was born because I wanted to programmatically build decks of cards with loops.

I liked it a lot so I turned it into an interactive version that lives in its own repo now.

Originally, I had a bunch of interdependent loop code blocks living in `war_or_peace_runner.rb`. Eventually I encapsulated them into the class `build.rb`.

Then I used a Test-Driven Development approach to write `card_text_file_generator_test.rb`. That got me to `card_text_file_generator.rb`, which is a better version of `build.rb`.

I am including it in my submission because it is a Test-Driven Development that I worked on to progress with the project.
