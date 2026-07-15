import crypto from 'crypto';

const cloudName = 'r9f9o3jm';
const apiKey = '429861346112812';
const apiSecret = '12Iqz9E6KivJxavoMraiu7JXgxQ';
const timestamp = Math.round(Date.now() / 1000);

const signatureParams = `folder=mphm&timestamp=${timestamp}${apiSecret}`;
const signature = crypto.createHash('sha1').update(signatureParams).digest('hex');

console.log({
  signature,
  timestamp,
  apiKey,
  cloudName,
  folder: "mphm"
});
