#Create pokemon class. TODO: move to other file and import here.
class Pokemon 
    attr_accessor :attack, :hp, :name, :type
    def initialize (name, type, attack, health)
        @attack = attack 
        @hp = health 
        @name = name 
        @type = type
    end

    #TODO: Create method for attack. Basic functionality - prints: "attacks opponent"
end

#Declare multiple instances of pokemon class
pikachu = Pokemon.new("Pikachu", "Electric", rand(1..10), 20)

p "You've picked #{pikachu.name}! He's an #{pikachu.type} type."
p "Base stats: #{pikachu.attack} damage and #{pikachu.hp} HP"

magikarp = Pokemon.new("Magikarp", "Water", rand(1..10), 20)

p "You've picked #{magikarp.name}! He's a #{magikarp.type} type."
p "Base stats: #{magikarp.attack} damage and #{magikarp.hp} HP"


max_health = 20

    damage = rand 0..10
    if damage >= 8 
        puts "Critical hit! Opponent took #{damage} damage."
    elsif damage <= 2 && damage >= 1
        puts "Not very effective. Opponent took #{damage} damage."
    elsif damage == 0
        puts "No effect. Opponent took #{damage} damage."
    else 
        puts "Opponent took #{damage} damage."
    end
    total_health = max_health - damage
    puts "#{total_health} / #{max_health} HP"


    
playing = true
while playing
    system("clear")
    puts "please choose a pokemon"
    user_choice = gets.chomp

    #TODO: add conditionals to assign the correct pokemon objects to the user.

    #Start fighting loop
    fighting = true
    while fighting 
        #TODO: access the name from the user's pokemon object instead of a static variable.
        puts "your pokemon is #{user_choice}"
        puts "Attack? y/n"
        fight_input = gets.chomp
        if fight_input == "y"
            puts "attacked"
        elsif fight_input == "n"
            fighting = false
        end
    end #End fighting loop

    puts "would you like to play again? y/n"
    play_input = gets.chomp

    if play_input == "n"
        playing = false
    end 
end #End playing loop
