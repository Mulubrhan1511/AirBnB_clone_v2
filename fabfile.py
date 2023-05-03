from fabric import task

@task
def cat(c, filename):
    result = c.run("cat {}".format(filename))
    print(result.stdout)