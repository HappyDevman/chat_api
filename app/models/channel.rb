class Channel < ApplicationRecord
  belongs_to :owner, class_name: 'User', foreign_key: 'owner_id', inverse_of: 'channels'

  validates :name, presence: true
end
