source $HOME/anaconda3/bin/activate
conda install -y -c conda-forge jupyterlab
conda install -y -c conda-forge nodejs 
conda install  -y -c ioam/label/dev holoviews
conda install -y -c bokeh/label/dev datashader
jupyter serverextension enable --py jupyterlab --sys-prefix
jupyter labextension install jupyterlab_bokeh
jupyter labextension install @jupyterlab/vega2-extension
jupyter labextension install @jupyterlab/github

git clone https://github.com/bokeh/bokeh-notebooks.git
bokeh sampledata

echo '{
  "NotebookApp": {
    "password": "sha1:4843948ccfd4:86b19a6c0e7cc7671660782dd6b44eb5edc7f087"
  }
}' | tee $HOME/.jupyter/jupyter_notebook_config.json
