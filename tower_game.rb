
# From App Academy's Mini Curriculum
# Section 1, Arrays
# Towers of Hanoi Game


# Create a new object called Towers with 3 parameters: tower_1, tower_2, tower_3
# Initialize tower_1 to initially contain the stack of disks in decreasing order of size

class Towers
    #initialize towers
 
    def initialize(disks)
        #initialize tower 1 to contain all the disks in decreasing order of size
        @@tower_1=[]
        i=disks
        while i>0
           @@tower_1.push(i)
            i=i-1
        end
        @@tower_2=[]
        @@tower_3=[]   
    end
    
    #to be able to access tower 1
    def tower_1
        @@tower_1
    end
    
    #to be able to access tower_2
    def tower_2
        @@tower_2
    end
    
    #to be able to access tower_3
    def tower_3
        @@tower_3
    end
    
 
    
    # define method isLegal? to determine whether the move the user would like to do is legal or not
    # restrictions: if there is no disk in the source tower, there is no possible move. The top disk of the
    # the destination tower must be greater than the disk you are trying to move. 
    
    def isLegal?(source,destination)
        if source == 1
            if @@tower_1==nil   
                return false    
            end
            if destination == 2 
                if @@tower_2.empty? || @@tower_1.last < @@tower_2.last
                    return true
                end
            end
            if destination == 3 
                if @@tower_3.empty? || @@tower_1.last < @@tower_3.last
                    return true
                end
            end
        
        elsif source == 2
            if @@tower_2.empty?
                return false
            end
            if destination == 1 
                if @@tower_1.empty? || @@tower_2.last < @@tower_1.last
                    return true
                end
            end
            if destination == 3 
                if @@tower_3.empty? || @@tower_2.last < @@tower_1.last
                    return true
                end
            end
        
        
        elsif source == 3
            if @@tower_3.empty?
                return false
            end
            if destination == 1 
                if @@tower_1.empty? || @@tower_2.last < @@tower_1.last
                    return true
                end
            end
            if destination == 2 
                if @@tower_2.empty? || @@tower_3.last < @@tower_2.last
                    return true
                end
            end
            
        else 
            return false
        end
        
    end

    
    #define move method which moves a disk from the source to destination tower
    
    def move(source, destination)
        if isLegal?(source,destination)
           if source==1
                disk_to_move = @@tower_1.pop
            elsif source==2
                disk_to_move = @@tower_2.pop
            elsif source==3
                disk_to_move = @@tower_3.pop
            else
                puts("the source should be 1,2,or 3.")
            end
            
            if destination ==1 
                @@tower_1.push(disk_to_move)
            elsif destination == 2 
                @@tower_2.push(disk_to_move)
            elsif destination == 3 
                @@tower_3.push(disk_to_move)
            end 
        else
            puts("Sorry that was an incorrect move. Please review the rules and try again.")
        end
    end
end 

#now that the Class Towers is ready - start game
    

puts("Welcome to the Towers of Hanoi game.")
puts("You will have 3 towers. You start with a number of disks all on the first tower and you will need to replicate this structure on another tower, subject to certain rules.")
puts("First, how many discs would you like to start out with? If it is your first time playing, maybe start with a small number of disks (but greater than 2!)")

disks=gets.chomp.to_i
tow=Towers.new(disks) #initialize instance of Towers class
# winning_tower is what we would like the player to reproduce

puts("Thank you for your entry. Let me describe the game.")
puts()
puts("The #{disks} disks are arranged on the first tower by decreasing size.In other words: the largest disk is on the bottom and the smallest on top.")
puts("You are asked to move all of the #{disks} disks from the first tower to another, subject to certain rules.")
puts()
puts("Rule #1: only 1 disk can be moved at a time.")
puts("Rule #2: a disk can only be moved if it is the uppermost disk on a stack.")
puts("Rule #3: no disk may be placed on top of a smaller disk.")
        
# In a loop, prompt the user (using gets) and ask what pile to select a disk from, and where to put it.
# After each move, check to see if they have succeeded in moving all the disks, to the final pile. If so, they win!

puts()
# initialize winning_tower to tower_1  
winning_tower=tow.tower_1
puts("This is what the winning tower should look like: #{winning_tower}. Note the disks are in decreasing order of size.")
puts()
puts("Let's get started!")


while true
    puts("Please select a tower to move from by typing 1,2,or 3.")
    source=gets.chomp.to_i
    while (![1,2,3].include?(source))
        puts("the source must be 1,2,or 3.")
        source=gets.chomp.to_i
    end
    
    puts("And now select where to move it.")
    
    destination=gets.chomp.to_i
    while (![1,2,3].include?(destination) || source == destination)
        puts("The destination must be 1,2,or 3 and not the same as the source! Please type another destination.")
        destination=gets.chomp.to_i
    end
    
    
    #puts("to exit type 0")
    #word=gets.chomp
    #if word.to_i==0
    #    return
    #end

    puts("Thank you. The source you selected was #{source} and the destination #{destination}.")
    tow.move(source,destination)
    #check if the user won the game
    
    puts("Tower 1 is now #{tow.tower_1}")
    puts("Tower 2 is now #{tow.tower_2}")
    puts("Tower 3 is now #{tow.tower_3}")
    
    if(tow.tower_2==winning_tower || tow.tower_3==winning_tower)
        puts("Congrats! You won the game!")
        break
    end
end