class Kudo < ApplicationRecord
  validates :title, presence: true
  validates :content, presence: true

  belongs_to :giver, class_name: 'Employee', inverse_of: :given_kudos
  belongs_to :receiver, class_name: 'Employee', inverse_of: :received_kudos
end
