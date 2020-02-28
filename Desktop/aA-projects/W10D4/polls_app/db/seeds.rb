# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
 User.destroy_all
  Poll.destroy_all
  Question.destroy_all
  AnswerChoice.destroy_all
  Response.destroy_all
u=User.create!(username: 'test')
u2=User.create!(username: 'test2')
u3=User.create!(username: 'test3')
u4=User.create!(username: 'test4')
p=Poll.create!(title:"Food Poll",author: u)
q=Question.create!(text:"What is your favorite place for food?",poll: p)
a=AnswerChoice.create!(text:"In N Out",question: q)
a2=AnswerChoice.create!(text:"Pizza Hut",question: q)
a3=AnswerChoice.create!(text:"Any Michelin 3 star",question: q)
a4=AnswerChoice.create!(text:"Other",question: q)
q2=Question.create!(text:"Favorite Ice Cream",poll: p)
a5=AnswerChoice.create!(text:"Ben and Jerrys",question: q2)
a6=AnswerChoice.create!(text:"Madison Ice Cream",question: q2)
a7=AnswerChoice.create!(text:"I Like Frozen Yogurt More",question: q2)
Response.create!(answer_choice:a,user_id:u.id)
Response.create!(answer_choice:a2,user_id:u2.id)
Response.create!(answer_choice:a3,user_id:u3.id)
Response.create!(answer_choice:a4,user_id:u4.id)
