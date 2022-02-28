require 'csv'
require './quiz'
def main
  puts 'Please choose an option'
  puts "1) Quiz Without timer\n2) Quiz with timer"
  opt = gets.chomp
  opt = opt.to_i

  if [1, 2].include?(opt)
    quiz_question = CSV.read('problems.csv')
    quiz_obj = QuizClass.new(quiz_question, 1, 0, 0)
  end

  case opt
  when 1
    quiz_obj.untimed_quiz
  when 2
    quiz_obj.timed_quiz
  else
    puts "\nWrong Input"
  end
end

main
