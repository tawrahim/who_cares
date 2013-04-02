namespace :db do
  #describe "Fill in with sample method"
  task populate: :environment do
   admin = User.create!(name: "Example User",
                email: "taw-ye@me.com",
                password: "foobar",
                password_confirmation: "foobar")
   admin.toggle!(:admin)

   99.times do |n|
     name = Faker::Name.name
     email = "example-#{n+1}@me.org"
     password = "password"
     User.create!(name: name, email: email, password: password,
                  password_confirmation: password)
   end
  end
end 
    
