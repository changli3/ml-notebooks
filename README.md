# ml-notebooks
Please refer to [Simple MxNet Server Lab](https://github.com/changli3/ml-mxnet) for starting an AWS Deep Learning instance.

### Step 1. Lauch AWS VM
I have an AWS CF template file [cf.json](https://github.com/changli3/ml-mxnet/blob/master/cf.json) here. You can launch it in the AWS console, or use AWS CLI like below. Remember to download the tempalte file to your computer and change parameters to proper values -
```
aws cloudformation deploy --template-file cf.json --stack-name test-ml --parameter-overrides InstanceSubnet=subnet-2b976000 InstanceSecurityGroup=sg-58e1fc3d KeyPairName=TreaEBSLab
```

### Step 2. SSH to the VM
Once the CF template completed, SSH to it with username "ubuntu" and the key used to launch the template.

### Step 3. Set Jupyter Password
Run the following command -
```
curl -s -L https://raw.githubusercontent.com/changli3/ml-notebooks/master/set-jupyter-pass.sh | bash
```

### Step 4. Launch Jupyter
Run the following commands -
```
export PRIVATEIP=`curl http://169.254.169.254/latest/meta-data/local-ipv4`
source activate python3
jupyter notebook --ip=$PRIVATEIP --port 8081
```
Once the server starts. Browse to http://PRIVATEIP:8081 and enter password: jupyter.
![Login Screen](https://raw.githubusercontent.com/changli3/ml-notebooks/master/jb-login.JPG "Login Screen")


After login, navigate to /tutorials/MXNet/ndarray.ipynb via the file structure (or type in the address)
http://PRIVATEIP:8081/notebooks/tutorials/MXNet/ndarray.ipynb. Now you can run through those code to test the MxNet NdArray example.
![NdArray Screen](https://raw.githubusercontent.com/changli3/ml-notebooks/master/ndarray.JPG "NdArray Screen")

You can kill the server by CTRL+C.

### Step 5. Install JupyterLab
I like JupyterLab better. If you want to use it, install by running the following command: 
```
curl -s -L https://raw.githubusercontent.com/changli3/ml-notebooks/master/install-jupyterlab.sh | bash
```

The script also download bokeh sample and bokeh sample data. You can run through them via the browser UI. Once it is installed, start JupyterLab by -
```
export PRIVATEIP=`curl http://169.254.169.254/latest/meta-data/local-ipv4`
jupyter lab --no-browser --ip=$PRIVATEIP --port 8080
```
Wait for the server starts and then browse to http://PRIVATEIP:8080 and enter password: jupyter. 
![Login Screen](https://raw.githubusercontent.com/changli3/ml-notebooks/master/jl-login.JPG "Login Screen")

JupyterLab has a dashboard screen-
![dashboard](https://raw.githubusercontent.com/changli3/ml-notebooks/master/jl-dash.JPG "dashboard")


You can go through the same ndarray sample as previous, or here you can go to the bokeh samples (bokeh-notebooks then tutorial) and run through the
![bokeh tutorial](https://raw.githubusercontent.com/changli3/ml-notebooks/master/bokeh-tutorial.JPG "bokeh tutorial")

You can also select the theme you like, and test more complicated samples (e.g., tutorials then TensorFlow then keras-tensorflow-mnist.ipynb). It will take some time to run through the 469 epoches of 
![keras-tensorflow-mnist training](https://raw.githubusercontent.com/changli3/ml-notebooks/master/training.JPG "keras-tensorflow-mnist training")



