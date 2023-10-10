/* Calculating Factorial */

const factorial = num => {
    let result = 1;
    for (let i=0; i<num; i++) result *= (i+1);

    return result;
};


const permutation = (n, r) => factorial (n) / factorial(n-r);
const combination = (n, r) => permutation(n, r) / factorial(r);
const multiPermutation = (n, r) => n ** r;
const multiCombination = (n, r) => combination(n+r-1, r);

module.exports= {
    combination,
    permutation,
    multiCombination,
    multiPermutation
};

const n = 8;
const r = 3;

console.log(`n = ${n}, r = ${r}`)
console.log(`Permutation: ${permutation(n, r)}`);
console.log(`Combination: ${combination(n, r)}`);
console.log(`Multi Permutation: ${multiPermutation(n, r)}`);
console.log(`Multi Combination: ${multiCombination(n, r)}`);