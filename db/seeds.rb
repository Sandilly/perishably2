require_relative '../app/models/scraper.rb'
require 'pry'

makeup_array= []
scraper = Scraper.new("www.bellasugar.com/When-Throw-Makeup-Away-Guidelines-Cosmetic-Life-Span-1124422")
scraper.fetch

scraper.parse('.tiptable tr') do |element|
  item = {}
  next if element.css('td').empty?
  item[:name] =  element.css('td')[0].text

  item[:storage] = "Keep in a cool and dry area"
  
  time_array= element.css('td')[1].text.split(" ")
  int_str = time_array[0].downcase #["18", "months"] ["one", "month"] ["12-18"- months] << checks for integers
  type_str = time_array[1].capitalize
  item[:unit_of_time_period] = type_str

  if int_str.to_i > 0
    item[:number_unit_of_time] = int_str.to_i.to_s
  else
    case int_str
      when "one"
        num = 1
        item[:number_unit_of_time] = num.to_s
        item[:unit_of_time_period] = type_str
      when "two"
        num = 2
        item[:number_unit_of_time] = num.to_s
        item[:unit_of_time_period] = type_str
      when "three"
        num = 3
        item[:number_unit_of_time] = num.to_s
        item[:unit_of_time_period] = type_str
      when "four"
        num = 4
        item[:number_unit_of_time] = num.to_s
        item[:unit_of_time_period] = type_str
      when "five"
        num = 5
        item[:number_unit_of_time] = num.to_s
        item[:unit_of_time_period] = type_str
      when "six"
        num = 6
        item[:number_unit_of_time] = num.to_s
        item[:unit_of_time_period] =  type_str
      when "seven"
        num = 7
        item[:number_unit_of_time] = num.to_s 
        item[:unit_of_time_period] = type_str
      when "eight"
        num = 8
        item[:number_unit_of_time] = num.to_s
        item[:unit_of_time_period] =  type_str
      when "nine"
        num = 9
        item[:number_unit_of_time] = num.to_s 
        item[:unit_of_time_period] = type_str
      when "ten"
        num = 10
        item[:number_unit_of_time] = num.to_s 
        item[:unit_of_time_period] = type_str
      when "eleven"
        num = 11
        item[:number_unit_of_time] = num.to_s 
        item[:unit_of_time_period] = type_str
      when "twelve"
        num = 12
        item[:number_unit_of_time] = num.to_s 
        item[:unit_of_time_period]=  type_str
      when "eleven"
        num = 11
        item[:number_unit_of_time] = num.to_s 
        item[:unit_of_time_period] = type_str
      when "twelve"
            num = 12
        item[:number_unit_of_time] = num.to_s 
        item[:unit_of_time_period] = type_str
      when "thirteen"
        num = 10
        item[:number_unit_of_time] = num.to_s
        item[:unit_of_time_period] = type_str
      when "fourteen"
        num = 14
        item[:number_unit_of_time] = num.to_s 
        item[:unit_of_time_period] = type_str
      when "fifteen"
        num = 15
        item[:number_unit_of_time] = num.to_s 
        item[:unit_of_time_period] = type_str
      when "sixteen"
        num = 16
        item[:number_unit_of_time] = num.to_s 
        item[:unit_of_time_period] = type_str
      when "seventeen"
        num = 17
        item[:number_unit_of_time] = num.to_s 
        item[:unit_of_time_period] = type_str
      when "eighteen"
        num = 18
        item[:number_unit_of_time] = num.to_s 
        item[:unit_of_time_period] = type_str
      when "nineteen"
        num = 19
        item[:number_unit_of_time] = num.to_s 
        item[:unit_of_time_period] = type_str
      when "twenty"
        num = 20
        item[:number_unit_of_time] = num.to_s
        item[:unit_of_time_period] =  type_str
      else
        item[:number_unit_of_time] = "--"
        item[:unit_of_time_period] = element.css('td')[1].text
    end

    item[:unit_of_time_period] = item[:unit_of_time_period].capitalize

    if item[:unit_of_time_period]=~ /Year$/
      item[:unit_of_time_period] = item[:unit_of_time_period].gsub("Year", "Year(s)")
    elsif item[:unit_of_time_period]=~ /Years$/
      item[:unit_of_time_period] = item[:unit_of_time_period].gsub("Years", "Year(s)")
    elsif item[:unit_of_time_period]=~ /Day$/
      item[:unit_of_time_period] = item[:unit_of_time_period].gsub("Day", "Day(s)")
    elsif item[:unit_of_time_period]=~ /Days$/
      item[:unit_of_time_period] = item[:unit_of_time_period].gsub("Days", "Day(s)")
    # elsif item[:unit_of_time_period]=~ /\bMonth\b/i
    #   item[:unit_of_time_period] = item[:unit_of_time_period].gsub("Month", "Month(s)")
    # elsif item[:unit_of_time_period]=~ /\bMonths\b/i
    #   item[:unit_of_time_period] = item[:unit_of_time_period].gsub("Months", "Month(s)")
    elsif item[:unit_of_time_period]=~ /Week$/
      item[:unit_of_time_period] = item[:unit_of_time_period].gsub("Week", "Week(s)")
    elsif item[:unit_of_time_period]=~ /Weeks$/
      item[:unit_of_time_period] = item[:unit_of_time_period].gsub("Weeks", "Week(s)")
    # elsif item[:unit_of_time_period]=~ /\bmonths\b/
    #   item[:unit_of_time_period] = item[:unit_of_time_period].gsub("month", "Month(s)")
    # elsif item[:unit_of_time_period]=~ /\bmonths\b/
    #   item[:unit_of_time_period] = item[:unit_of_time_period].gsub("months", "Month(s)")
    end

  end
  makeup_array << item
  

end


makeup_array.each do |element|
  #[{:name => "mascara",:expiration => "12 months"}]
  # {:name => "mascara",:expiration => "12 months"}
  product = Product.new

  product.name = element[:name]

  product.number_unit_of_time = element[:number_unit_of_time]
  product.unit_of_time_period = element[:unit_of_time_period]
  if product.unit_of_time_period=~ /\bMonth\b/i
      product.unit_of_time_period = product.unit_of_time_period.gsub("Month", "Month(s)")
  end
  if product.unit_of_time_period=~ /\bMonths\b/i
    product.unit_of_time_period = product.unit_of_time_period.gsub("Months", "Month(s)")   
  end
  product.storage = element[:storage]
  product.save
end



