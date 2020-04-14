const readline = require('readline');

const reader = readline.createInterface({
    input: process.stdin,
    output: process.stdout
});

// reader.question('Would you like some tea?',function(response){
//     console.log(`You replied ${response}.`)
// })


// fix the broken function below: 
function teaAndBiscuits() {

    reader.question('Would you like some tea?', function (res) {
        console.log(`You replied ${res}.`);
        reader.question('Would you like some biscuits?', function (res2) {
            console.log(`You replied ${res2}.`);

            const first = (res === 'yes') ? 'do' : 'don\'t';
            const second = (res2 === 'yes') ? 'do' : 'don\'t';

            console.log(`So you ${first} want tea and you ${second} want biscuits.`);
            reader.close();
        });
    });

    
    // reader.question('Would you like some tea?', function(res) {
    //     console.log(`You replied ${res}.`);
    //     reader.question('Would you like some biscuits?', function (res2) {
    //         console.log(`You replied ${res2}.`);

    //         const firstRes = (res === 'yes') ? 'do' : 'don\'t';
    //         const secondRes = (res2 === 'yes') ? 'do' : 'don\'t';
    //         console.log(`So you ${firstRes} want tea and you ${secondRes} want biscuits.`);
    //         reader.close();
    //     });
    // });



}