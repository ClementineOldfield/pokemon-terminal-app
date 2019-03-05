
class Move
    attr_accessor :name, :damage, :type

    def initialize(name, damage, type)
        @name = name
        @damage = damage
        @type = type
    end
end

tackle = Move.new("tackle", 1, "Normal")
electric_shock = Move.new("Electric Shock", 3, "Electric")
growl = Move.new("Growl", 0, "Normal")
body_slam = Move.new("Body Slam", 2, "Normal")

class Pokemon 
    attr_accessor :hp 
    attr_reader :max_hp, :name, :move1, :move2, :move3, :move4

    @pokemon = []

    def initialize (name, type, attack, hp, move1, move2, move3, move4)
        @attack = attack 
        @hp = hp 
        @max_hp = hp
        @name = name 
        @type = type
        @move1 = move1
        @move2 = move2
        @move3 = move3
        @move4 = move4
        
        self.class.pokemon.push(self)
    end

    def attack(opponent, move)
        damage = rand 0..10 * move.damage

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
        
    end

    class << self
        attr_accessor :pokemon

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



pikachu = Pokemon.new("Pikachu", "Electric", rand(1..10), 20, tackle, electric_shock, growl, body_slam)
magikarp = Pokemon.new("Magikarp", "Water", rand(1..10), 20, tackle, electric_shock, growl, body_slam)
charizard = Pokemon.new("Charizard", "Fire", rand(50..100), 50, tackle, electric_shock, growl, body_slam)
mewtwo = Pokemon.new("Mewtwo", "Psychic", rand(150..200), 100, tackle, electric_shock, growl, body_slam)
    

playing = true
while playing

    Pokemon.reset_hp
    system("clear")

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
    puts "<press enter to continue>"
    continue = gets
    puts pikachu.move1.name

    choosing = true
    while choosing
        system("clear")

        puts "Please choose a pokemon. \nFor options, type 'options'"
        user_choice = gets.chomp.capitalize
        if user_choice == "Pikachu"
            user = pikachu
            opponent = magikarp
            choosing = false 
        elsif user_choice == "Magikarp"
            user = magikarp
            opponent = pikachu
            choosing = false 
        elsif user_choice == "Charizard"
            user = charizard
            opponent = mewtwo
            choosing = false
        elsif user_choice == "Options"
            puts "Options:"
            Pokemon.pokemon.to_a.each do |pokemon|
                unless pokemon.name == "Mewtwo"
                    puts pokemon.name
                end
            end
            puts "<press enter to continue>"
        continue = gets
        else 
            puts "That's not a valid option"
        end
    end 

    #TODO: add conditionals to assign the correct pokemon objects to the user.
    puts "#{user_choice} I choose you!"
    puts "your opponent is #{opponent.name}"

    puts "<press enter to continue>"
    continue = gets

    #Start fighting loop
    fighting = true
    while fighting 
        system("clear")
        display_stats(user,opponent)
        puts "Attack? y/n"
        fight_input = gets.chomp
        if fight_input == "y"
            user.attack(opponent, user.move1)
            if opponent.hp <= 0 
                fighting = false 
            end 
            opponent.attack(user, user.move1)

            puts "<press enter to continue>"
            continue = gets

            if user.hp <= 0 
                fighting = false 
            end 
        elsif fight_input == "n"
            fighting = false

        end

    end 

    if user.hp > 0 
        p "You win!!!"
    else 
        p "You lose!!!"
    end

    puts "would you like to play again? y/n"
    play_input = gets.chomp
    if play_input == "n"
        playing = false
    end 

end #End playing loop

