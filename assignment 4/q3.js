const crypto = require('crypto');

// Input string
const input = `Dev => Karan | Rs 100\nKaran => Darsh | Rs 10`;

// Function to generate SHA-256 hash
function sha256(input) {
    return crypto.createHash('sha256').update(input).digest('hex');
}

// Function to find a nonce that makes the hash start with '00000'
function findNonce() {
    let nonce = 0;
    let hash = '';

    // Keep trying different nonces until the hash starts with '00000'
    while (!hash.startsWith('00000')) {
        const inputWithNonce = input + nonce.toString();
        hash = sha256(inputWithNonce);
        nonce++;
    }

    console.log(`Found match: Nonce = ${nonce - 1}, Hash = ${hash}`);
    return nonce - 1;
}

// Call the function
findNonce();
