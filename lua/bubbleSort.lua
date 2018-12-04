-------
-- 冒泡排序
-- 冒泡排序的基本思想是，对相邻的元素进行两两比较，顺序相反则进行交换，这样，每一趟会将最小或最大的元素“浮”到顶端，最终达到完全有序
--
-- 在冒泡排序的过程中，如果某一趟执行完毕，没有做任何一次交换操作，比如数组[5,4,1,2,3]，执行了两次冒泡，也就是两次外循环之后，分别将5和4调整到最终位置[1,2,3,4,5]。此时，再执行第三次循环后，一次交换都没有做，这就说明剩下的序列已经是有序的，排序操作也就可以完成了
--根据上面这种冒泡实现，若原数组本身就是有序的（这是最好情况），仅需n-1次比较就可完成；若是倒序，比较次数为 n-1+n-2+...+1=n(n-1)/2，交换次数和比较次数等值。所以，其时间复杂度依然为O(n2)。
--

local function swap(a, s, e)
a[s]=a[s]+a[e]
a[e]=a[s]-a[e]
a[s]=a[s]-a[e]
end


local function main()

local s={1,4,9,8,21,23,4,8,7}

for i in ipairs(s) do
	local swapFlag = false
	for j=1,#s-i do
		if(s[j]>s[j+1])then
			swap(s,j,j+1)
			swapFlag = true
		end
	end

	if not swapFlag then
		break
	end
end

for k in pairs(s) do
	print(k, s[k])
end
end

main()

