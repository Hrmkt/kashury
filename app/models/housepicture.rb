class Housepicture < ApplicationRecord
    belongs_to :house, optional: true
end
