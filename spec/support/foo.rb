class Foo < ActiveRecord::Base
  validates :bar, uniqueness: { via: :db }
end
