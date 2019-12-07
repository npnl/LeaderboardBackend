class Submission < ApplicationRecord
  belongs_to :user

  has_many :assessments

  validates :score, presence: true

  attr_accessor :submitted_by

  def submitted_by
    puts "#{self.user.inspect}"
    self.user.slice(:name, :email)
  end

  def as_json(options = {:except => [:created_at, :updated_at] })
    h = super(options)
    h[:submitted_by] = submitted_by
    h
  end

end
