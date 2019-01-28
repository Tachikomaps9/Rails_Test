class Question < ApplicationRecord
  # has_many : モデル名 questionモデルは複数のanswerを持つという事になる
  # deppendent: :destroy とあるQuestionモデルが削除されたら紐付くanswerも削除される
  has_many :answers, dependent: :destroy
  
  validates :name, presence: true
  validates :title, presence: true
  validates :content, presence: true
end
