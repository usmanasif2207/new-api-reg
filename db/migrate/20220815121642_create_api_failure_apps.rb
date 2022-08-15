class CreateApiFailureApps < ActiveRecord::Migration[7.0]
  def change
    create_table :api_failure_apps do |t|

      t.timestamps
    end
  end
end
