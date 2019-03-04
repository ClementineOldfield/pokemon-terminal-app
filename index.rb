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



playing = true
while playing

    
end