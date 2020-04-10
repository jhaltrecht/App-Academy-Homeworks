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

// array=[3,2,15,5,7]
// console.log(fizzBuzz(array))

function isPrime(num) {
    for(i=2; i<num; i++) {
         if (num%i===0) {
             return false;
         }
    }
    return true;
}

// console.log(isPrime(2))
// console.log(isPrime(10))
// console.log(isPrime(15485863))
// console.log(isPrime(3548563))

function sumOfNPrimes(num) {
    let sum=0;
    firstNPrimes(num).forEach(element => {
       sum+=element ;
    });
    return sum;
}

function firstNPrimes(num) {
    var count=0;
    var i=2;
    primeArr=[];
    while (count<num) {
        if (isPrime(i)) {
        primeArr.push(i)
        count+=1
        }
        ++i;
    }
        return primeArr;
}

// console.log(firstNPrimes(4))

console.log(sumOfNPrimes(0))
console.log(sumOfNPrimes(1))
console.log(sumOfNPrimes(4))