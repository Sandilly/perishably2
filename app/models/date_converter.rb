require 'pry'

class DateStringConverter
  @products = []
  def convert(product_array)
    item = {}
    
    product_array.each do |hash|
      item[:name] = hash[:name]
      
      if hash[:storage].nil?
        item[:storage] = "Cool and dry area"
      else
        item[:storage] = hash[:storage]
      end 

      time_array = hash[:time].split(" ")
      int_str = time_array[0].downcase#["18", "months"] ["one", "month"] ["12-18"- months] << checks for integers
      type_str = time_array[1]

      
      if int_str.to_i > 0
        item[:time] = int_str.to_i.to_s + " " + type_str
      else
        case int_str
          when "one"
            num = 1
            item[:time] = num.to_s + " " + type_str
          when "two"
            num = 2
            item[:time] = num.to_s + " " + type_str
          when "three"
            num = 3
            item[:time] = num.to_s + " " + type_str
          when "four"
            num = 4
            item[:time] = num.to_s + " " + type_str
          when "five"
            num = 5
            item[:time] = num.to_s + " " + type_str
          when "six"
            num = 6
            item[:time] = num.to_s + " " + type_str
          when "seven"
            num = 7
            item[:time] = num.to_s + " " + type_str
          when "eight"
            num = 8
            item[:time] = num.to_s + " " + type_str
          when "nine"
            num = 9
            item[:time] = num.to_s + " " + type_str
          when "ten"
            num = 10
            item[:time] = num.to_s + " " + type_str
          when "eleven"
            num = 11
            item[:time] = num.to_s + " " + type_str
          when "twelve"
            num = 12
            item[:time] = num.to_s + " " + type_str
          when "eleven"
            num = 11
            item[:time] = num.to_s + " " + type_str
          when "twelve"
            num = 12
            item[:time] = num.to_s + " " + type_str
          when "thirteen"
            num = 10
            item[:time] = num.to_s + " " + type_str
          when "fourteen"
            num = 14
            item[:time] = num.to_s + " " + type_str
          when "fifteen"
            num = 15
            item[:time] = num.to_s + " " + type_str
          when "sixteen"
            num = 16
            item[:time] = num.to_s + " " + type_str
          when "seventeen"
            num = 17
            item[:time] = num.to_s + " " + type_str
          when "eighteen"
            num = 18
            item[:time] = num.to_s + " " + type_str
          when "nineteen"
            num = 19
            item[:time] = num.to_s + " " + type_str
          when "twenty"
            num = 20
            item[:time] = num.to_s + " " + type_str
          else
            item[:time] = hash[:time]
          end
        end
      end
      binding.pry
    end

    # def is_i?(string)
    #    !!(self =~ /\A[-+]?[0-9]+\z/)
    # end
  end
end



# makeup_arr = [{:name=>"Mascara", :time=>"One year"},
#  {:name=>"Foundation", :time=>"One Year"},
#  {:name=>"Concealer", :time=>"12-18 months"},
#  {:name=>"Powder", :time=>"18 months"},
#  {:name=>"Blush/bronzer", :time=>"18 months"},
#  {:name=>"Cream blush", :time=>"12-18 months"},
#  {:name=>"Eye shadow", :time=>"18 months"},
#  {:name=>"Eyeliner", :time=>"18 months"},
#  {:name=>"Liquid eyeliner", :time=>"Six months"},
#  {:name=>"Eyeliner", :time=>"18 months"},
#  {:name=>"Liquid eyeliner", :time=>"Six months"},
#  {:name=>"Lipstick/lip gloss", :time=>"18 months"},
#  {:name=>"Lip liner", :time=>"One year"},
#  {:name=>"Nail polish", :time=>"One year"},
#  {:name=>"Makeup sponges", :time=>"Wash after each use, then throw away after a month."}]

 makeup_arr = [{:name=>"Mascara", :time=>"One year"},
 {:name=>"Foundation", :time=>"Two Year"},
 {:name=>"Concealer", :time=>"14-20 months"},
 {:name=>"Powder", :time=>"Nine months"},
 {:name=>"Blush/bronzer", :time=>"13 months"},
 {:name=>"Cream blush", :time=>"Seven months"},
 {:name=>"Eye shadow", :time=>"1 months"},
 {:name=>"Eyeliner", :time=>"four months"},
 {:name=>"Liquid eyeliner", :time=>"Six months"},
 {:name=>"Eyeliner", :time=>"three months"},
 {:name=>"Liquid eyeliner", :time=>"What the fuck months"},
 {:name=>"Lipstick/lip gloss", :time=>"18 months"},
 {:name=>"Lip liner", :time=>"five year"},
 {:name=>"Nail polish", :time=>"One year"},
 {:name=>"Makeup sponges", :time=>"Wash after each use, then throw away after a month."}]

 dc = DateStringConverter.new
 dc.convert(makeup_arr)


          when "eleven"
            num = 11
            item[:time] = num.to_s + " " + type_str
          when "twelve"
            num = 12
            item[:time] = num.to_s + " " + type_str
          when "thirteen"
            num = 10
            item[:time] = num.to_s + " " + type_str
          when "fourteen"
            num = 14
            item[:time] = num.to_s + " " + type_str
          when "fifteen"
            num = 15
            item[:time] = num.to_s + " " + type_str
          when "sixteen"
            num = 16
            item[:time] = num.to_s + " " + type_str
          when "seventeen"
            num = 17
            item[:time] = num.to_s + " " + type_str
          when "eighteen"
            num = 18
            item[:time] = num.to_s + " " + type_str
          when "nineteen"
            num = 19
            item[:time] = num.to_s + " " + type_str
          when "twenty"
            num = 20
            item[:time] = num.to_s + " " + type_str
          # when "twenty one" || "twenty-one" || "twentyone"
          #   num = 21
          #   item[:time] = num.to_s + " " + type_str
          # when "twenty two" || "twenty-two" || "twentytwo"
          #   num = 22
          #   item[:time] = num.to_s + " " + type_str
          # when "twenty three" || "twenty-three" || "twentythree"
          #   num = 23
          #   item[:time] = num.to_s + " " + type_str
          # when "twenty four" || "twenty-four" || "twentyfour"
          #   num = 24
          #   item[:time] = num.to_s + " " + type_str
          # when "twenty five" || "twenty-five" || "twentyfive"
          #   num = 25
          #   item[:time] = num.to_s + " " + type_str
          # when "twenty six" || "twenty-four" || "twentyfour"
          #   num = 26
          #   item[:time] = num.to_s + " " + type_str