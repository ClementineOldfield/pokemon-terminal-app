class Pokemon 
    def initialize
    end

end

playing = true
while playing
    system("clear")
    puts "please choose a pokemon"
    user_choice = gets.chomp

    fighting = true
    while fighting 
        puts "your pokemon is #{user_choice}"
        puts "Attack?"
        fight_input = gets.chomp
        if fight_input == "y"
            puts "attacked"
        elsif fight_input == "n"
            fighting = false
        end
    end

    puts "would you like to play again?"
    play_input = gets.chomp

    if play_input == "n"
        playing = false
    end
end