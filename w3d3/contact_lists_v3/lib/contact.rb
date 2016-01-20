class Contact < ActiveRecord::Base

  validates :name, :email, presence: true
  # validates :change, something: {false}
  
end