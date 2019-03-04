class Pokemon 
    attr_accessor :attack, :hp, :name, :type
    def initialize (name, type, attack, health)
        @attack = attack 
        @hp = health 
        @name = name 
        @type = type
    end
end


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

    
end