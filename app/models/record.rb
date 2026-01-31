class Record < ApplicationRecord
  belongs_to :user
  has_many :memos, dependent: :destroy

  validates :record_date, presence: true
end
