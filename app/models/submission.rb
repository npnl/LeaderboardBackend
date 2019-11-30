class Submission < ApplicationRecord
  belongs_to :user

  has_many :assessments

  validates :score, presence: true

  attr_accessor :submitted_by

  def submitted_by
    self.user.name
  end

  def as_json(options = { })
    h = super(options)
    h[:submitted_by] = submitted_by
    h
  end

end
