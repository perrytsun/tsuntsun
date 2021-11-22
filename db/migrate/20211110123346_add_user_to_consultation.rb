class AddUserToConsultation < ActiveRecord::Migration[6.1]
  def change
    add_column :consultations, :user_id, :integer
  end
end
