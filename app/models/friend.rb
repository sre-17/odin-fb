class Friend < ApplicationRecord
    belongs_to :self_confirming, class_name: "User" , foreign_key: :user_id
    belongs_to :they_confirming , class_name: "User" , foreign_key: :friend_id
end
