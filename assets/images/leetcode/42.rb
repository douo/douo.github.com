# coding: utf-8
# @param {Integer[]} height
# @return {Integer}
require "pp"
def trap(height)
  stack = []
  sum = 0
  height.each_with_index do |val,idx|
    # pp [val,idx]
    if val != 0
      offset = 0 # 偏移
      while not stack.empty? do
        pi = stack.last
        if height[pi] <= val
          sum = sum + (idx - pi - 1) * (height[pi] - offset);
          offset = height[stack.pop] # 子矩形计算完毕
        elsif val > offset
          sum = sum + (idx - pi - 1) * (val - offset)
          break
        else
          break
        end
      end
      # pp [stack, sum, offset]
      stack.push idx
    end
  end
  sum
end

puts trap([0,1,0,2,1,0,1,3,2,1,2,1])
puts trap([12,11,10,9,8,7,6,5,4,3,2,1,12])
puts trap([3,1,0,1,2])
puts trap([5,0,1])
puts trap([1])

