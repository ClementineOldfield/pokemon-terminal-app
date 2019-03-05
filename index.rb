#Create pokemon class. TODO: move to other file and import here.
class Pokemon 
    attr_accessor :attack, :hp, :name, :type
    def initialize (name, type, attack, health)
        @attack = attack 
        @hp = health 
        @max_hp = health
        @name = name 
        @type = type
    end

    def attack 
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
        @hp = @hp - damage
        puts "#{@hp} / #{@max_hp} HP"
    end

    def reset_health
        @hp = @max_hp
    end

end

#Declare multiple instances of pokemon class
pikachu = Pokemon.new("Pikachu", "Electric", rand(1..10), 20)


magikarp = Pokemon.new("Magikarp", "Water", rand(1..10), 20)

    
playing = true
while playing
    puts "please choose a pokemon"
    user_choice = gets.chomp.capitalize
    if user_choice == "Pikachu"
        user = pikachu
    elsif user_choice == "Magikarp"
        user = magikarp
    else 
        puts "That's not a valid option"
    end

    #TODO: add conditionals to assign the correct pokemon objects to the user.

    #Start fighting loop
    fighting = true
    while fighting 
        #TODO: access the name from the user's pokemon object instead of a static variable.
        puts "your pokemon is #{user.name}"
        puts "Attack? y/n"
        fight_input = gets.chomp
        if fight_input == "y"
            user.attack
            if user.hp <= 0 
                fighting = false 
                user.reset_health
            end 
        elsif fight_input == "n"
            fighting = false
            user.reset_health
        end

    end #End fighting loop

    puts "would you like to play again? y/n"
    play_input = gets.chomp

    if play_input == "n"
        playing = false
    end 
end #End playing loop
