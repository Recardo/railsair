class Country < ActiveRecord::Base
  validates :code, :presence => true
  validates :code, :length => {:is => 2}
  validates :code, :uniqueness => true
  validates :name, :presence => true

  has_many :airports
end
