class Movie < ApplicationRecord
  
 has_many :reviews
 mount_uploader :image, ImageUploader

  validates :title,
    presence: true

  validates :director,
    presence: true

  validates :runtime_in_minutes,
    numericality: { only_integer: true }

  validates :description,
    presence: true

  validates :image,
    presence: true

  validates :release_date,
    presence: true

  validate :release_date_is_in_the_past

  def review_average
    reviews.sum(:rating_out_of_ten) / reviews.size unless reviews.empty?
  end

  protected

  def release_date_is_in_the_past
    if release_date.present? && release_date > Date.today
      errors.add(:release_date, "should be in the past")
    end
  end

  def self.title(title) 
    where("title like ?", "%#{title}%")
  end

  def self.director(director) 
    where("director like ?", "%#{director}%")
  end

  def duratin_under_90(duration)
     duration = where("runtime_in_minutes < ?", 90)
  end  
  def duratin_above_90_under_120(duration)
      duration = where("runtime_in_minutes > ?", 90..120)
  end 
  def duratin_above_90(duration)
    duration = where("runtime_in_minutes > ?", 120)
  end 

end





