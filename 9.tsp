import itertools

def tsp_bruteforce(distance_matrix):
    num_cities = len(distance_matrix)
    cities = list(range(1, num_cities))
    min_distance = float('inf')
    best_route = None
    
    for perm in itertools.permutations(cities):
        current_distance = distance_matrix[0][perm[0]]
        for i in range(len(perm) - 1):
            current_distance += distance_matrix[perm[i]][perm[i + 1]]
        current_distance += distance_matrix[perm[-1]][0]
        
        if current_distance < min_distance:
            min_distance = current_distance
            best_route = perm
    
    return min_distance, [0] + list(best_route) + [0]

if __name__ == "__main__":
    distance_matrix = [
        [0, 10, 15, 20],
        [10, 0, 35, 25],
        [15, 35, 0, 30],
        [20, 25, 30, 0]
    ]
    
    min_distance, best_route = tsp_bruteforce(distance_matrix)
    
    print(f"The shortest distance is: {min_distance}")
    print(f"The best route is: {best_route}")
