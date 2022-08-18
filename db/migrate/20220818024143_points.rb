class Points < ActiveRecord::Migration[7.0]
  def change
    create_table :points do |t|
      t.st_point :lonlat, geographic: true
    end
  end
end
