-------
-- 简单选择排序
-- 在要排序的一组数中，选出最小（或者最大）的一个数与第1个位置的数交换；然后在剩下的数当中再找最小（或者最大）的与第2个位置的数交换，依次类推，直到第n-1个元素（倒数第二个数）和第n个元素（最后一个数）比较为止。
--
--(1)从待排序序列中，找到关键字最小的元素；
--(2)如果最小元素不是待排序序列的第一个元素，将其和第一个元素互换；
--(3)从余下的 N - 1 个元素中，找出关键字最小的元素，重复(1)、(2)步，直到排序结束。
-- 简单排序的时间复杂度为 O(N2)。
--

local function swap(a, s, e)
a[s]=a[s]+a[e]
a[e]=a[s]-a[e]
a[s]=a[s]-a[e]
end

-- a 数组 
-- n 数组长度
-- p 当前位置
local function selectMin(a, n, p)
local mp = p
for i=p,n do
	if a[mp] > a[i] then
		mp = i
	end
end
return mp
end

local function main()

local s = {1,219,9,10,3,8,9}

for i in ipairs(s) do
	local mp = selectMin(s,#s,i)
	if i ~= mp then
		swap(s, i, mp)
	end
end

for k in pairs(s) do
	print(k, s[k])
end

end

main()
