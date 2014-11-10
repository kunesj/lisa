#!
HOMEDIR="`pwd`"
USER="$(echo `pwd` | sed 's|.*home/\([^/]*\).*|\1|')"

# echo $USER
# touch aa
# sudo -u $USER touch aaa
#
#
# SCRIPT_PATH="${BASH_SOURCE[0]}";
# cd `dirname ${SCRIPT_PATH}` > /dev/null
#cd ../../../../

# 1. deb package requirements
apt-get install -y python git python-dev g++ python-numpy python-scipy python-matplotlib python-sklearn python-skimage python-dicom cython python-yaml sox make python-qt4 python-vtk python-setuptools curl python-pip cmake

# 2. easy_install requirements simpleITK  
easy_install -U SimpleITK mahotas

# 3. pip install our packages pyseg_base and dicom2fem
sudo -u $USER pip install pysegbase dicom2fem sed3 sed3 io3d --user

sudo -u $USER mkdir ~/projects

# 4. install gco_python
sudo -u $USER mkdir ~/projects/gco_python
sudo -u $USER git clone https://github.com/mjirik/gco_python.git ~/projects/gco_python
sudo -u $USER make -C ~/projects/gco_python
sudo -u $USER python ~/projects/gco_python/setup.py --user
# sudo -u $USER cd ..

# 5. skelet3d - optional for Histology Analyser
sudo apt-get install -y cmake python-numpy libinsighttoolkit3-dev libpng12-dev
# sudo -u $USER cd ~/projects
sudo -u $USER mkdir ~/projects/skelet3d
sudo -u $USER mkdir ~/projects/skelet3d/build
sudo -u $USER git clone https://github.com/mjirik/skelet3d.git ~/projects/skelet3d
cd $HOMEDIR
cd projects/skelet3d/build
sudo -u $USER cmake ..
sudo -u $USER make
sudo make install
# sudo -u $USER sh -c "cd ~/projects/skelet3d/build && cmake .. && make"
# sudo -u $USER mkdir build
# sudo -u $USER cd build

# Clone Lisa, make icons
cd ~/projects
sudo -u $USER git clone --recursive -b stable https://github.com/mjirik/lisa.git
cd lisa
sudo -u $USER python mysetup.py -d
sudo -u $USER python mysetup.py -icn

cd $HOMEDIR
# python src/update_stable.py
# python lisa.py $@
