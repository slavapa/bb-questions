#encoding: utf-8

@connection = ActiveRecord::Base.connection

def random_string(length = 8)
  rand(32**length).to_s(32)
end

def make_users  
  if  !User.exists?(:email => "slavapas13@gmail.com")
    User.create!(name:'Slava', family_name:'Pasechnik', 
    email:'slavapas13@gmail.com', password:'xxxxxx', password_confirmation:'xxxxxx',
    admin: true)
  end
  
  if  !User.exists?(:email => "nukegluk@gmail.com")
    User.create!(name:'Genady', family_name:'Petelko', 
    email:'nukegluk@gmail.com', password:'xxxxxx', password_confirmation:'xxxxxx',
    admin: true)
  end
  
  # if User.count < 30 
  #   30.times do |i| 
  #     lupName = "#{random_string()}#{i}" 
  #     User.create!(name: lupName, family_name: random_string(), 
  #     email:"#{lupName}@gmail.com", password:'xxxxxx', password_confirmation:'xxxxxx',
  #     admin: true)
  #   end
  # end
  
end

make_users
