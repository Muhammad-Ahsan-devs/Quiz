class QuizClass
  def initialize(quiz_question, number, correct, wrong)
    @quiz_question = quiz_question
    @number = number # question number showing right now on scree
    @correct = correct
    @wrong = wrong
  end

  def watch(timer)
    # this function is use as a stopwatch
    # it will terminate the program after time is over
    sleep timer
    exit
  rescue SystemExit
    puts "\n\nTotal Question: #{@quiz_question.length}"
    puts "Correct: #{@correct}"
    puts "Wrong: #{@wrong}"
  end

  def untimed_quiz
    total = @quiz_question.length

    # shwoing question one by one on screen
    @quiz_question.each do |q|
      puts "\nQuestion No. #{@number}/#{total}"
      puts q[0]
      print "\n Your Answer: "
      ans = gets.chomp

      if ans == q[1]
        @correct += 1
      else
        @wrong += 1
      end
      @number += 1
    end

    puts "\nTotal Question: #{@quiz_question.length}"
    puts "Correct: #{@correct}"
    puts "Wrong: #{@wrong}"
  end

  def timed_quiz
    puts "\n\nYour Default timer is of 30 second.\nDo you want to change the timer?"
    puts "1) Yes\t 2) No"
    opt = gets.chomp
    opt = opt.to_i

    unless [1, 2].include?(opt)
      puts 'Wrong Input'
      return
    end

    timer = 30
    if opt == 1 # flag used to change the timer if user wants
      print "\nPlease enter your timer value: "
      timer = gets.chomp
      timer = timer.to_i
    end

    puts "\nYour time starts now..."
    Thread.new { untimed_quiz(1) } # in this child thread the question will be shown to user
    watch(timer) # this is the start of stopwatch
  end
end
