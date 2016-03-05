class WeightEntry < ActiveRecord::Base
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :value, presence: true, length: { maximum: 3 }, numericality: { only_integer: true }
end
