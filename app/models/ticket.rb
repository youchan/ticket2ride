class Ticket < ActiveRecord::Base
  attr_accessible :description, :done, :title

  validates :title, :presence => true
  validates :description, :presence => true,
                          :length => { :minimum => 5 }

end
