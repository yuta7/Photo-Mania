class User < ApplicationRecord
  
  before_save { self.email = email.downcase }
  validates :name,  presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
                    
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }
  
  has_one_attached :avatar
  #validate :image_presence

  #def avatar_presence
    #if avatar.attached?
      #if !avatar.content_type.in?(%('image/jpeg image/png'))
        #errors.add(:image,'にはjpegまたはpngファイルを添付してください')
      #end
    #else
      #errors.add(:image, 'ファイルを添付してください')
    #end
  #end
   #mount_uploader :image, ImageUploader
  
end
