class Booking < ApplicationRecord
  validates_presence_of :first_name,
                        :last_name,
                        :animal_name,
                        :animal_type,
                        :hours_requested,
                        :date_of_service
end


