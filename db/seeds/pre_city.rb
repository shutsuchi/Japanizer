require 'csv'

CSVROW_PREFNAME = 6
CSVROW_PREFENNAME = 7
CSVROW_CITYNAME = 8
CSVROW_CITYENNAME = 9

CSV.foreach('db/csv/pref_city.CSV', encoding: "Shift_JIS:UTF-8") do |row|
  prefecture_name = row[CSVROW_PREFNAME]
  prefecture_en_name = row[CSVROW_PREFENNAME]
  city_name = row[CSVROW_CITYNAME]
  city_en_name = row[CSVROW_CITYENNAME]
  prefecture = Prefecture.find_or_create_by(name: prefecture_name, en_name: prefecture_en_name)
  City.find_or_create_by(name: city_name, en_name: city_en_name, prefecture_id: prefecture.id)
end
