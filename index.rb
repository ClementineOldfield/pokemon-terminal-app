
class Move
    attr_accessor :name, :damage, :type

    def initialize(name, damage, type)
        @name = name
        @damage = damage
        @type = type
    end
end

tackle = Move.new("tackle", rand(1..3), "Normal")
electric_shock = Move.new("Electric Shock", rand(2..4), "Electric")
growl = Move.new("Growl", 0, "Normal")
body_slam = Move.new("Body Slam", rand(1..5), "Normal")
pound = Move.new("Pound", rand(1..4), "Normal")
leaf_blade = Move.new("Leaf Balde", rand(2..6), "Grass")
screech = Move.new("Screech", 0, "Normal")
splash = Move.new("Splash", 0, "Water")

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
        damage = rand(1..10) * move.damage

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


pikachu = Pokemon.new("Pikachu", "Electric", rand(1..10), 18, tackle, electric_shock, growl, body_slam)
magikarp = Pokemon.new("Magikarp", "Water", rand(1..10), 23, pound, splash, screech, body_slam)
bulbasaur = Pokemon.new("Bulbasaur", "Grass", rand(1..10), 20, tackle, leaf_blade, growl, body_slam)


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
    puts "<Press enter to continue>"
    continue = gets

    choosing = true
    while choosing
        system("clear")

        puts "Please choose one of the Pokemon: \n"
        Pokemon.pokemon.to_a.each do |pokemon|
            puts "- #{pokemon.name}" 
        end 

        puts "\nYou choose: "

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
        else 
            puts "That's not a valid option"
        end
    end 

    #TODO: add conditionals to assign the correct pokemon objects to the user.
    puts "#{user_choice}, I choose you!"
    puts "Your opponent is #{opponent.name}"

    puts "<Press enter to continue>"
    continue = gets

    #Start fighting loop
    fighting = true
    while fighting 
        system("clear")
        display_stats(user,opponent)
        puts "Would you like to attack again? (Y)es or (N)o"
        fight_input = gets.chomp
        if fight_input == "y"
            user.attack(opponent, user.move1)
            if opponent.hp <= 0 
                fighting = false 
            end 

            puts "<Press enter to continue>"
            continue = gets
            
            opponent.attack(user, opponent.move1)

            puts "<Press enter to continue>"
            continue = gets

            if user.hp <= 0 || opponent.hp <= 0 
                fighting = false
            end 
        elsif fight_input == "n"
            opponent.attack(user, opponent.move1)
            puts "<Press enter to continue>"
            continue = gets
            if user.hp <= 0 || opponent.hp <= 0 
                fighting = false
            end    
        end

    end 

    if user.hp > 0 && opponent.hp <= 0 
        p "You win!!!"
    else  
        p "You lose!!!"
    end

    puts "Would you like to play again? y/n"
    play_input = gets.chomp
    if play_input == "n"
        p "Thank you for playing!"
        playing = false
    end 

end #End playing loop

