class House < ApplicationRecord
    belongs_to :district, optional: true
    has_many :labels
    has_many :housepictures
    has_many :pins
end
