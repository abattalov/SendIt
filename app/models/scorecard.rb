class Scorecard < ActiveRecord::Base
    belongs_to :User
    validates :course_name, :strokes, :score, :date, presence: true
end