class ChangePhoneNumberToRestaurants < ActiveRecord::Migration[6.1]
  change_table :restaurants do |t|
    t.change :phone_number, :string
  end
end
