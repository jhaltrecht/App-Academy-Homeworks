function madLib(verb, adjective, noun){
   return console.log(`We shall ${verb} the ${adjective} ${noun}`);
}

// madLib('make', 'best', 'guac');

function isSubstring(searchString, subString){
    return searchString.includes(subString);
}

console.log(isSubstring("time to program", "time"));
console.log(isSubstring("Jump for joy", "joys"));
