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

    positions = indexes_of_missing_elements diffs

    insert_new_elements(positions, diffs)
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

  def indexes_of_missing_elements(diffs)
  	max = diffs.max
    #diffs.each_with_index.map { |a, i| a == max ? i : nil }.compact
    (0..diffs.size-1).select { |x| diffs[x] == max }
  end

  # The array grows each time you add an element to the array.
  # To calculate the index in array for the next element 
  # we add position and index in the positions array.
  #
  def insert_new_elements(positions, diffs)
  	min = diffs.min
    positions.each_with_index do |position, index|
    	insert_index = position + index
      value = @array[insert_index] + min
      @array.insert(insert_index + 1, value)  
    end 
  end

end
