class AddStatusToActivityLogs < ActiveRecord::Migration[6.0]
  def change
    add_column :activity_logs, :status, :integer, :default => 0
  end
end
