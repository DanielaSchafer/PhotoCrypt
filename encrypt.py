from Crypto.Cipher import AES
from Crypto import Random
import hashlib
import re

p = re.compile("\\\\")

password = b'hello'
key = hashlib.sha256(password).digest()
pass2 = Random.new() 
print(key)

iv = Random.new().read(AES.block_size)
encryptor = AES.new(key, AES.MODE_CFB, iv)
text = b'wow'
msg = encryptor.encrypt(text)
print(msg)

decryptor = AES.new(key, AES.MODE_CFB, iv)
plain = decryptor.decrypt(msg)
print(plain)
print(iv)


def remove_first_element(arr):
    new_arr = list()
    is_first = True
    for counter, i in enumerate(arr):
        if(is_first == False):
            new_arr.append(i)
        elif(len(arr[counter+1]) != 0):
            is_first = False


    return new_arr

#def build_iv():
#    new_str = "b\'"
#    for i in arr:



def convert_to_ascii(arr):
    ascii_arr = list()
    for i in arr:
        ascii_arr.append(ord(i))
        
    return ascii_arr

def split_into_arr(iv, msg):
    iv_array = str(iv).split("'")[1].split("\\")
    msg_array = str(msg).split("'")[1].split("\\")

    iv_array = re.split(str(iv).split("'")[1])
    msg_array = remove_first_element(msg_array)
    iv_array = remove_first_element(iv_array)
    print(msg_array)
    print(iv_array)
    return iv_array, msg_array

def make2dList(rows, cols):
    a=[]
    for row in xrange(rows): 
        a += [[0]*cols]
    return a

def get_ascii_arr(arr):
    for counter, i in enumerate(arr):
        arr[counter]=convert_to_ascii(i)
    print(arr)
    return(arr)

def get_pixel_arr(arr):
    pixel_list = list()
    for i in arr:
        for j in arr:
            pixel_list.append((j/128)*255)
        pixel_list.append(0)




def write_ascii_file(arr, file_name):
    with open(file_path, "w+") as new_file:
        new_file.writelines(arr)
        


iv_arr, msg_arr = split_into_arr(iv,msg)
get_ascii_arr(iv_arr)





