import crypto from 'crypto';

const cloudName = 'r9f9o3jm';
const apiKey = '429861346112812';
const apiSecret = '12Iqz9E6KivJxavoMraiu7JXgxQ';
const timestamp = Math.round(Date.now() / 1000);

const signatureParams = `folder=mphm&timestamp=${timestamp}${apiSecret}`;
const signature = crypto.createHash('sha1').update(signatureParams).digest('hex');

// Test upload
const formData = new FormData();
// We'll upload a tiny base64 transparent pixel
const pixel = Buffer.from('iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAQAAAC1HAwCAAAAC0lEQVR42mNkYAAAAAYAAjCB0C8AAAAASUVORK5CYII=', 'base64');
const blob = new Blob([pixel], { type: 'image/png' });

formData.append('file', blob, 'test.png');
formData.append('api_key', apiKey);
formData.append('timestamp', timestamp.toString());
formData.append('signature', signature);
formData.append('folder', 'mphm');

fetch(`https://api.cloudinary.com/v1_1/${cloudName}/image/upload`, {
  method: 'POST',
  body: formData
}).then(res => res.json())
  .then(console.log)
  .catch(console.error);
