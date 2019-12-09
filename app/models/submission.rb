class Submission < ApplicationRecord
  include ActionView::Helpers::DateHelper
  belongs_to :user

  has_many :assessments

  validates :score, presence: true

  attr_accessor :submitted_by

  def submitted_by
    puts "#{self.user.inspect}"
    self.user.slice(:name, :email)
  end

  def as_json(options = {})
    h = super(options, [:created_at])
    h[:submitted_by] = submitted_by
    puts "The record is : #{h}"
    puts "The created at value is : #{h['created_at']}"
    h[:submission_time] = time_ago_in_words(h['created_at']) + ' ago'
    h.delete('created_at')
    h
  end

end
