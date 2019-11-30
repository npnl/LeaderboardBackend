class Group < ApplicationRecord
  has_many :users
  has_many :subjects
  has_many :submissions
  validates :name, presence: true, uniqueness: {case_sensitive: false}

  def user_count
    self.users.count
  end

  def submissions_count
    count = 0
    self.users.each do |user|
      count += user.submissions.count
    end
    count
  end

  def best_submission
    best_score = 0
    best_sub = nil
    self.users.each do |user|
      puts "#{user}"
      if user.best_submission.score > best_score
        best_score = user.best_submission.score
        best_sub = user.best_submission
      end
    end
    best_sub
  end

  def as_json(options = { })
    h = super(options)
    h[:user_count] = user_count
    h[:submissions] = submissions_count
    h[:best_submission] = best_submission
    h
  end
end
