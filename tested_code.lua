local code = {}

function sort(a)
	local temp = {}	
	for i=1,#a do
		temp[i] = a[i]
	end
    for i=1,#temp do
        local j = i
        while j > 1 and temp[j-1] > temp[j] do
            temp[j],temp[j-1] = temp[j-1],temp[j]
            j = j - 1
        end
    end
	return temp;
end

function code.sort(a)
    return (sort(a))
end

function is_hello(text)
	return text == 'hello'
end

function code.is_hello(text)
	return (is_hello(text))
end

function wrap_int(int, min_i, max_i, add_i)
	if not add_i then add_i = 0 end
	local new_i = int+add_i
	if new_i < min_i then return max_i end  
	if new_i > max_i then return min_i end
	return new_i
end

function code.wrap_int(int, min_i, max_i, add_i)
    return wrap_int(int, min_i, max_i, add_i)
end

return code