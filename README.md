<p align="center">
  <img src="img/logo.png" alt="Steal all files">
  <h6>Created by Pablo Corbalán</h6>
</p>

Steal all files is a cybersecurity tool that has been designed with the purpose of stealing all the information and the files of a computer using an USB device.

> Can you imagine stealing all the information from someone by simply pluging an USB device
> In his computer? I can, in fact I have just developed the tool for doing it!

### Usage and options
If you want to run the script **without using an USB device** (using the Python interpreter), you can type the following commands:
```shell
# Clone the repository to your computer
git clone https://github.com/pblcc/steal-all-files.git
# Move inside the repository
cd steal-all-files
# Execute the script
python script.py [options]
```
And you can use the following options:
```
-h: Displays help about the app
-l: Displays the license of the app
-p "path": The path to steal the files from (by default the root path of the system)
-o "output": The name of the output file, by default it's the name of the path
-rw: Removes writting permissions
```

### Credits and License
This program has been created by **Pablo Corbalán De Concepción**, you can find me here as [@pblcc](https://github.com/pblcc) or in Twitter as [@pablocorbcon](https://twitter.com/pablocorbcon)

The project has been created **just for eductational purposes**, you can read the whole license of the project in [this file](LICENSE) or by using the `-l` flag when running the application.
```shell
python script.py -l # Displays the License of the application
``
