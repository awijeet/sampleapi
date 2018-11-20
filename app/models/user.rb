class User < ApplicationRecord
  has_one :profile
  validates_presence_of :mobile_number
  
  after_create :generate_smscode
  
  def generate_smscode
    self.update_column(:sms, rand(1000..10000))
  end
end
