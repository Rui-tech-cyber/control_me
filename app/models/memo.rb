class Memo < ApplicationRecord
  belongs_to :entry

  validates :content, length: { maximum: 100 }, allow_blank: true
end
