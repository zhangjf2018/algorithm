-------
-- 希尔排序
-- 希尔排序是希尔（Donald Shell）于1959年提出的一种排序算法。希尔排序也是一种插入排序，它是简单插入排序经过改进之后的一个更高效的版本，也称为缩小增量排序。
-- 希尔排序的基本步骤，在此我们选择增量gap=length/2，缩小增量继续以gap = gap/2的方式，这种增量选择我们可以用一个序列来表示，{n/2,(n/2)/2...1}，称为增量序列。希尔排序的增量序列的选择与证明是个数学难题，我们选择的这个增量序列是比较常用的，也是希尔建议的增量，称为希尔增量，但其实这个增量序列不是最优的。
-- 希尔排序中对于增量序列的选择十分重要，直接影响到希尔排序的性能。我们上面选择的增量序列{n/2,(n/2)/2...1}(希尔增量)，其最坏时间复杂度依然为O(n2)，一些经过优化的增量序列如Hibbard经过复杂证明可使得最坏时间复杂度为O(n3/2)。
--

local function swap(a, s, e)

a[s]=a[s]+a[e]
a[e]=a[s]-a[e]
a[s]=a[s]-a[e]
end

local function main()
local s = {1,2,109,2,374,12,19,15,8,6,7}

local len = #s
local gap = len/2
gap=math.floor(gap)
while( gap >= 1 )
do

for i=gap,len do
	local j = i
	while(j-gap>0 and s[j]<s[j-gap])do
		swap(s,j,j-gap)
		j = j - gap
	end
end
gap = gap/2 -- 带小数点
gap=math.floor(gap) -- 向下取整数
end

for k in pairs(s)do
print(k,s[k])
end

end

main()



