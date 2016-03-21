#encoding: utf-8

@connection = ActiveRecord::Base.connection


def make_users    
  User.create!(name:'Slava', family_name:'Pasechnik', 
  email:'slavapas13@gmail.com', password:'xxxxxx', password_confirmation:'xxxxxx',
  admin: true)
  
  User.create!(name:'Genady', family_name:'Petelko', 
  email:'nukegluk@gmail.com', password:'xxxxxx', password_confirmation:'xxxxxx',
  admin: true)
   
  User.create!(name:'Seal', family_name:'Seal', 
  email:'seal@gmail.com', password:'xxxxxx', password_confirmation:'xxxxxx',
  admin: true)
end

make_users
