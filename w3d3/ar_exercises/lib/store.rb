class Store < ActiveRecord::Base

  has_many :employees

  validates :name, presence: true, length: { minimum: 3 }
  validates :annual_revenue, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validate :store_should_have_at_least_one_apparel

  def store_should_have_at_least_one_apparel
    if !mens_apparel && !womens_apparel
      errors.add(:store, "must have at least one type of apparel")
    end
  end

end
