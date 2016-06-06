# array_utils.rb
#
# Problem: Write a ruby method that given an array of unsorted numbers 
# returns the missing number in the natural range for that array.
#
# Note: this implementation of #sort_and_fill demonstrates a functional style.
#
class ArrayUtils

  def initialize(array)
  	guard_argument_is_array array
    @array = array.sort
  end

  # Returns the input array sorted with elements added that 
  # fill in the natural sequence of the array.
  # 
  def sort_and_fill
  	return @array if array_is_too_small

    diffs     = differences_between_elements
    return @array if differences_are_same diffs

    insert_new_elements(diffs)
    @array
  end

  private

  def guard_argument_is_array(array)
  	msg = "Input must be an Array."
  	raise ArgumentError, msg unless array.respond_to?(:to_ary)
  end

  def array_is_too_small
    @array.size < 3
  end

  def differences_between_elements
    @array.each_cons(2).map { |a,b| b-a }
  end

  def differences_are_same(diffs)
    diffs.uniq.length == 1
  end

  def insert_new_elements(diffs)
    sequence = diffs.min

    @array.each_with_index do |element, index|
      next if index == 0
      current_seq = @array[index] - @array[index-1]
      
      next if current_seq == sequence

      # build new elements
      value = @array[index-1] + sequence
      new_elements = [value]
      while (value < @array[index] - sequence) do
        value += sequence
        new_elements << value
      end
      
      # insert new elements into array
      @array.insert(index, *new_elements)

    end 
  end
end

