class TrainersLesson < ApplicationRecord
  belongs_to :trainer
  belongs_to :lesson
end