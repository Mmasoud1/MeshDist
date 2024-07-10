import numpy as np
from ancillary import list_recursive

def calculate_average(arrays_list):
    n = len(arrays_list)
    
    if n == 0:
        return None  # Handle the case of an empty list
    
    sum_arrays = [np.zeros_like(arr) for arr in arrays_list[0]]  # Initialize sum list
    
    for arrays in arrays_list:
        for i, arr in enumerate(arrays):
            sum_arrays[i] += arr
    
    average_arrays = [sum_arr / n for sum_arr in sum_arrays]
    
    return average_arrays


def aggr_gradients(args):
        input_list = args["input"]

        iterations = min([input_list[site]["iterations"] for site in input_list])
        current_iteration = min([input_list[site]["current_iteration"] for site in input_list])

        gradients = []
        for site in input_list:
            local_grad = [np.array(array) for array in input_list[site]["gradients"]]
            gradients.append(local_grad)
        
        aggregated_grad =  calculate_average(gradients)
        aggregated_grad = [array.tolist() for array in aggregated_grad]

        if current_iteration<iterations:
            computation_output = {"output": {"gradients":aggregated_grad,"computation_phase": 'remote',"last_iteration":False}}
        else:
            computation_output = {"output": {"gradients":aggregated_grad,"computation_phase": 'remote',"last_iteration":True}}
        return computation_output

def end_remote(args):
    computation_output = {"output": {"training_completed":True,"computation_phase": "remote"},"success":True}
    return computation_output


def start(PARAM_DICT):
    PHASE_KEY = list(list_recursive(PARAM_DICT, "computation_phase"))

    if "local" in PHASE_KEY:
        return aggr_gradients(PARAM_DICT)
    elif "end" in PHASE_KEY:
        return end_remote(PARAM_DICT)
    else:
        raise ValueError("Error occurred at Remote")
