puts "criando administrador padrão..."
admin = User.new(name: 'Admin', email: 'admin@email.com', password: 'quiz', password_confirmation: 'quiz')
admin.admin = true
admin.save
puts "email: #{admin.email}"
puts "senha: quiz"

# puts "Criando quiz de exemplo..."
# Quiz.create(name: 'Saúde bucal')

# puts "Criando questões de exemplo..."
# Question.create(description: 'Questão 01...', explanation: 'Explicação 01...', quiz_id: 1, choices_attributes: {0 => {description: 'Alternativa A', correct: 1}, 1 => {description: 'Alternativa B', correct: 0}, 2 => {description: 'Alternativa C', correct: 0}, 3 => {description: 'Alternativa D', correct: 0}})
# Question.create(description: 'Questão 02...', explanation: 'Explicação 02...', quiz_id: 1, choices_attributes: {0 => {description: 'Alternativa A', correct: 1}, 1 => {description: 'Alternativa B', correct: 0}, 2 => {description: 'Alternativa C', correct: 0}, 3 => {description: 'Alternativa D', correct: 0}})
# Question.create(description: 'Questão 03...', explanation: 'Explicação 03...', quiz_id: 1, choices_attributes: {0 => {description: 'Alternativa A', correct: 1}, 1 => {description: 'Alternativa B', correct: 0}, 2 => {description: 'Alternativa C', correct: 0}, 3 => {description: 'Alternativa D', correct: 0}})
# Question.create(description: 'Questão 04...', explanation: 'Explicação 04...', quiz_id: 1, choices_attributes: {0 => {description: 'Alternativa A', correct: 1}, 1 => {description: 'Alternativa B', correct: 0}, 2 => {description: 'Alternativa C', correct: 0}, 3 => {description: 'Alternativa D', correct: 0}})
# Question.create(description: 'Questão 05...', explanation: 'Explicação 05...', quiz_id: 1, choices_attributes: {0 => {description: 'Alternativa A', correct: 1}, 1 => {description: 'Alternativa B', correct: 0}, 2 => {description: 'Alternativa C', correct: 0}, 3 => {description: 'Alternativa D', correct: 0}})
# Question.create(description: 'Questão 06...', explanation: 'Explicação 06...', quiz_id: 1, choices_attributes: {0 => {description: 'Alternativa A', correct: 1}, 1 => {description: 'Alternativa B', correct: 0}, 2 => {description: 'Alternativa C', correct: 0}, 3 => {description: 'Alternativa D', correct: 0}})
# Question.create(description: 'Questão 07...', explanation: 'Explicação 07...', quiz_id: 1, choices_attributes: {0 => {description: 'Alternativa A', correct: 1}, 1 => {description: 'Alternativa B', correct: 0}, 2 => {description: 'Alternativa C', correct: 0}, 3 => {description: 'Alternativa D', correct: 0}})
# Question.create(description: 'Questão 08...', explanation: 'Explicação 08...', quiz_id: 1, choices_attributes: {0 => {description: 'Alternativa A', correct: 1}, 1 => {description: 'Alternativa B', correct: 0}, 2 => {description: 'Alternativa C', correct: 0}, 3 => {description: 'Alternativa D', correct: 0}})
# Question.create(description: 'Questão 09...', explanation: 'Explicação 09...', quiz_id: 1, choices_attributes: {0 => {description: 'Alternativa A', correct: 1}, 1 => {description: 'Alternativa B', correct: 0}, 2 => {description: 'Alternativa C', correct: 0}, 3 => {description: 'Alternativa D', correct: 0}})
# Question.create(description: 'Questão 10...', explanation: 'Explicação 10...', quiz_id: 1, choices_attributes: {0 => {description: 'Alternativa A', correct: 1}, 1 => {description: 'Alternativa B', correct: 0}, 2 => {description: 'Alternativa C', correct: 0}, 3 => {description: 'Alternativa D', correct: 0}})

puts "pronto!"
