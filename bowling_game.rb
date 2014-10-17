class BowlingGame
  attr_accessor :tracker, :points

  def initialize
    @frames = 0
    @points = []

    @tracker = []
  end

  def roll

    until @frames == 10 do
      puts "Frame: #{@frames+1}"
      print "What was your first roll: "
      roll_1 = gets.chomp.to_i
      raise ArgumentError.new("Roll cannot be greater than 10") if roll_1 > 10
        if roll_1 == 10
          roll_2 = 0
          puts "You got a strike!"
          check_previous_frame(roll_1, roll_2)
          @tracker << "strike"
        else
          print "What was your second roll:"
          roll_2 = gets.chomp.to_i
          raise ArgumentError.new("Impossible roll") unless roll_2 <= 10-roll_1
            if roll_1 + roll_2 == 10
              puts "You got a spare!"
               check_previous_frame(roll_1, roll_2)
              @tracker << "spare"
            else
              check_previous_frame(roll_1, roll_2)
              @tracker << "normal"
            end
        end
      next_frame

    end
  end

  def bonus_roll
    if  @tracker.last == "strike" && @tracker.length <12
      puts "You get two bonus rolls!"

      print "What was your first roll: "
      broll_1 = gets.chomp.to_i
      print "What was your first roll: "
      broll_2 = gets.chomp.to_i

      @points << [broll_1, broll_2]
    elsif tracker.last == "spare"
      puts "You get one bonus roll!"
      broll_1 = gets.chomp.to_i
      print "What was your first roll: "
      @points << [broll_1, 0]
    end
  end

  def score
    puts "Your final score is: #{@points.flatten.reduce(:+)}"
  end


private

  def  check_previous_frame(roll_1, roll_2)
      if @tracker.last == "strike"
        @points << [roll_1*2, roll_2*2]
      elsif @tracker.last == "spare"
        @points << [roll_1*2, roll_2]
      else
        @points << [roll_1, roll_2]
      end
  end

  def next_frame
    @frames += 1
  end

end

game = BowlingGame.new
game.roll
game.bonus_roll
game.score