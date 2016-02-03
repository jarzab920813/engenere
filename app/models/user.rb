class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :fleets
  has_many :vehicles
  has_many :events

  after_create :send_mail_informing


  def send_mail_informing
  	UserMailer.after_create(self).deliver

  end

end
