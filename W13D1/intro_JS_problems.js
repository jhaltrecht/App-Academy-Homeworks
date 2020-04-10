function madLib(verb, adjective, noun){
   return console.log(`We shall ${verb} the ${adjective} ${noun}`);
}

// madLib('make', 'best', 'guac');

function isSubstring(searchString, subString){
    return searchString.includes(subString);
}

// console.log(isSubstring("time to program", "time"));
// console.log(isSubstring("Jump for joy", "joys"));

function fizzBuzz(array) {
    newArray=[];
    array.forEach((element)=> {
        if (element%3===0 || element%5===0)
        newArray.push(element);
    })
    return newArray
}

array=[3,2,15,5,7]
console.log(fizzBuzz(array))