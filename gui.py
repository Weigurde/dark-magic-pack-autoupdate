import tkinter as tk
from tkinter import ttk
import subprocess
import threading

class UpdateApp:
    def __init__(self, root):
        self.root = root
        self.root.title("Update Progress")
        
        self.progress = ttk.Progressbar(root, orient="horizontal", length=300, mode="determinate")
        self.progress.pack(pady=20)
        
        self.start_button = tk.Button(root, text="Start Update", command=self.start_update)
        self.start_button.pack(pady=10)
        
        self.output_text = tk.Text(root, height=10, width=50)
        self.output_text.pack(pady=10)
        
    def start_update(self):
        self.start_button.config(state=tk.DISABLED)
        self.progress.start()
        threading.Thread(target=self.run_update_script).start()
        
    def run_update_script(self):
        process = subprocess.Popen(["updategit.bat"], stdout=subprocess.PIPE, stderr=subprocess.PIPE, shell=True)
        for line in iter(process.stdout.readline, b''):
            self.output_text.insert(tk.END, line.decode('utf-8'))
            self.output_text.see(tk.END)
        process.stdout.close()
        process.wait()
        self.progress.stop()
        self.start_button.config(state=tk.NORMAL)

if __name__ == "__main__":
    root = tk.Tk()
    app = UpdateApp(root)
    root.mainloop()