import os
import sys
import subprocess
from values import *
def mirror():
    print("What mirror do you want to use?")
    print("1. SourceForge (faster speed, not always updated)")
    print("2. GitHub (slower speed, always updated)")
    choice = input("Enter 1 or 2: ")
    if choice == '1':
        mirror_url = "https://sourceforge.net/projects/hyprplus-mirror/files/1.0-0.51.1/"
    elif choice == '2':
        mirror_url = "https://github.com/imchocomint/hyprplus/releases/latest/download/"
    else:
        print("Invalid choice. Exiting.")
        sys.exit(1)
    return mirror_url

def choose_to_install():
    global idepks
    global idbpks
    print("Hyprplus comes with many packages.")
    print("Some of which are not necessary (development libraries, debug symbols).")
    print("Do you want to install developement libraries?")
    print("They are required for building Hyprland and such.")
    print("1. Yes")
    print("2. No")
    devchoice = input("Enter 1 or 2: ")
    if devchoice == "1":
        idepks = True
    elif devchoice == "2":
        idepks = False
    else:
        print("Invalid choice. Exiting.")
        sys.exit(1)    
    print("Do you want to install debug symbols?")
    print("They are more convenient to debug in case of anything going wrong.")
    print("1. Yes")
    print("2. No")
    dbgchoice = input("Enter 1 or 2: ")
    if dbgchoice == "1":
        idbpks = True
    elif dbgchoice == "2":
        idbpks = False
    else:
        print("Invalid choice. Exiting.")
        sys.exit(1)

def download():
    subprocess.run(cmd_rm, shell=True)
    subprocess.run(cmd_mkdir, shell=True)
    os.chdir("./hyprplus")
    mirror_url = mirror()
    for pkgs in standard_pkgs:
        subprocess.run(dl_cmd.format(mirror_url=mirror_url + pkgs, pkgs=pkgs), shell=True)
    if idepks:
        os.mkdir("dev")
        os.chdir("dev")
        for pkgs in dev_pkgs:
            subprocess.run(dl_cmd.format(mirror_url=mirror_url + pkgs, pkgs=pkgs), shell=True)
        os.chdir("..")
    if idbpks:
        os.mkdir("dbgsym")
        os.chdir("dbgsym")
        for pkgs in dbgsym_pkgs:
            subprocess.run(dl_cmd.format(mirror_url=mirror_url + pkgs, pkgs=pkgs), shell=True)
        os.chdir("..")

def install_and_fix(packages):
    for pkgs in packages:
        subprocess.run(cmd_install.format(pkgs=pkgs), shell=True)
        subprocess.run(cmd_fixdep, shell=True)
    
    
def install_and_fix_others(dev_pkgs, dbgsym_pkgs):
    global idepks
    global idbpks    
    if idepks:
        subprocess.run("cd dev", shell=True)
        for pkgs in dev_pkgs:
            subprocess.run(cmd_install.format(pkgs=pkgs), shell=True)
            subprocess.run(cmd_fixdep, shell=True)
        subprocess.run("cd ..", shell=True)
    if idbpks:
        subprocess.run("cd dbgsym", shell=True)
        for pkgs in dbgsym_pkgs:
            subprocess.run(cmd_install.format(pkgs=pkgs), shell=True)
            subprocess.run(cmd_fixdep, shell=True)
        subprocess.run("cd ..", shell=True)

def main():
    global idepks
    global idbpks
    print("Welcome to Hyprplus installer!")
    print("---------------------------------------------------------------")
    print("Performing dependencies setup")
    print("---------------------------------------------------------------")
    subprocess.run(cmd_pres, shell=True)
    subprocess.run(cmd_linklib1,shell=True)
    subprocess.run(cmd_linklib2, shell=True)
    choose_to_install()
    download()
    print("Installing packages...")
    install_and_fix(hyprutils_packages)
    install_and_fix(hyprlang_packages)
    install_and_fix(hyprgraphics_packages)
    install_and_fix(hyprcursor_packages)
    install_and_fix(aquamarine_packages)
    install_and_fix(hyprwayland_scanner_packages)
    install_and_fix(hyprland_qtutils_packages)
    install_and_fix(hyprland_qtsupport_packages)
    install_and_fix(hyprland_packages)
    install_and_fix(xdg_desktop_packages)   
    print("Reinstalling installed packages to make sure.") 
    subprocess.run("sudo dpkg -i *.deb", shell=True)
    install_and_fix_others(dev_pkgs, dbgsym_pkgs)
    print("Hyprplus installation done!")
    
if __name__ == "__main__":
    main()
    sys.exit(0)
