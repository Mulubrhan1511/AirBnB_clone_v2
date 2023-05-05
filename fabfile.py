from fabric.api import local
from datetime import datetime

def do_pack():
    """Create a compressed archive of the web_static directory."""
    now = datetime.now()
    archive_name = "versions/web_static_{}.tgz".format(now.strftime("%Y%m%d%H%M%S"))

    local("mkdir -p versions")
    result = local("tar -czvf {} web_static".format(archive_name))

    if result.failed:
        return None
    else:
        return archive_name