class Airport < ActiveRecord::Base
  validates :name, :presence => true
  validates :code, :presence => true
  validates :code, :length => {:is => 3}
  validates :code, :uniqueness => true
  validates :country_id, :presence => true
  belongs_to :country
end
