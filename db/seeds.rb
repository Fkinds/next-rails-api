# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
unless Customer.exists?(id: 1 ... 10)
  10.times do |n|
		Customer.create!(
      # n + 1で数字が重複しないようにする
      email: "test#{n + 1}@test.com",
      first_name: "田中#{n + 1}",
      first_name_kana: "タナカ#{n + 1}",
      last_name: "太郎#{n + 1}",
      last_name_kana: "タロウ#{n + 1}",
      zip_code: "ddd#{n + 1}",
      address: "sss#{n + 1}",
			phone_number: "xxx#{n + 1}",
      password: "password",
			confirm_success_url: "http://localhost:3000"
    )
  end
end