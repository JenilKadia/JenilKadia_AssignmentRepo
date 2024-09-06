const crypto = require('crypto');

// Function to generate SHA-256 hash
function sha256(input) {
    return crypto.createHash('sha256').update(input).digest('hex');
}

// Function to find a string that hashes to something starting with '00000'
function findMatchingHash() {
    let suffix = 0;
    let hash = '';
    const prefix = 'harsh21'; // The input string should start with this

    // Keep trying different inputs by appending suffix until the hash starts with '00000'
    while (!hash.startsWith('00000')) {
        const input = prefix + suffix.toString();
        hash = sha256(input);
        suffix++;
    }

    console.log(`Found match: Input = ${prefix + (suffix - 1)}, Hash = ${hash}`);
    return prefix + (suffix - 1);
}

// Call the function
findMatchingHash();
