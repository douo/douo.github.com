require "pp"
# @param {Integer[]} nums1
# @param {Integer[]} nums2
# @param {Integer} k
# @return {Integer[]}
def max_number(nums1, nums2, k)
  iter(nums1,nums2,k,[])
end

def iter(nums1,nums2, k, result)
  return result if k == 0
  res = find(nums1, nums2, )
  pp res
  result << res[0][res[1]]
  if res[0] == nums1
    rec(nums1[res[1]+1..-1], nums2, k-1, result)
  else
    rec(nums1, nums2[res[1]+1..-1], k-1, result)
  end
end

def find(nums1, nums2, k)
  pp [nums1,nums2]
  step = nums1.size + nums2.size - k
  res1 = nums1[0..step].each_with_index.max
  res2 = nums2[0..step].each_with_index.max
  if res1 == nil
    [nums2,res2[1]]
  elsif res2 == nil
    [nums1,res1[1]]
  elsif res2 == nil or res1[0] > res2[0]
    [nums1,res1[1]]
  elsif res1 == nil or res1[0] < res2[0]
    [nums2,res2[1]]
  else
    result1 = iter(nums1[res1[1]+1..-1],nums2,k-1 ,[])
    result2 = iter(nums1,nums2[res2[2]+1..-1],k-1 ,[])
  end
end



nums1 = [3, 4, 6, 5]
nums2 = [9, 1, 2, 5, 8, 3]
k = 5
pp max_number(nums1,nums2,k)

nums1 = [6, 9]
nums2 = [6, 9, 3]
k = 4
pp max_number(nums1,nums2,k)



