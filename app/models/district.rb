class District < ApplicationRecord
  # Direct associations

  has_many   :positions,
             :dependent => :destroy

  # Indirect associations

  # Validations

end
