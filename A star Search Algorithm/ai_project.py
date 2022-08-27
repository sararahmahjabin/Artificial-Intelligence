

import pandas as pds
pds.set_option('mode.chained_assignment', None)
dframe = pds.read_csv('/content/drive/MyDrive/AI_Project/Project_AI.csv')
dframe

header = input('Give Start State : ')
goal = input('Give Goal State : ')

header,goal

dframe.columns = ['Parent', 'Child', 'g(n)', 'h(n)']
dframe

dframe['g(n)'] = dframe['g(n)'].astype('int32') 
dframe['h(n)'] = dframe['h(n)'].astype('int32') 
path = [header]
sdframe = dframe.copy()

path_cost = 0
while True:
    if header==goal:
        break
    sdata = sdframe[sdframe.Parent==header]
    sdata['cost']=sdata[['g(n)','h(n)']].sum(axis=1)
    
    sdata=sdata.sort_values(by='cost',ascending=True).reset_index(drop=True)
    print(sdata)
    header = sdata.loc[0].Child
    path_cost+=sdata.loc[0]['g(n)']#.value
    path.append(header)

print('Shortest path ',path)

print(path_cost)