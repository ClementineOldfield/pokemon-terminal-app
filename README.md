Terminal App (A1-1).
=====

### By Clementine Oldfield & Shaahil Chand. February, 2019.


<!-- 
A link to your GitHub repository
TODO:: Ensure the repository (repo) is accessible by your Educators -->
https://github.com/ClementineOldfield/pokemon-terminal-app

Design Brief
======

    In groups of 2 create a Ruby terminal application (app).
    It can be something to entertain, to surprise, to solve a problem, to inform, to compute, etc.

Project Plan & Timeline
=======

With such a short time to complete this project, our timeline had to be condensed. 

### Day 1 
(Day 1 was technically only a half day as we were given our design brief in the afternoon. )

- Brainstorming and Ideation. 
- Narrow down to three ideas. Explore each of the three ideas in more depth. Decide on a final idea & get green lit.

### Day 2

- Create user workflow diagram
- Write basic pseudocode
- Start app development if time permits

### Day 3

- App development.
- Adjusting scope of app to meet deadline.

Exploring Ideas
================

We started off by brainstorming with a board on Trello
![Brainstorming Session](/docs/brainstorming.png "Trello Brainstorming Session")

After this, we narrowed it down to three ideas:
- Scissors, Paper, Rock game
- Nutrition Tracking App
- Pokemon Battle Game

We drew some mindmaps to explore the pros and cons of each option. 

![Nutrition App Mindmap](/docs/nutrition-mindmap.png "Nutrition App Mindmap")
![Scissors Paper Rock Mindmap](/docs/scissors-mindmap.jpg "Scissors Paper Rock Mindmap")


### Winning choice: Pokemon Battle App

We decided to go with the Pokemon app as it was something that we both found engaging and exciting to develop. 

Our aim was to create a fun battle game that was quick and easy to play. It would include features from the 90s version of the game that would add elements of nostalgia.


## Core
- Option to choose a Pokemon from a list  
- Option to choose a move from a unique list for each Pokemon
- HP stats for the user and the opponent that decrease with each attack
- Option for the user to play again after the battle has finished
- For the opponent to attack with a random move from its list of moves each round
- To have a user friendly graphical display

## Stretch Goals
- To affect the damage of an attack by:
    - The move's type vs the opponent Pokemon's type
    - The attack stats of the attacking pokemon
    - The defence stats of the defending pokemon
- To include ASCII sprites to show which Pokemon are currently fighting
- Saving the user's progress

<!-- Screenshots of Trello board(s) -->

User Workflow Diagram
=======

![User Workflow Diagram](/docs/user-flow-diagram.png "User Workflow Diagram")


User Stories
=======

Some example user stories...

- As a user, I am able to choose a pokemon and take part in battles with other pokemon.
- As a user, I am able to play multiple games in one session.
- As a user, I am able to use the different moves available to my chosen pokemon.
- stretch: As a user, I am able to save my progress and have my pokemon gain experience from battles


<!-- Instructions for use -->
Instructions for use: 
=======

1. Find title screen. 
2. Press enter to continue program.
3. Identify Pokemon options. 
4. Type desired Pokemon options from options displayed. 
5. Press enter to confirm user Pokemon. 
6. Identify user Pokemon and opponent pokemon. 
7. Press enter to continue program.
8. Identify health of user Pokemon and opponent Pokemon.
9. Identify action options. 
10. Type "y" to attack or "n" to not attack. 
11. Identify attack and damage to user Pokemon health. 
12. Press enter to continue program.
13. Identify attack and damage to opponent Pokemon health.  
14. Press enter to continue program.
15. Identify health of both user Pokemon and opponent Pokemon. 
16. Repeat steps 9 to 15 till user Pokemon or opponent Pokemon health reach less than or equal 0
17. Identify result. 
18. Identify play options. 
19. Type "y" to play again or "n" to end program.


Planning & Development Process: 
=======

To begin writing the code for our app, we sketched out some quick pseudocode. We knew we would need at least one class (for the pokemon objects) and two loops. One loop to begin the game itself, and one loop to begin the fight. 

    Create 'Pokemon' class {

        core attributes: name, type, hp, moves
        stretch attributes: level, attack, defence, pp, speed, inventory

        method: attack(opponent, move)

        stretch goal - method: use_item(item)

        stretch goal - method: level_up
    }

We had a few core functionality goals that were to be the primary objectives. And we added stretch goals that we would incorporate if time allowed.

    variable: playing

    Loop: While playing is true {

        stretch - Start music

        Ask user to choose a pokemon

        assign choice to user/fighter
        assign opposite to opponent

        Stretch goal: create multiple levels of opponent. (eg. really difficult - mewtwo)

        variable: fighting

        Loop: while fighting is true {

            stretch - Start battle music

            Clear screen

            Display own pokemon & opponent pokemon stats.
            stretch TODO: Create graphic display with ASCII

            Give option/s available to player

            If player attacks {

                Figure out math for damage to opponent/s health
                Apply damage to opponent's health

            }

            stretch goal: elsif player uses item {

                add points to user.pokemon's hp
            }

            Press any button to continue. 

            Opponent attacks automatically. 
            Figure out math for damage to opponent/s health
            Apply damage to user's health

            if user hp OR opponent hp <= 0, fighting is no longer true
        }

        If user hp > 0
            You win!
        else
            Game over!
        end

        stretch: apply experience to winning pokemon
        if experience is more than threshold, level up pokemon


        Ask "would you like to play again?"

        if no 
            playing = false
        end

    }

    stretch goal - Write data to txt files to save progress

Project Management
======
To communicate throughout the project, we used Slack for direct communication and Trello to delegate and keep track of tasks. 

![Slack screenshot #1](/docs/slack1.jpg "Slack screenshot #1")
![Slack screenshot #2](/docs/slack2.png "Slack screenshot #2")
![Slack screenshot #3](/docs/slack3.png "Slack screenshot #3")
![Trello screenshot #1](/docs/trello1.png "Trello screenshot #3")

Accessibility
======

To optimise accessibility, our entire app is usable with a keyboard. We also chose to use white text on a black background to maximise readability. 

Societal Impact & Possible Harm
===============

Despite its level of separation from reality, according to Australian classifications, the concept of Pokemon often touches on some mild themes and violence. To prevent our app from offending or disturbing any users, we would limit its use to those over the age of 12. There would be a rating and a warning displayed upon launching the game. In this version we only had time to implement a very basic version of this feature.

There are some concerns of Pokemon being likened to promoting animal cruelty. As in the original version, we were sure to specify that the Pokemon "fainted" rather than was actually injured in any way. Although this does not mitigate the above concern entirely, it lessens the amount of violence potentially depicted in the final game.

Obstacles and Problem Solving
=======

Here is the method that we used to calculate damage within the Pokemon class for each attack made.  
    
    damage = rand(1..3) * move.power * @attack

The code takes an element of randomness and multiplies it by the attack stat of the Pokemon and the power stat of the move. This makes some Pokemon (and some moves) stronger than others.


Added Features
===============

#### Music
We decided to add music to the gameplay in order to make the user experience (and also our presentation) more engaging. The simplest way we could find to do this was to use the inbuild `afplay` method in macosx terminal. Moving forward, we would ideally like to integrate this with other platforms also. 

We attempted to incorporate two different tracks: One for the general game music and one that was triggered when a fight started but it seemed as though we would need a more sophistocated system in order to acheive this. 

Dropped Features 
===============
## (in this version)

## Saving Progress
We would have loved to include the functionality of saving the user's progress but the time restrictions simply did not allow us to get that far. 

### Types
We included the attribute of 'type' for each pokemon in order for some types to have advantages over others. To implement this in future versions, we would need to modify the attack method to consider these factors. 

## ASCII Sprites
It would have been fun to include ASCII pictures of each of the pokemon on screen as they fight. This is definitely something that we will add to any future version of the app.

Testing
=====

We kept a record of our bug testing in a spreadsheet (included in /docs/ and pictured below)

![Testing Database](/docs/Testing.png "Testing Database")


# Thank you for reading!