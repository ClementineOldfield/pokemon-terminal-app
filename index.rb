#Create pokemon class. TODO: move to other file and import here.
class Pokemon 
    attr_accessor :hp 
    attr_reader :max_hp, :name

    @pokemon = []

    def initialize (name, type, attack, hp)
        @attack = attack 
        @hp = hp 
        @max_hp = hp
        @name = name 
        @type = type
        self.class.pokemon.push(self)
    end

    def attack(opponent)
        damage = rand 0..10
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

pikachu = Pokemon.new("Pikachu", "Electric", rand(1..10), 20)
magikarp = Pokemon.new("Magikarp", "Water", rand(1..10), 20)
charizard = Pokemon.new("Charizard", "Fire", rand(50..100), 50)
    
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
    
    choosing = true
    while choosing
        system("clear")

        puts "please choose a pokemon"
        user_choice = gets.chomp.capitalize
        if user_choice == "Pikachu"
            user = pikachu
            opponent = magikarp
            choosing = false 
        elsif user_choice == "Magikarp"
            user = magikarp
            opponent = pikachu
            choosing = false 
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
            user.attack(opponent)
            if opponent.hp <= 0 
                fighting = false 
            end 
            opponent.attack(user)

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
