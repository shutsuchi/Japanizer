require 'csv'

CSVROW_PREFNAME = 6
CSVROW_CITYNAME = 7

CSV.foreach('db/csv/prefecture.CSV', encoding: "Shift_JIS:UTF-8") do |row|
  prefecture_name = row[CSVROW_PREFNAME]
  city_name = row[CSVROW_CITYNAME]
  prefecture = Prefecture.find_or_create_by(name: prefecture_name)
  City.find_or_create_by(name: city_name, prefecture_id: prefecture.id)
end
