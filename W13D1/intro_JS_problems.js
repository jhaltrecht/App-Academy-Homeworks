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

// console.log(sumOfNPrimes(0))
// console.log(sumOfNPrimes(1))

// console.log(sumOfNPrimes(4))

function printCallback(names) {
    names.forEach(name=>console.log(name));
}

function titleize(names,printCallback) {
    let newNames = names.map((name) => `Mx. ${name} Jingleheimer Schmidt`);
  printCallback(newNames);
}

// console.log(titleize(["Mary", "Brian", "Leo"], printCallback));

function Elephant(name,height,tricks){
    this.name=name;
    this.height=height;
    this.tricks=tricks;
}
let dumbo = new Elephant('Dumbo', 156, ['bouncing a ball']);

Elephant.prototype.trumpet =  function () { console.log(`${this.name} the elephant goes 'phrRRRRRRRRRRR!!!!!!!'`)};
// dumbo.trumpet()

Elephant.prototype.grow = function () { this.height+=12};
// console.log(dumbo.height)
dumbo.grow()
// console.log(dumbo.height)
Elephant.prototype.addTrick = function(new_trick) { this.tricks.push(new_trick) }
dumbo.addTrick("laying down")
// console.log(dumbo.tricks)
Elephant.prototype.play=function(){
    let random_index=Math.floor(Math.random() * (this.tricks.length)) 
    console.log(this.tricks[random_index])
}
// dumbo.play()
let ellie = new Elephant("Ellie", 185, ["giving human friends a ride", "playing hide and seek"]);
let charlie = new Elephant("Charlie", 200, ["painting pictures", "spraying water for a slip and slide"]);
let kate = new Elephant("Kate", 234, ["writing letters", "stealing peanuts"]);
let micah = new Elephant("Micah", 143, ["trotting", "playing tic tac toe", "doing elephant ballet"]);

let herd = [ellie, charlie, kate, micah];
Elephant.paradeHelper=function (elephant) {
    console.log(`${elephant.name} is trotting by!`)
}
// herd.forEach(Elephant.paradeHelper);

