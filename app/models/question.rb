class Question < ActiveRecord::Base
  before_validation(on: :create) do
    translate
  end
  
  after_create :send_notify
  
  validates :name, presence: true, length: { maximum: 255 }
  validates :question, presence: true
    # validates :ip, presence: true
    
   
  scope :selected,  -> { where(selected: [true]) }  
  scope :unselected,  -> { where(selected: [false, nil]) }
  
  private
  def send_notify
    # Escape single quoted strings by inserting 2 of them
    self.class.connection.execute %Q(NOTIFY #{AsyncEvents::CHANNEL}, '#{to_json.gsub("'", "''")}')
    true
  end
  
  def translate
    self.translation = question if attribute_present?("question")
  end
end
