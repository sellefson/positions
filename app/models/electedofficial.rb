class Electedofficial < ApplicationRecord
  # Direct associations

  has_many   :seats,
             :foreign_key => "position_id",
             :dependent => :destroy

  # Indirect associations

  # Validations

end
