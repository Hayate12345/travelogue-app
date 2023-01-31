class User < ApplicationRecord
  # ! リレーションの記述 多にあたるモデル名を複数形で書く)
  has_many :posts

  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable, :confirmable, :lockable, :timeoutable, :trackable
end
