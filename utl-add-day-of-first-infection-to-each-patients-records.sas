Add day of first infection to each patients records                                                                 
                                                                                                                    
I have a data set with the variables: participant ID (ID), day, and event (infect).                                 
I would like to create a variable (first_infect_day) that signifies when the first infection occurred               
for each participant.                                                                                               
                                                                                                                    
   Three solutions                                                                                                  
                                                                                                                    
       a. SQL                                                                                                       
          ChrisNZ                                                                                                   
          https://communities.sas.com/t5/user/viewprofilepage/user-id/16961                                         
                                                                                                                    
       b. self merge                                                                                                
          mkeintz                                                                                                   
          https://communities.sas.com/t5/user/viewprofilepage/user-id/31461                                         
                                                                                                                    
       c. DOW                                                                                                       
                                                                                                                    
github                                                                                                              
https://tinyurl.com/y4x7ucrx                                                                                        
https://github.com/rogerjdeangelis/utl-add-day-of-first-infection-to-each-patients-records                          
                                                                                                                    
SAS Forum                                                                                                           
https://tinyurl.com/y3al3jpv                                                                                        
https://communities.sas.com/t5/SAS-Programming/Time-to-first-event-by-group-variable/m-p/674571                     
                                                                                                                    
/*                   _                                                                                              
(_)_ __  _ __  _   _| |_                                                                                            
| | `_ \| `_ \| | | | __|                                                                                           
| | | | | |_) | |_| | |_                                                                                            
|_|_| |_| .__/ \__,_|\__|                                                                                           
        |_|                                                                                                         
*/                                                                                                                  
                                                                                                                    
                                                                                                                    
data have;                                                                                                          
  input ID day infect;                                                                                              
cards4;                                                                                                             
333 0 0                                                                                                             
333 1 0                                                                                                             
333 2 1                                                                                                             
333 3 0                                                                                                             
333 4 1                                                                                                             
333 5 0                                                                                                             
334 1 0                                                                                                             
334 2 0                                                                                                             
334 3 0                                                                                                             
334 4 0                                                                                                             
334 5 1                                                                                                             
338 1 0                                                                                                             
338 2 0                                                                                                             
338 3 0                                                                                                             
338 4 0                                                                                                             
338 5 0                                                                                                             
;;;;                                                                                                                
run;quit;                                                                                                           
                                                                                                                    
                                                                                                                    
WORK.HAVE total obs=16                                                                                              
                                                                                                                    
   ID    DAY    INFECT                                                                                              
                                                                                                                    
  333     0        0                                                                                                
  333     1        0                                                                                                
  333     2        1                                                                                                
  333     3        0                                                                                                
  333     4        1                                                                                                
  333     5        0                                                                                                
  334     1        0                                                                                                
  334     2        0                                                                                                
  334     3        0                                                                                                
  334     4        0                                                                                                
  334     5        1                                                                                                
  338     1        0                                                                                                
  338     2        0                                                                                                
  338     3        0                                                                                                
  338     4        0                                                                                                
  338     5        0                                                                                                
                                                                                                                    
/*          _                                                                                                       
 _ __ _   _| | ___  ___                                                                                             
| `__| | | | |/ _ \/ __|                                                                                            
| |  | |_| | |  __/\__ \                                                                                            
|_|   \__,_|_|\___||___/                                                                                            
                                                                                                                    
*/                                                                                                                  
                                                                                                                    
                                                                                                                    
WORK.HAVE total obs=16                                                                                              
                                                                                                                    
   ID    DAY    INFECT                                                                                              
                                                                                                                    
  333     0        0                                                                                                
  333     1        0                                                                                                
                                                                                                                    
  333     2        1   2 = first_infect_day                                                                         
                                                                                                                    
  333     3        0                                                                                                
  333     4        1                                                                                                
  333     5        0                                                                                                
                                                                                                                    
  334     1        0                                                                                                
  334     2        0                                                                                                
  334     3        0                                                                                                
  334     4        0                                                                                                
  334     5        1  5 = first_infect_day                                                                          
                                                                                                                    
  338     1        0                                                                                                
  338     2        0                                                                                                
  338     3        0                                                                                                
  338     4        0                                                                                                
  338     5        0  . = first_infect_day                                                                          
                                                                                                                    
                                                                                                                    
/*           _               _                                                                                      
  ___  _   _| |_ _ __  _   _| |_                                                                                    
 / _ \| | | | __| `_ \| | | | __|                                                                                   
| (_) | |_| | |_| |_) | |_| | |_                                                                                    
 \___/ \__,_|\__| .__/ \__,_|\__|                                                                                   
                |_|                                                                                                 
*/                                                                                                                  
                                                                                                                    
                                                                                                                    
WORK.WANT total obs=16                                                                                              
                                                                                                                    
                                FIRST_                                                                              
                               INFECT_                                                                              
Obs     ID    DAY    INFECT      DAY                                                                                
                                                                                                                    
  1    333     0        0         2                                                                                 
  2    333     1        0         2                                                                                 
  3    333     2        1         2  2 = first_infect_day                                                           
  4    333     3        0         2                                                                                 
  5    333     4        1         2                                                                                 
  6    333     5        0         2                                                                                 
                                                                                                                    
  7    334     1        0         5                                                                                 
  8    334     2        0         5                                                                                 
  9    334     3        0         5                                                                                 
 10    334     4        0         5                                                                                 
 11    334     5        1         5  5 = first_infect_day                                                           
                                                                                                                    
 12    338     1        0         .                                                                                 
 13    338     2        0         .                                                                                 
 14    338     3        0         .                                                                                 
 15    338     4        0         .                                                                                 
 16    338     5        0         .                                                                                 
                                                                                                                    
/*                                                                                                                  
 _ __  _ __ ___   ___ ___  ___ ___                                                                                  
| `_ \| `__/ _ \ / __/ _ \/ __/ __|                                                                                 
| |_) | | | (_) | (_|  __/\__ \__ \                                                                                 
| .__/|_|  \___/ \___\___||___/___/                                                                                 
|_|        _                                                                                                        
 ___  __ _| |                                                                                                       
/ __|/ _` | |                                                                                                       
\__ \ (_| | |                                                                                                       
|___/\__, |_|                                                                                                       
        |_|                                                                                                         
*/                                                                                                                  
                                                                                                                    
                                                                                                                    
ChrisNZ                                                                                                             
https://communities.sas.com/t5/user/viewprofilepage/user-id/16961                                                   
                                                                                                                    
proc sql;                                                                                                           
 create                                                                                                             
     table WANT_sql as                                                                                              
 select                                                                                                             
     ID                                                                                                             
    ,DAY                                                                                                            
    ,INFect                                                                                                         
    ,min(DAY*ifn(infect, 1, .)) as first_infect_day                                                                 
 from                                                                                                               
     HAVE                                                                                                           
 group                                                                                                              
     by ID                                                                                                          
 order                                                                                                              
     by ID, DAY                                                                                                     
;quit;                                                                                                              
                                                                                                                    
/*                                                                                                                  
 _ __ ___   ___ _ __ __ _  ___                                                                                      
| `_ ` _ \ / _ \ `__/ _` |/ _ \                                                                                     
| | | | | |  __/ | | (_| |  __/                                                                                     
|_| |_| |_|\___|_|  \__, |\___|                                                                                     
                    |___/                                                                                           
*/                                                                                                                  
                                                                                                                    
mkeintz                                                                                                             
https://communities.sas.com/t5/user/viewprofilepage/user-id/31461                                                   
                                                                                                                    
data want_merge;                                                                                                    
  set have (where=(infect=1) in=in1)                                                                                
      have (in=in2);                                                                                                
  by id;                                                                                                            
  retain first_infect_day;                                                                                          
  if first.id then first_infect_day=.;                                                                              
  if in1=1 and first_infect_day=. then first_infect_day=day;                                                        
  if in2;                                                                                                           
run;                                                                                                                
                                                                                                                    
/*   _                                                                                                              
  __| | _____      __                                                                                               
 / _` |/ _ \ \ /\ / /                                                                                               
| (_| | (_) \ V  V /                                                                                                
 \__,_|\___/ \_/\_/                                                                                                 
                                                                                                                    
*/                                                                                                                  
* may be the fastest if id are widly spaced                                                                         
  due to cacheing of the data in the first loop;                                                                    
                                                                                                                    
data want_dow;                                                                                                      
  do until (last.id);                                                                                               
     set have;                                                                                                      
     by id;                                                                                                         
     if infect=1 and been_there=. then do;                                                                          
        been_there=1;                                                                                               
        first_infect_day=day;                                                                                       
     end;                                                                                                           
  end;                                                                                                              
  do until (last.id);                                                                                               
     set have;                                                                                                      
     by id;                                                                                                         
     output;                                                                                                        
  end;                                                                                                              
  drop been_there;                                                                                                  
run;quit;                                                                                                           
                                                                                                                    
