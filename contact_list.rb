contact_list = []

def ask(question, kind="string")
  print question + " "
  answer = gets.chomp
  answer.to_i if kind == "number"
  return answer
end

answer = ask("Hey big boy, what is your name?")
puts answer
