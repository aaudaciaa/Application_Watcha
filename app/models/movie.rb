class Movie < ActiveRecord::Base
  has_many :reviews

  def number
    self.reviews.count
  end

  def sum
    sum = 0
    self.reviews.each do |r|
      sum += r.rating
    end
    sum.to_f
  end

  def average
    avg = sum / number
    if avg
      avg
    else
      0
    end
  end
end
