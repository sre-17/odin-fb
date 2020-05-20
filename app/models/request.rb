class Request < ApplicationRecord
    belongs_to :og_requests, class_name: "User" , foreign_key: :user_id
    belongs_to :ic_requests , class_name: "User" , foreign_key: :to_user_id
end
