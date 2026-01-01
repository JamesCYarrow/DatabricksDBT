In this demo we are going to setup dbt core with databricks

We will start with setting up dbt locally

First we will create a local python enviroment

First confirm we have the below ignore in .gitignore
dbt-venv/

run the below python

python -m venv dbt-venv

Let make sure we can activate it with 

dbt-venv\Scripts\activate

You should see the below change

We will not build this with our requirements.txt


pip install -r requirements.txt

Run the below in the terminal to set up your secrets


$Env:DBT_HOST = '' # without https://
$Env:DBT_PATH = ''
$Env:DBT_TOKEN = ''