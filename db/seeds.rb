#encoding: utf-8

@connection = ActiveRecord::Base.connection

def random_string(length = 8)
  rand(32**length).to_s(32)
end

def create_app_setup_types
  unless AppSetupType.exists?(id: 1) 
    AppSetupType.create id: 1, name: 'String'
  end
  
  unless AppSetupType.exists?(id: 2) 
    AppSetupType.create id: 2, name: 'Integer'
  end
  
  unless AppSetupType.exists?(id: 3) 
    AppSetupType.create id: 3, name: 'Float'
  end
  
  unless AppSetupType.exists?(id: 4) 
    AppSetupType.create id: 4, name: 'Attachment'
  end
end

def create_languages
  unless Language.exists?(id: 1) 
    Language.create id: 1, code: 'en', name: 'English'
  end
  
  unless Language.exists?(id: 2) 
    Language.create id: 2, code: 'he', is_rtl: true, name: 'עברית'
  end
  
  unless Language.exists?(id: 3) 
    Language.create id: 3, code: 'ru', name: 'Русский'
  end
end

def create_application_setups
  unless ApplicationSetup.exists?(code_id: 'organization_name', language_id: 1)
    ApplicationSetup.create app_setup_type_id: AppSetupType::STRING, language_id: Language::ENGLISH, 
      code_id: 'organization_name', description: 'Organization name', 
      str_value: 'BB Questions'
  end
  
  unless ApplicationSetup.exists?(code_id: 'organization_name', language_id: 2)  
    ApplicationSetup.create app_setup_type_id: AppSetupType::STRING, language_id: Language::HEBREW, 
      code_id: 'organization_name', description: 'Organization name', 
      str_value: 'בב שאלות'
  end
  
  unless ApplicationSetup.exists?(code_id: 'organization_name', language_id: 3)    
    ApplicationSetup.create app_setup_type_id: AppSetupType::STRING, language_id: Language::RUSSIAN, 
      code_id: 'organization_name', description: 'Organization name', 
      str_value: 'ББ Вопросы'
  end
  
  unless ApplicationSetup.exists?(code_id: 'target_trans_lang', language_id: 3)
    ApplicationSetup.create app_setup_type_id: AppSetupType::INTEGER,  
      code_id: 'target_trans_lang', description: 'Target Translation Language', 
      str_value: '2'
  end 
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

create_app_setup_types
create_languages
create_application_setups
make_users
