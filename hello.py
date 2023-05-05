from fabric import task

@task
def hello_world(ctx):
    print("Hello, world!")