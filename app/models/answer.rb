class Answer < ApplicationRecord
  # rails g model answer question:references name:string content:text
  # ↑ question:references が　モデルの紐付けとなる
  # Answerモデルはquestionモデルに紐付くという事になる
  belongs_to :question
end
