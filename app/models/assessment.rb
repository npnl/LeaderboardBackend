class Assessment < ApplicationRecord
  belongs_to :subject
  belongs_to :user

  attr_accessor :assessed_by

  def assessed_by
    self.user.name
  end

  def as_json(options = { })
    h = super(options)
    h[:assessed_by] = assessed_by
    h
  end
end
