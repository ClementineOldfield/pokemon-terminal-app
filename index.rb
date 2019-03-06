
#Defines class for all moves used by pokemon
#TODO: Move classes to new files
class Move
    attr_accessor :name, :power, :type

    def initialize(name, power, type)
        @name = name
        @power = power
        @type = type
    end
end

#Instantiates all moves to be used by pokemon
#TODO: Create unique moves for each pokemon
tackle = Move.new("Tackle", 2, "Normal")
electric_shock = Move.new("Electric Shock", 4, "Electric")
growl = Move.new("Growl", 0, "Normal")
body_slam = Move.new("Body Slam", 3, "Normal")
pound = Move.new("Pound", 2, "Normal")
leaf_blade = Move.new("Leaf Blade", 4, "Grass")
screech = Move.new("Screech", 0, "Normal")
splash = Move.new("Splash", 0, "Water")

#Defines Pokemon class
class Pokemon 
    attr_accessor :hp 
    attr_reader :max_hp, :name, :moves

    #Defines empty array of pokemon to be filled as each pokemon instance is initialized
    @pokemon = []

    def initialize (name, type, attack, hp, move1, move2, move3, move4)
        @attack = attack 
        @hp = hp 
        @max_hp = hp
        @name = name 
        @type = type

        @moves = [move1, move2, move3, move4]
        
        #Pushes self to pokemon array above
        self.class.pokemon.push(self)
    end

    def attack(opponent, move)
     
        #TODO: Incorporate pokemon stats & unique moves into the damage system.
        #TODO: Incorporate pokemon types into the damage system
        #TODO: Incorporate critical hits into the damage system

        damage = rand(1..3) * move.power * @attack

        puts "#{@name} used #{move.name}"

        if damage >= 8 
            puts "Critical hit! #{opponent.name} took #{damage} damage."
        elsif damage <= 2 && damage >= 1
            puts "Not very effective. #{opponent.name} took #{damage} damage."
        elsif damage == 0
            puts "No effect. #{opponent.name} took #{damage} damage."
        else 
            puts "#{opponent.name} took #{damage} damage."
        end
        opponent.hp = opponent.hp - damage
        puts "#{opponent.name} has #{opponent.hp} / #{opponent.max_hp} HP"

        #TODO: Add the option for a move to miss
        
    end

    class << self
        attr_accessor :pokemon

        #Resets the HP of all pokemon that have been instantiated to max HP
        def reset_hp
            @pokemon.each do |pokemon|
                pokemon.hp = pokemon.max_hp
            end
        end
    end
end

def display_stats(user,opponent)
    puts "#{user.name} (you) has #{user.hp} health"
    puts "#{opponent.name} has #{opponent.hp} health"
end

#Instantiates all pokemon to be used in the game
#TODO: Give each pokemon meaningful stats and unique moves.
pikachu = Pokemon.new("Pikachu", "Electric", 1, 30, tackle, electric_shock, growl, body_slam)
magikarp = Pokemon.new("Magikarp", "Water", 1, 34, splash, splash, splash, splash)
bulbasaur = Pokemon.new("Bulbasaur", "Grass", 1, 32, tackle, leaf_blade, growl, body_slam)
mewtwo = Pokemon.new("Mewtwo", "Psychic", 5, 100, tackle, electric_shock, growl, body_slam)
charizard = Pokemon.new("Charizard", "Fire", 3, 50, tackle, electric_shock, growl, body_slam)

def enter_continue
    puts "<Press enter to continue>"
    continue = gets
end

def pokemon_logo
    puts "
    _.----.         ____         ,'  _\   ___    ___     ____      
_,-'       `.      |    |  /`.   \,-'    |   \\  /   |   |    \\  |`. 
\\      __    \     '-.  | /   `.  ___    |    \\/    |   '-.   \\ |  |
 \\.    \\ \\   |  __  |  |/    ,','_  `.  |          | __  |    \\|  |
   \\    \\/   /,' _`.|      ,' / / / /   |          ,' _`.|     |  |
    \\     ,-'/  / | |    ,'  |  \\/ / ,`.|         / / \\  |        |
     \\    \\ |   \_/  |   `-.  \\    `'  /|  |    ||   \\_/  |  |\\    |
      \\    \\ \\      /       `-.`.___,-' |  |\\  /| \\      /  | |   |
       \\    \\ `.__,'|  |`-._    `|      |__| \\/ |  `.__,'|  | |   |
        \\_.-'       |__|    `-._ |              '-.|     '-.| |   |
                                `'                            '-._|"

    
    puts "-----------------------------------------------------------------------\n                                BATTLE \n-----------------------------------------------------------------------"
end

def start_music(song)
    pid = fork{ exec 'afplay', song }
end

# def stop_music
#     pid = fork{ exec 'killall afplay'}
# end

playing = true
while playing

    #TODO: Create classification(PG13) warning for any users under the age of 12. 
    Pokemon.reset_hp
    system("clear")
    start_music("docs/battle-music.mp3")
    pokemon_logo
    enter_continue

    choosing = true
    while choosing
        system("clear")

        pokemon_logo
        puts "Please choose a Pokemon."
        puts "Options:"
        
        Pokemon.pokemon.to_a.each do |pokemon|
            if pokemon.name != "Mewtwo" && pokemon.name != Pokemon.pokemon[Pokemon.pokemon.length-1].name
                print "#{pokemon.name}, "
            elsif pokemon.name == Pokemon.pokemon[Pokemon.pokemon.length-1].name
                print "or #{pokemon.name}.\n"
            end
        end

        user_choice = gets.chomp.capitalize
        if user_choice == "Pikachu"
            user = pikachu
            opponent = bulbasaur
            choosing = false 
        elsif user_choice == "Magikarp"
            user = magikarp
            opponent = pikachu
            choosing = false 
        elsif user_choice == "Bulbasaur"
            user = bulbasaur
            opponent = magikarp
            choosing = false
        elsif user_choice == "Charizard"
            user = charizard
            opponent = mewtwo
            choosing = false
        else
            puts "That's not a valid option"
            enter_continue
        end
    end 

    #TODO: add conditionals to assign the correct pokemon objects to the user.
    puts "#{user_choice}, I choose you!"
    puts "Your opponent is #{opponent.name}"

    enter_continue

    #Start fighting loop
    fighting = true
    while fighting 
        system("clear")
        
        pokemon_logo
        

        #TODO: Create a move user friendly display for stats/pokemon
        #TODO: Give user the option of choosing their attack move
        
        display_stats(user, opponent)
        puts "Would you like to attack? (Y)es or (N)o"
        choice = gets.chomp
        if  choice == "y"
            choosing = true
            while choosing == true
                system("clear")
                pokemon_logo
                display_stats(user,opponent)

                puts "Which move would you like to use? Your options are: \n1: #{user.moves[0].name} 2: #{user.moves[1].name} \n3: #{user.moves[2].name} 4: #{user.moves[3].name}"
                fight_input = gets.chomp
                if fight_input == "1" || fight_input.split.map(&:capitalize).join(' ') == user.moves[0].name
                    user_move = user.moves[0]
                    choosing = false
                elsif fight_input == "2" || fight_input.split.map(&:capitalize).join(' ') == user.moves[1].name
                    user_move = user.moves[1]
                    choosing = false
                elsif fight_input == "3" || fight_input.split.map(&:capitalize).join(' ') == user.moves[2].name
                    user_move = user.moves[2]
                    choosing = false
                elsif fight_input == "4" || fight_input.split.map(&:capitalize).join(' ') == user.moves[3].name
                    user_move = user.moves[3]
                    choosing = false
                else
                    puts "that is not a valid input"
                    enter_continue
                end
            end
        

            user.attack(opponent, user_move)

            enter_continue

            if opponent.hp <= 0
                fighting = false
                break
            end

            opponent_move = opponent.moves[rand 0..3]
            opponent.attack(user, opponent_move)
    
            enter_continue

            if user.hp <= 0 || opponent.hp <= 0 
                fighting = false
            end

        elsif choice == "n"
            opponent_move = opponent.moves[rand 0..3]
            opponent.attack(user, opponent_move)
            enter_continue

            if user.hp <= 0 || opponent.hp <= 0 
                fighting = false
            end
        else
            puts "That's an invalid option."
        end

    end 

    if user.hp > 0 && opponent.hp <= 0 
        puts "#{opponent.name} fainted"
        puts "You win!!!"
    else  
        puts "#{user.name} fainted"
        puts "Game Over."
    end

    puts "Would you like to play again? y/n"
    play_input = gets.chomp
    if play_input == "n"
        puts "Thank you for playing!"
        playing = false
    end 
    
end #End playing loop


# stop_music
