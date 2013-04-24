module InWords
  def in_words
    num = self
    if (0 <= num) and (num <= 13)
      return word_num_0to13( num)
    elsif (14 <= num) and (num <= 19)
      return word_num_14to19( num)
    elsif (20 <= num) and (num <= 99)
      return word_num_20to99( num)
    elsif (100 <= num) and (num <= 999)
      return word_num_100to999( num)
    else
      raise "invalid number: #{num}"
    end
  end
  private
    def word_num_0to13 num
      num_names = { 0 => "zero", 1 => "one", 2 => "two", 3 => "three", 4 => "four",
                    5 => "five", 6 => "six", 7 => "seven", 8 => "eight", 9 => "nine", 
                    10 => "ten", 11 => "eleven", 12 => "twelve", 13 => "thirteen" }
      num_names[ num]
    end
    def word_num_14to19 num
      word_num_0to13( (num.to_s[-1]).to_i) + "teen"
    end
    def word_num_20to99 num
      num_names = { 2 => "twenty", 3 => "thirty", 4 => "forty", 5 => "fifty", 
                    6 =>"sixty", 7 => "seventy", 8 => "eighty", 9 => "ninety"}
      return num_names[ (num.to_s[0]).to_i] if num % 10 == 0
      num_names[ (num.to_s[0]).to_i] + " " + word_num_0to13( (num.to_s[-1]).to_i)
    end
    def word_num_100to999 num
      return word_num_0to13( (num.to_s[0]).to_i) + " hundred" if num % 100 == 0
      return word_num_0to13( (num.to_s[0]).to_i) + " hundred " + word_num_0to13( (num.to_s[-2..-1]).to_i) if (num.to_s[-2..-1]).to_i <= 13
      word_num_0to13( (num.to_s[0]).to_i) + " hundred " + word_num_20to99( (num.to_s[-2..-1]).to_i)
    end
end
    
class Fixnum
 include InWords
end



