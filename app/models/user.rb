class User < ActiveRecord::Base

  mount_uploader :avatar, AvatarUploader

  has_secure_password validations: false

  EMAIL_REGEX = /\A[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}\Z/i

  validates_presence_of :password, :on => :create
  validates_presence_of :password_confirmation
  validates_confirmation_of :password

  validates_presence_of :avatar

  has_many :pages
  has_many :comments

  validates :first_name, :presence => true,
                         :length => { :maximum => 25 }
  validates :last_name, :presence => true,
                        :length => { :maximum => 50 }
  validates :username, :presence => true,
                       :length => { :within => 4..25 },
                       :uniqueness => true
  validates :email, :presence => true,
                    :length => { :maximum => 100 },
                    :format => { :with => EMAIL_REGEX },
                    :confirmation => true
  
  delegate :title, to: :page, prefix: true

  def name
   "#{first_name} #{last_name}"
  end

  def uname
    "#{username}"
  end

  def image
      avatar
  end

 end
