---------
-- 插入排序
--
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
