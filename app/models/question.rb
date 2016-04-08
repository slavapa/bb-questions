class Question < ActiveRecord::Base
    after_create :send_notify
    
    validates :name, presence: true, length: { maximum: 255 }
    validates :question, presence: true
    # validates :ip, presence: true
    
    
  private
  def send_notify
    # Escape single quoted strings by inserting 2 of them
    self.class.connection.execute %Q(NOTIFY #{AsyncEvents::CHANNEL}, '#{to_json.gsub("'", "''")}')
    true
  end
end
