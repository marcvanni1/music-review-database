class Classification < ApplicationRecord
    belongs_to :album
    belongs_to :song
    belongs_to :genre
end
