class Thingy < ActiveRecord::Base
  has_many :roles, as: :resource
end
