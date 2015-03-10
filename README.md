# Enigma

By Tom Leskin

Enigma is an encryption engine for encrypting, decrypting, and cracking messages. It does encryption based on rotation and has a character map made up of all the lowercase letters a to z, then the numbers 0 to 9, then space, period and comma. New lines will not appear in the message nor character map.

To encrypt, decrypt and crack messages, Enigma uses a key which is made up of 5 random digits. From there, five rotations are calculated, the first two digits make up the "A" rotation, the second and third digits are the "B" rotation, the third and fourth digits are the "C" rotation and the fourth and fifth digits are the "D" rotation.

Also considered in the encryption is the date of message transmission, which makes up the offset. The offsets are taken from the date in DDMMYY format, which is then squared, and of the last four digits, the first is the "A" offset, the second is the "B" offset, the third is the "C" offset and the fourth is the "D" offset.

For the encryption, decryption and cracking, four letters are rotated at a time, either backwards or forwards depending upon the method being used.

To encrypt, run the encrypt.rb file along with two command line arguments, the text file holding the message and the text file to hold the encrypted message.

[Imgur](http://i.imgur.com/e2perOK.png)

To to decrypt, run the decrypt.rb file along with four command line arguments, including the text file holding the encrypted, the text file to hold the decrypted message, the key and the date used.

[Imgur](http://i.imgur.com/Mpt68TI.png)
