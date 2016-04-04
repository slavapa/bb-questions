class Question < ActiveRecord::Base
    validates :name, presence: true, length: { maximum: 255 }
    validates :question, presence: true
    # validates :ip, presence: true
end
