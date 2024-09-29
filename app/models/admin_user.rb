class AdminUser < ApplicationRecord
    devise :database_authenticatable,
         :recoverable, :rememberable, :validatable
    def self.ransackable_attributes(auth_object = nil)
      %w[id email created_at]
    end
end
