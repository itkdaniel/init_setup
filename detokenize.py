from cryptography.fernet import Fernet as fern
token = {'tokencode': b'gAAAAABkyxXFv9BDrOHFIbWydIsquUxNpflK'                      b'wNdyeXp2ftB5qRmaQjaKWWiDgaMun8X744V0X5'                      b'GiveYjKUXAy9udrF6-E0X1D_xYHO9aUUfss_zmhU'                      b'6cVn3mENc9DGHWnM6MFmL7zQBC',  'key': b'bAGn-MCoI98uIsdf9HG5nRGybdHORnzrrSTK7pCGdO4=',  'encoding': 'utf-8'} 
f = fern(token.get('key'))
detoken = f.decrypt(token.get('tokencode')).decode(token.get('encoding'))
print('[1;35m detokenized token:[4m[1;34m ', detoken, '[0m') 
