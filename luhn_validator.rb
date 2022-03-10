# frozen_string_literal: true

# Top level doc :)
module LuhnValidator
  # Validates credit card number using Luhn Algorithm
  # arguments: none
  # assumes: a local String called 'number' exists
  # returns: true/false whether last digit is correct
  # rubocop:disable Metrics/AbcSize
  def validate_checksum
    nums_a = number.to_s.chars.map(&:to_i)

    # TODO: use the integers in nums_a to validate its last check digit
    nums_p = nums_a.reverse.map.with_index { |item, index| index.odd? ? item * 2 : item }
    sum_digits = nums_p.map { |product| product.to_s.chars.map(&:to_i).sum }
    ((10 - sum_digits.sum % 10) % 10).zero?
  end
  # rubocop:enable Metrics/AbcSize
end
