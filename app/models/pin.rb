class Pin < ApplicationRecord
    belongs_to :house, optional: true
    belongs_to :user, optional: true
end
