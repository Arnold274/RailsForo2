class Post < ApplicationRecord
    has_rich_text :content
    belongs_to :user # campo adiccional que indica el 1 de la relacion
end
