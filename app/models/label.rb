class Label < ApplicationRecord
    #belongs_to :house ,optional: true
    has_many :tag_relations
    has_many :houses, through: :tag_relations
end
