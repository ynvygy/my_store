class Product < ActiveRecord::Base
  belongs_to :category
  has_many :line_items
  before_destroy :ensure_not_referenced_by_any_line_item
  mount_uploader :image, ImageUploader

  validates_presence_of :name, :price
  validates_numericality_of :price

  private

  def ensure_not_referenced_by_any_line_item
  	if line_items.empty?
  		return true
  	else
  		errors.add(:base, "Line Items present")
  		return false
  	end
  end
end


