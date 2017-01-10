class Position < ApplicationRecord
  # Direct associations

  has_many   :seats,
             :foreign_key => "official_id",
             :dependent => :destroy

  # Indirect associations

  # Validations

end
