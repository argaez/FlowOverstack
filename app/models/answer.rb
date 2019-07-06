class Answer < ApplicationRecord
  belongs_to :user
  belongs_to :question
  has_many :comments, as: :commentable
  has_many :votes, as: :votable


  def voted_by?(user)

    votes.exists?(user: user)

  end

end