class Seat < ApplicationRecord
  # Direct associations

  belongs_to :official,
             :class_name => "Position"

  # Indirect associations

  # Validations

end
