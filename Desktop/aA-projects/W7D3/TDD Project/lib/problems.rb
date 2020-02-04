def my_uniq(arr)
    newArr=[]
    alreadySeen=[]
    arr.each do |el,idx|
        if !alreadySeen.include?(el)
            newArr<<el
            alreadySeen<<el
        end
    end
    newArr
end

p my_uniq([1,2,3,4,5,1,2,3])