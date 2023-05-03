from fabric import Connection, task

# Define the target server's SSH credentials
host = "example.com"
user = "myuser"
key_filename = "/path/to/my/keyfile.pem"

# Define the task to run on the remote server
@task(hosts=[host], user=user, connect_kwargs={"key_filename": key_filename})
def hello_world(c):
    print('hello world')

# Create a connection object
conn = Connection(host=host, user=user, connect_kwargs={"key_filename": key_filename})

# Run the task on the remote server
hello_world(conn)