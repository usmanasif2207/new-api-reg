class Dropapifailure < ActiveRecord::Migration[7.0]
  def change
    drop_table :api_failure_apps do |t|

      t.timestamps
  end
end
end