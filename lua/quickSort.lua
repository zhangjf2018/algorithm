-------
-- 快速排序
-- 
-- 左右指针法、挖坑法
--

local function swap(a, s, e)
if s==e then
	return
end
a[s]=a[s]+a[e]
a[e]=a[s]-a[e]
a[s]=a[s]-a[e]
end

-- 左右指针法
-- 1．将数组的最后一个数right作为基准数key。 
-- 2．分区过程:从数组的首元素begin开始向后找比key大的数（begin找大）；end开始向前找比key小的数（end找小）；找到后然后两者交换（swap）,知道begin >= end终止遍历。最后将begin和最后一个数交换（ 这个时候end不是最后一个位置），即 key作为中间数（左区间都是比key小的数，右区间都是比key大的数） 
-- 3．再对左右区间重复第二步，直到各区间只有一个数
local function leftRightPoint(a, left, right)

	local pivot = a[right]
	local pivot_pos = right
    while( left < right ) do
		while( left<right and a[left] <= pivot ) do left = left + 1  end
		while( left<right and a[right] >= pivot ) do right = right - 1  end
		swap(a, left, right)
	end
	swap(a, left, pivot_pos)
	return left
end

-- 挖坑法
-- 定义两个指针left指向起始位置，right指向最后一个元素的位置,然后指定一个基数key（right）,作为坑
-- left寻找比基数（key）大的数字，找到后将left的数据赋给right，left成为一个坑，然后right寻找比基数（key）小的数字，找到将right的数据赋给left，right成为一个新坑，循环这个过程，直到begin指针与end指针相遇，然后将key返回给那个坑（最终：key的左边都是比key小的数，key的右边都是比key大的数），然后进行递归操作
local function digHole(a, left, right)
	local pivot = a[right]
	while( left < right )do
		while( left<right and a[left]<=pivot )do left = left + 1 end
		a[right] = a[left]
		while( left<right and a[right] >=pivot )do right = right - 1 end
		a[left] = a[right]
	end
	a[left]=pivot
	return left
end

-- 定义两个指针，一前一后，cur（前）指向起始位置，prev（后）指向cur的前一个位置；选择数组最后一个元素作为key（right）
-- 实现过程：cur找比key小的数，prev在cur没有找到的情况下，一直不动（即保证prev一直指向比key大的数）；直到cur找到比key小的数（+ +prev && prev != cur时）然后++cur,prev仍然不动。
-- 直到cur走到right前一个位置，终止循环。最后++prev，交换prev和right的值。返回中间位置prev。最后再继续递归。
local function curPreSort(a, left, right)
local cur = left
local pre = left - 1
local pivot = a[right]

while( cur < right )do
	if a[cur] < pivot then
		pre = pre + 1
		if pre ~= cur then
			swap(a, cur, pre)
		end
	end
	cur = cur + 1
end
pre=pre+1
swap(a, pre, right)
return pre
end

local function quickSort(a, left, right)
	if left >= right then
        return
    end
	--local index = leftRightPoint(a, left, right)
	--local index = digHole(a, left, right)
	local index = curPreSort(a, left, right)
	quickSort( a, left, index-1 )
    quickSort( a, index+1, right )
end

local function main()

local s = {1,23,19,20,16,2000,14,1000,16,2,8}
quickSort(s, 1, #s)

--local s = {9,8,10,4,7,2,5}
--quickSort(s, 1, 7)

for k in pairs(s)do

print(k,s[k])
end

end

main()



