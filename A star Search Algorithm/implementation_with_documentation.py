

import pandas as pds    # import pandas functionality
pds.set_option('mode.chained_assignment', None)
dframe = pds.read_csv('/content/drive/MyDrive/AI_Project/Project_AI.csv') # link of .csv file from my drive
dframe

header = input('Give Start State : ') # Input Startnode as header.
goal = input('Give Goal State : ')    # Input Startnode as goal.

header,goal

dframe.columns = ['Parent', 'Child', 'g(n)', 'h(n)'] # Declare parent,child,g(n),h(n) as columns
dframe

dframe['g(n)'] = dframe['g(n)'].astype('int32') # Assiging g(n) value as Integar Type.
dframe['h(n)'] = dframe['h(n)'].astype('int32') # Assiging h(n) value as Integar Type.
path = [header]  # Taking header as an array.

path_cost = 0    #Initially path cost 0
while True:
    if header==goal: # Finding for header is equal to goal or not
        break
    sdata= dframe[dframe.Parent==header]  # search the header from parent column and store 
    sdata['cost']=sdata[['g(n)','h(n)']].sum(axis=1) # Store the summetion of g(n) and h(n)
    
    sdata=sdata.sort_values(by='cost',ascending=True).reset_index(drop=True) # Sort cost according to ascending order
    print(sdata) # print sdata
    header = sdata.loc[0].Child   # Header's Child is next header
    path_cost+=sdata.loc[0]['g(n)'] # sum of all path cost
    path.append(header)  # store child with header

print('Shortest path ',path) # Print Shortest path

print(str(path_cost) + ' TK' ) # Print Total path cost