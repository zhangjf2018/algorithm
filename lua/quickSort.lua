-------
-- 快速排序
--
--
--

local function swap(a, s, e)
if s==e then
	return
end
a[s]=a[s]+a[e]
a[e]=a[s]-a[e]
a[s]=a[s]-a[e]
end

local function partition(a, left, right)

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

local function quickSort(a, left, right)
	if left >= right then
        return
    end
	local index = partition(a, left, right)
	quickSort( a, left, index-1 )
    quickSort( a, index+1, right )
end

local function main()

local s = {1,23,19,77,20,16,14,16,2,8}
quickSort(s, 1, 10)

--local s = {9,8,10,4,7,2,5}
--quickSort(s, 1, 7)

for k in pairs(s)do

print(k,s[k])
end

end


main()



