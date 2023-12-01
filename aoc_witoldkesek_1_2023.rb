# Part one
values_array = []
File.open("input.txt").each { |line| values_array << line }
values_numbers = values_array.map do |value|
  digits = []
  value.chars.each { |v| digits << v if v.to_i != 0 || v == "0" }
  digits
  "#{digits.first}#{digits.last}".to_i
end
values_numbers.sum

#Part two
digits_hash = {
  "one" => 1,
  "two" => 2,
  "three" => 3,
  "four" => 4,
  "five" => 5,
  "six" => 6,
  "seven" => 7,
  "eight" => 8,
  "nine" => 9,
}

values_numbers2 = values_array.map do |value|
  digits = []
  digits_hash.keys.each do |key|
    # key.chars.last i key.chars.first, bo mogą być początkiem / końcem innej liczby
    value = value.gsub(key, "#{key.chars.first}#{digits_hash[key].to_s}#{key.chars.last}") if value.include? key
  end
  value.chars.each { |v| digits << v if v.to_i != 0 || v == "0" }
  "#{digits.first}#{digits.last}".to_i
end
values_numbers2.sum
