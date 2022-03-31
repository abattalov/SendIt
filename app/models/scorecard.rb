class Scorecard < ActiveRecord::Base
    belongs_to :user
    validates :course_name, :strokes, :score, :date, presence: true
end