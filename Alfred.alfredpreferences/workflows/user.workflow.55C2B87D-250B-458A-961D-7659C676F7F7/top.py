import re
import subprocess
# Disable Alfred's leanring 
import uuid

import alfred

def top():
    username = subprocess.check_output('whoami', shell='bash')
    processes = subprocess.check_output('ps -o pid -o %cpu -o rss -o comm -U ' + username.strip('\n') + ' | sort -nk +3 | tail',  shell='bash')
    processes = processes.split('\n')[::-1]
    items = []
    p1 = re.compile(r'\s*(\d+)\s+(\d+[\.|\,]\d+)\s+(\d+)\s+(.*)')
    p2 = re.compile(r'.*?\.app\/')
    for process in processes:
        m = p1.match(process)
        if m is None:
            continue
        process_id, process_cpu, process_mem, process_path = m.groups()
        process_mem = '%.2f' % (int(process_mem) / 1024.0)

        icon = None
        app = p2.match(process_path)
        if app:
            icon = [app.group(), {'type': 'fileicon'}]

        items.append(alfred.Item({'uid': uuid.uuid1().int, 'arg': process_id}, process_path, 'CPU: ' + process_cpu + '% MEM: ' + process_mem + 'MB', icon=icon))

    xml = alfred.xml(items)
    alfred.write(xml)

if __name__ == '__main__':
    top()
