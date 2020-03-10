# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Cat.destroy_all
C= Cat.create(birth_date: '2015/01/20', color:'white',name:'kitkat',sex:'m',description: "Small white cat.  Spends time outside and hunts. ")
C2= Cat.create(birth_date: '2017/04/19', color:'black',name:'pixie',sex:'f',description: "Small black cat.  Stays in the house and tries to get pet as frequently as possible.")