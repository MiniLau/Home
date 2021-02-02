import os

PATH = '/etc/pihole/setupVars.conf'


def prerequiste():
    assert os.environ['DHCP_START']
    assert os.environ['DHCP_END']
    assert os.environ['DHCP_ROUTER']
    assert os.environ['PI_DOMAIN']

def main():
    with open(PATH, 'r') as file:
        lines = {}
        for line in file.readlines():
            line = line.replace('\n', '')
            if line:
                lines = {line.split('=')[0]: line.split('=')[1]}

    lines['DHCP_ACTIVE'] = 'true'
    lines['DHCP_START'] = os.environ['DHCP_START']
    lines['DHCP_END'] = os.environ['DHCP_END']
    lines['DHCP_ROUTER'] = os.environ['DHCP_ROUTER']
    lines['DHCP_LEASETIME'] = 24
    lines['PIHOLE_DOMAIN'] = os.environ['PI_DOMAIN']
    lines['DHCP_rapid_commit'] = 'true'

    os.remove(PATH)
    with open(PATH, 'w') as file:
        file.writelines([f'{key}={value}\n' for key, value in lines.items()])



if __name__ == '__main__':
    prerequiste()
    main()
