class Position < ApplicationRecord
  # Direct associations

  belongs_to :district

  has_many   :seats,
             :foreign_key => "official_id",
             :dependent => :destroy

  # Indirect associations

  # Validations

end
