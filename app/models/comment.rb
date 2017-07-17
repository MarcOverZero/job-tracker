class Comment < ApplicationRecord
  validates :notes, presence: true
  belongs_to :job, optional: true 
end
