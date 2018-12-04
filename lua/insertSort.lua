---------
-- 插入排序
--直接插入排序基本思想是每一步将一个待排序的记录，插入到前面已经排好序的有序序列中去，直到插完所有元素为止。
--插入排序是一种最简单直观的排序算法，它的工作原理是通过构建有序序列，对于未排序数据，在已排序序列中从后向前扫描，找到相应位置并插入。
--算法步骤：
--1）将第一待排序序列第一个元素看做一个有序序列，把第二个元素到最后一个元素当成是未排序序列。
--2）从头到尾依次扫描未排序序列，将扫描到的每个元素插入有序序列的适当位置。（如果待插入的元素与有序序列中的某个元素相等，则将待插入元素插入到相等元素的后面。）
local function swap(a,s,e)
a[s]=a[s]+a[e]
a[e]=a[s]-a[e]
a[s]=a[s]-a[e]
end

local function main()

local a={1,5,2,3,8,0,2}
local s={}

for i in ipairs(a)do
	local j = i
	while(j>1 and a[j]<a[j-1])do
		swap(a,j,j-1)
		j = j-1
	end
end

for k in pairs(a)do
	print(k, a[k])
end

end
main()
