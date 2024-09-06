// Import crypto module (for node.js) or use the browser's window.crypto.subtle

const crypto = require('crypto');

// Function to generate SHA-256 hash
function sha256(input) {
    return crypto.createHash('sha256').update(input).digest('hex');
}

// Function to find a string that hashes to something starting with '00000'
function findMatchingHash() {
    let input = 0;
    let hash = '';

    // Keep trying different inputs until the hash starts with '00000'
    while (!hash.startsWith('00000')) {
        input++;
        hash = sha256(input.toString());
    }

    console.log(`Found match: Input = ${input}, Hash = ${hash}`);
    return input;
}

// Call the function
findMatchingHash();
