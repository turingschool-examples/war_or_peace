## War or Peace

Simulate the Card Game War in the terminal!

To play: `$ ruby war_or_peace_runner.rb`

### There are some extra files so I will explain:

#### TLDR: I used loops but didn't test them. So I did it again and wrote the tests first.

[And then I realized I had a new, standalone program.](https://github.com/ajtran303/card_generator)

### ./lib/build.rb

The `Build` class returns an array that is passed into the runner file to make card objects.

Originally those methods were all in the runner file so I took them out to see if it would still work.

It did, and that made me happy. However, it was not Test-Driven Developed.

### ./util/

The `util` directory contains what *was* going to be a ~`CardGenerator`~ class but turned into [*something else*](https://github.com/ajtran303/card_generator).

As I kept working on this ~`CardGenerator`~ class I realized that it could help me **write** the text file to use in the next project iteration.

So `CardTextFileGenerator` was born.

I liked it a lot so I turned it into an interactive version that lives in its own repo now.

I am including it in my submission because it is a Test-Driven Development approach to "rebuilding" the `Build` class!
