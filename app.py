data = """1. <APZEEOXYGKVZ69728, Audi, Focus, Passenger Van>, <Маргарита Селиверстова, SB655868>, <C 916 KA 82>, <18.06.2019>

2. <FD8PCGIMRGIE30041, Hyundai, ATS, Wagon>, <Анжела Голубева, KG046930>, <X 285 TM 84>, <04.08.2022>

"""
results = []
for line in data.strip().split('\n\n'):
    parts = [part[part.find('<')+1:-1] for part in line.split('>, <')]
    flat_list = [item.strip() for sublist in parts for item in sublist.split(',')]
    name_index = 4  
    name, surname = flat_list[name_index].split(' ')
    flat_list[name_index:name_index+1] = [name, surname]  
    results.append(tuple(flat_list))

for result in results:
    print(f'{result},')