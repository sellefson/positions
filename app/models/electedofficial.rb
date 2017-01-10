class Electedofficial < ApplicationRecord
  # Direct associations

  has_many   :seats,
             :foreign_key => "position_id",
             :dependent => :destroy

  # Indirect associations

  has_many   :officials,
             :through => :seats,
             :source => :official

  # Validations

end
