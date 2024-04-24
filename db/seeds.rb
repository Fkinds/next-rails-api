# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)  
  unless Genre.exists?(id: 1 ... 10)
    10.times do |n|
      Genre.create!(
        name: "name#{n + 1}"
      )
    end
  end
  
  unless Item.exists?(id: 1 ... 10)
    10.times do |n|
      Item.create!(
        # genre_id: Genre.find_by(name: "name#{n + 1}").id,
        genre_id: Genre.find("#{n+1}").id,
        name: "item#{n + 1}",
        price: "1000#{n + 1}",
        introduction: "test#{n + 1}",
        is_sold: "false"
      )
    end
  end