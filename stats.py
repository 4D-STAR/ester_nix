import subprocess
import re
import matplotlib.pyplot as plt

def get_perf_stats(executable, num_threads):
    cmd = f"OMP_NUM_THREADS={num_threads} perf stat -e instructions,cycles {executable}"
    result = subprocess.run(cmd, stderr=subprocess.PIPE, shell=True, text=True)
    stderr = result.stderr
    instructions = int(re.search(r"(\d+)[ \t]+instructions", stderr).group(1).replace(',', ''))
    cycles = int(re.search(r"(\d+)[ \t]+cycles", stderr).group(1).replace(',', ''))
    time = float(re.search(r"(\d+\.\d+)[ \t]+seconds time elapsed", stderr).group(1))
    ipc = instructions / cycles
    return {"time": time, "ipc": ipc}

    
command = "star1d -noplot -M 5"
#command = "star_evol -noplot -i M5_1d.h5 -nth 1 -age 0.5"
nths = [1, 8]
results = []
for nth in nths:
    print(f"Running perf for {command} and {nth}")
    perf_data = get_perf_stats(command, nth)
    results.append(perf_data)

# Extract data for plotting
times = [res["time"] for res in results]
ipcs = [res["ipc"] for res in results]
print(times, ipcs)

plt.figure(figsize=(10, 5))
plt.bar(nths, times, color=['blue', 'green'])
plt.title('Computational Time Comparison')
plt.ylabel('Time (seconds)')
plt.xlabel('OMP threads')
plt.ylim(0, max(times) * 1.2)
plt.show()

