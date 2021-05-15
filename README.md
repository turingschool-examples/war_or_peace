## War or Peace

This is the repo for Taylor Varoglu's BE Mod1 **War or Peace** project.


### Project Requirements:

1. [x] [Iteration 1](https://backend.turing.edu/module1/projects/war_or_peace/iteration1)

2. [x] [Iteration 2](https://backend.turing.edu/module1/projects/war_or_peace/iteration2)

3. [x] [Iteration 3](https://backend.turing.edu/module1/projects/war_or_peace/iteration3)

4. [x] [Iteration 4](https://backend.turing.edu/module1/projects/war_or_peace/iteration4)



### Results:

1. **Testing Output**
    - Note, `greet` and `start` methods in `Game` class return strings, and therefore print intended terminal outputs during a `spec` run.
    - Note, even with a limited game run test (deck of 8 cards), the game can still result in a draw.

<img width="592" alt="test_output.png" src="https://user-images.githubusercontent.com/58891447/118371959-3f6aee80-b56c-11eb-8295-4012d89db148.png">

2. **Production Output**
    - Executed via the `runner` file in the `root` directory.  Iteration 4 (dynamic card generator) was built during Iteration 3, to avoid manual hard-coding a deck of cards. This method is tested in the corresponding `spec` file for the `Game` class.

<img width="592" alt="prod_output.png" src="https://user-images.githubusercontent.com/58891447/118371991-65908e80-b56c-11eb-96f3-a106a227b21f.png">
