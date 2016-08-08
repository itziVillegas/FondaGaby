class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :name, presence: { },
            :length => { :minimum => 3 }

  validates :lastname, presence: { },
            :length => { :minimum => 3 }

  validates :phone, presence: { },
            numericality: { only_integer: true },
            :length => { :minimum => 10, :maximum => 10 }
end
