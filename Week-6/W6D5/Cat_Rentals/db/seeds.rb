# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Cat.destroy_all


Cat.create!(color: 'tabby', birth_date: '1895/01/20', name: 'Binx', sex: 'M', description: 'This cat was blessed by Satan')
Cat.create!(color: 'green', birth_date: '2021/04/20', name: 'Phore Twintee', sex: 'M', description: 'Balazay It')
Cat.create!(color: 'teal', birth_date: '2012/01/20', name: 'Sharkee', sex: 'F', description: 'California hockey fan')
Cat.create!(color: 'caramel', birth_date: '2015/01/20', name: 'Snoop Catt', sex: 'M', description: 'Best friends with Martha Stewart')

