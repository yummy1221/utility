#!/opt/bb/bin/python3                                                              
                                                                                   
import sys                                                                         
import random                                                                      
from getpass import getuser                                                        
import csv                                                                         
                                                                                   
def initLunchList():                                                               
    filename = '/home/xli548/scripts/lunchlist'                                    
    rst = []                                                                       
    k = 'restaurant'                                                               
    v = 'weight'                                                                   
                                                                                   
    with open(filename) as csvfile:                                                
        reader = csv.DictReader(csvfile)                                           
        for row in reader:                                                         
            rst.extend([row[k]] * int(row[v]))                                     
                                                                                   
    return rst                                                                     
                                                                                   
def main(argv):                                                                    
    uid = getuser()                                                                
    choices = initLunchList()                                                      
                                                                                   
    if uid == 'yzhou291':                                                                                                                                      
        choices.extend(['sb fengfeng don\'t need lunch'] * 2000)                   
    elif uid == 'ylu274':                                                          
        choices.extend(['omar, omar, always ur favorite omar~mmd~'] * 20)          
                                                                                   
    random.shuffle(choices)                                                        
    print(random.choice(choices))                                                  
                                                                                   
                                                                                   
if __name__ == '__main__':                                                         
    sys.exit(main(sys.argv))      
