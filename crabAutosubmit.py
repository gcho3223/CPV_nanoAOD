import os
import argparse
import subprocess

def check_voms_proxy():
    """
    Check if a valid VOMS proxy exists.
    """
    try:
        result = subprocess.run(["voms-proxy-info", "--timeleft"], check=True, capture_output=True, text=True)
        time_left = int(result.stdout.strip())
        if time_left > 0:
            print(f"VOMS proxy is valid. Time left: {time_left} seconds.")
        else:
            print("Error: VOMS proxy has expired or is not valid.")
            exit(1)
    except subprocess.CalledProcessError:
        print("Error: No valid VOMS proxy found. Please run 'voms-proxy-init' to generate one.")
        exit(1)

def execute_crab_command(base_dir, command):
    """
    Navigate to each directory and execute the specified CRAB command.
    """
    if not os.path.exists(base_dir):
        print(f"Error: Directory {base_dir} does not exist!")
        return

    original_dir = os.getcwd()  # Save the original directory

    for root, dirs, files in os.walk(base_dir):
        if command == "submit" and "crab_config.py" in files:
            # Check if CRAB working directory already exists
            crab_dirs = [d for d in dirs if d.startswith("crab_")]
            if crab_dirs:
                print(f"CRAB working directory already exists in {root}. Skipping submission.")
                continue  # Skip to the next directory

            try:
                os.chdir(root)  # Change to the directory containing the crab_config.py file
                print(f"Executing 'crab submit' in directory: {root}")

                crab_command = ["crab", "submit", "-c", "crab_config.py"]
                result = subprocess.run(crab_command, check=True, capture_output=True, text=True)
                print(result.stdout)
                print(result.stderr)

            except subprocess.CalledProcessError as e:
                print(f"Error executing 'crab submit' in {root}: {e.stderr}")

            finally:
                os.chdir(original_dir)  # Return to the original directory

        elif command == "status":
            # Check for crab_"shortname" directory
            crab_dirs = [d for d in dirs if d.startswith("crab_")]
            for crab_dir in crab_dirs:
                crab_dir_path = os.path.join(root, crab_dir)
                print(f"Checking status for CRAB directory: {crab_dir_path}")

                crab_command = ["crab", "status", "-d", crab_dir_path]
                try:
                    result = subprocess.run(crab_command, check=True, capture_output=True, text=True)
                    print(result.stdout)
                    print(result.stderr)
                except subprocess.CalledProcessError as e:
                    print(f"Error executing 'crab status' in {crab_dir_path}: {e.stderr}")

def process_input_list(input_list, work_name, crab_command):
    """
    Process the input list to determine the base directories and execute CRAB commands.
    """
    file_name = os.path.basename(input_list)
    run_period = determine_run_period(file_name)

    is_data = "Data" in file_name or "DATA" in file_name
    base_dir = os.path.join(work_name, run_period, "Data" if is_data else "MC")

    execute_crab_command(base_dir, crab_command)

def determine_run_period(file_name):
    """
    Determine the Run Period from the file name.
    """
    if "2016PreVFP" in file_name:
        return "2016PreVFP"
    elif "2016PostVFP" in file_name:
        return "2016PostVFP"
    elif "2017" in file_name:
        return "2017"
    elif "2018" in file_name:
        return "2018"
    elif "2022" in file_name:
        return "2022"
    else:
        return "Unknown"

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Auto-submit or check CRAB jobs.")
    parser.add_argument("--inputList", required=True, help="Path to the input list file")
    parser.add_argument("--WorkName", required=True, help="Working directory name")
    parser.add_argument("--crabCommand", required=True, choices=["submit", "status"], help="CRAB command to execute")

    args = parser.parse_args()

    input_list = args.inputList
    work_name = args.WorkName
    crab_command = args.crabCommand

    # Check VOMS proxy
    check_voms_proxy()

    # Process input list and execute CRAB commands
    process_input_list(input_list, work_name, crab_command)
