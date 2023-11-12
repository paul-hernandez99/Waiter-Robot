import re
import glob

def parse_planner_output_from_file(file_path):
    with open(file_path, 'r') as file:
        output = file.read()

    # Extracting Total time
    total_time_match = re.search(r'Total time: ([\d.]+)', output)
    total_time = float(total_time_match.group(1)) if total_time_match else None

    # Extracting Cost
    cost_match = re.search(r'Plan found with cost: (\d+)', output)
    cost = int(cost_match.group(1)) if cost_match else None

    # Extracting Nodes generated during search
    nodes_generated_match = re.search(r'Nodes generated during search: (\d+)', output)
    nodes_generated = int(nodes_generated_match.group(1)) if nodes_generated_match else None

    # Extracting Nodes expanded during search
    nodes_expanded_match = re.search(r'Nodes expanded during search: (\d+)', output)
    nodes_expanded = int(nodes_expanded_match.group(1)) if nodes_expanded_match else None

    return total_time, cost, nodes_generated, nodes_expanded


for i in range(4):
    file_pattern = f"Imp*/Plans/*{i}.txt"
    file_paths = glob.glob(file_pattern)
    values = []

    for file_path in file_paths:
        values.append(parse_planner_output_from_file(file_path))

    print(f"""
        \\textbf{{Total time}} & {values[0][0]} & {values[1][0]} & {values[2][0]} \\\\\\hline
        \\textbf{{Cost}} & {values[0][1]} & {values[1][1]} & {values[2][1]} \\\\\\hline
        \\textbf{{Nodes generated}} & {values[0][2]} & {values[1][2]} & {values[2][2]} \\\\\\hline
        \\textbf{{Nodes expanded}} & {values[0][3]} & {values[1][3]} & {values[2][3]} \\\\\\hline
""")