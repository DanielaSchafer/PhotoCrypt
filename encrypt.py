from Crypto.Cipher import AES
from Crypto import Random
import hashlib
import re
import argparse

parser = argparse.ArgumentParser(description="")
parser.add_argument('-p', '--password', type=str, required=True)
parser.add_argument('-t','--text',type=str, required=True)
parser.add_argument('-f','--path',type=str, required=True)
args = parser.parse_args()

p = re.compile("\\\\")

password = b'hello'
text = b'wow'

def setup(password, text):
    key = hashlib.sha256(password).digest()

    iv = Random.new().read(AES.block_size)
    encryptor = AES.new(key, AES.MODE_CFB, iv)
    msg = encryptor.encrypt(text)
    print(msg)
    print(iv)

    decryptor = AES.new(key, AES.MODE_CFB, iv)
    plain = decryptor.decrypt(msg)

    return msg,iv


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
#    iv_array = str(iv).split("'")[1].split("\\")
#    msg_array = str(msg).split("'")[1].split("\\")

    iv_array = re.split(p,str(iv).split("'")[1])
    msg_array = re.split(p,str(msg).split("'")[1])
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
        for counter, j in enumerate(i):
            pixel_list.append((int((j/128)*255)))
        pixel_list.append(0)
    return (pixel_list)

def write_ascii_file(arr, file_name):
    pixel_arr = get_pixel_arr(get_ascii_arr(arr))
    print(pixel_arr)
    pixels = split_into_pixels(pixel_arr)
    print(pixels)
    with open(file_name, "w+") as new_file:
        for p in pixels:
            new_file.write("%s\n" % p)

def split_into_pixels(pixel_vals):
    while(len(pixel_vals)%3 != 0):
        pixel_vals.append(0)

    pixel_count = len(pixel_vals)/3

    pixels = []
    for i in range(int(pixel_count)):
        pixels.append(list())
    
    index = 0 

    for counter, p in enumerate(pixel_vals):
        print(index)
        if counter%3 == 0 and index<pixel_count-1 and counter != 0:
           index = index+1
           pixels[index] = list()
           pixels[index].append(str(p))
        else:
            pixels[index].append(str(p))
    print(pixels)
    return pixels
        



def write_files(msg,iv,path):
    setup(password,text)
    iv_arr, msg_arr = split_into_arr(iv,msg)
    write_ascii_file(iv_arr,"iv.csv")
    write_ascii_file(msg_arr,"msg.csv")

msg, iv = setup(args.password.encode('utf-8'), args.text)
write_files(msg,iv,args.path)






